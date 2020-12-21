package com.spring.management;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.MemberDTO;
import com.spring.dto.MessageDTO;
import com.spring.dto.PagingMaker;
import com.spring.dto.SearchCriteria;
import com.spring.service.MessageService;

@Controller
@RequestMapping("/message/*")
public class MessageController {
	
	@Inject
	private MessageService msvc;
	
	//받은 쪽지함 리스트
	// get - 데이터 빼내옴, set - 데이터를 입력함
	@GetMapping(value = "/messageList")
	public String list(@ModelAttribute("sc") SearchCriteria sc, Model model, HttpSession session,
			RedirectAttributes attr) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		if(login == null){
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}
		
		sc.setMember_no(login.getMember_no());
		List<MessageDTO> list = msvc.listSearch(sc);
		int count = msvc.searchCountDate(sc);
		
		
		model.addAttribute("list", list);
		PagingMaker pMaker = new PagingMaker();
		pMaker.setCri(sc);
		pMaker.setTotalData(count);
		
		model.addAttribute("pagingMaker", pMaker);
		
		return "message/messageList";
		
	}
	
	@GetMapping(value = "/readPage")
	public String readPage(@ModelAttribute("messageDTO") MessageDTO messageDTO, @ModelAttribute("sc") SearchCriteria sc, Model model) {
		
		MessageDTO read = msvc.read(messageDTO.getMessage_no());
		
		model.addAttribute(read);
		
		return "message/readPage";
		
	}
	
	@GetMapping(value = "/write")
	public String writeGet(MessageDTO mdto, Model model, HttpSession session, RedirectAttributes attr) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		if(login == null){
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}
		
		return "message/write";
	}
	
	@PostMapping(value = "/write")
	public String writePost(MessageDTO mdto, HttpSession session, RedirectAttributes attr) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		if(login == null){
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}
		// 메세지 보낸 사람 no가 로그인했을때 no랑 같으니까 보내줌
		mdto.setMessage_send_no(login.getMember_no());
		// 배열로 받은 숫자를 split를 통해 콤마(,)단위로 짤라서 [] 넣어줌
		String[] splitNo = mdto.getMessage_recevice_no_temp().split(",");
		// for문을 통해 위에 넣은 []안의 수 만큼 실행
		// no는 임의로 만들어 주는 거임 -> splitNo에 있는 값만큼 for문 수행
		for(String no : splitNo) {
			//for문을 통해 출력된 숫자를 원하는 곳에 입력해줘야 하니까 set을 통해 불러와서 안에다가 값을 넣어준다.
			// 이때 no는 integer로 되있고, for문의 값은 String이기때문에 형변환을 통해서 값을 넣어준다.
			mdto.setMessage_recevice_no(Integer.parseInt(no));
			// 출력된 값을 writer 쿼리문을 통해 나온 값의 수 만큼 insert를 하여 출력한다. 
			msvc.writer(mdto);
		}
		
		return "redirect:/message/messageList";
	}
	
	@GetMapping(value = "/replyPage")
	public String replyGet(@ModelAttribute("messageDTO") MessageDTO messageDTO, Model model ,MessageDTO mdto, HttpSession session, RedirectAttributes attr) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		MessageDTO read = msvc.read(messageDTO.getMessage_no());
		
		
		if(login == null){
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}
		
		model.addAttribute(read);
		
		return "message/replyPage";
	}
	
	@PostMapping(value = "/replyPage")
	public String replyPost(@ModelAttribute("messageDTO") MessageDTO messageDTO, MessageDTO mdto, HttpSession session, RedirectAttributes attr) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		MessageDTO read = msvc.read(messageDTO.getMessage_no());
		
		if(login == null){
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}
		
		mdto.setMessage_send_no(login.getMember_no());
		mdto.setMessage_recevice_no(read.getMessage_send_no());
		
		msvc.writer(mdto);
		
		return "redirect:/message/messageList";
	}
	
	
	@GetMapping(value = "/member")
	public String memberList(Model model, MemberDTO mdto, @ModelAttribute("sc") SearchCriteria sc) {
		
		List<MemberDTO> memberList = msvc.memberList(sc);
		int count = msvc.membercountData(sc);
		
		model.addAttribute("memberList", memberList);
		PagingMaker pMaker = new PagingMaker();
		pMaker.setCri(sc);
		pMaker.setTotalData(count);
		
		model.addAttribute("pagingMaker", pMaker);
		
		return "/message/member";
	}
	
	@GetMapping(value = "/delPage")
	public String delPage(@ModelAttribute("messageDTO") MessageDTO messageDTO, SearchCriteria sc, RedirectAttributes attr, HttpSession session) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		if(login == null){
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}
		
		msvc.delete(messageDTO.getMessage_no());
		
		attr.addAttribute("page", sc.getPage());
		attr.addAttribute("numPerPage", sc.getNumPerPage());
		attr.addAttribute("searchType", sc.getSearchType());
		attr.addAttribute("keyword", sc.getKeyword());
		
		attr.addFlashAttribute("result", "delSuccess");
		
		
		return "redirect:/message/messageList";
	}
	
	@GetMapping(value = "sendList")
	public String sendList(@ModelAttribute("sc") SearchCriteria sc, Model model, HttpSession session,
			RedirectAttributes attr) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		if(login == null){
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}
		
		sc.setMember_no(login.getMember_no());
		List<MessageDTO> slist = msvc.sendList(sc);
		int count = msvc.sendCountData(sc);
		
		model.addAttribute("slist", slist);
		PagingMaker pMaker = new PagingMaker();
		pMaker.setCri(sc);
		pMaker.setTotalData(count);
		
		model.addAttribute("pagingMaker", pMaker);
		
		return "message/sendList";
	}
	
	@GetMapping(value = "/sendreadPage")
	public String sendreadPage(@ModelAttribute("messageDTO") MessageDTO messageDTO, @ModelAttribute("sc") SearchCriteria sc, Model model) {
		
		MessageDTO read = msvc.sendread(messageDTO);
		
		model.addAttribute(read);
		
		return "message/sendreadPage";
		
	}
	
	
}
















