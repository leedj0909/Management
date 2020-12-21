package com.spring.management;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.BoardDTO;
import com.spring.dto.MemberDTO;
import com.spring.dto.PagingMaker;
import com.spring.dto.SearchCriteria;
import com.spring.service.BoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/bmm/*")
public class BoardController {
	
	  private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService bsvc;
	
    // 전체 리스트 뿌리기 + 개인 게시판 else~if문으로 dao,service 추가해 따로따로 구분지어놓기
	@GetMapping(value = "/{board_gubunCode}/pageList")
	public String list(@ModelAttribute("sc") SearchCriteria sc, Model model,
			@PathVariable("board_gubunCode") String board_gubunCode, HttpSession session,
			 RedirectAttributes attr) throws Exception {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		// 변수를 선언해서 디버깅할때 원하는 값을 받기 위해서 담아주는 습관을 가져야함.
		List<BoardDTO> list = null;
		int count = 0;
		
		// 게시판 구분코드가 null이 아니거나 공백이 아니면..
		if(board_gubunCode != null && !board_gubunCode.equals("")) {
			// 게시판 구분코드가 P이면..
			if(board_gubunCode.equals("P")) {
				// 로그인값이 null이면 로그인폼으로 보내라
				if(login == null) {
					attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
					return "redirect:/login/loginForm";
				}
				// 로그인했을때의 member_no를 sc에 넣어줌
				sc.setMember_no(login.getMember_no());
				// 게시판 구분코드가 P이면 personListSearch Mapper.xml를 이용하여 list에 넣어줌
				list = bsvc.personListSearch(sc);
				count = bsvc.personSearchCountData(sc);
			}else
				// 게시판 구분코드가 P가 아니면 listSearch Mapper.xml를 이용하여 list에 넣어줌
				list = bsvc.listSearch(sc);
				count = bsvc.searchCountData(sc);
		}
		model.addAttribute("list", list);
		PagingMaker pMaker = new PagingMaker();
		pMaker.setCri(sc);
		
		pMaker.setTotalData(count);
		
		model.addAttribute("pagingMaker", pMaker);
		model.addAttribute("board_gubunCode", board_gubunCode);
		return "bmm/pageList";
	}
	
//	// 전체 페이지 리스트 + 개인게시판 Mapper를 통한 컨트롤러 활용. 장점 : 소스를 줄임.. 단점 : 확장성이 떨어짐(추후 수정사항이 생기면 코드변경이 어려워짐)
//	@GetMapping(value = "/{board_gubunCode}/pageList")
//	public String list(@ModelAttribute("sc") SearchCriteria sc, Model model,
//			@PathVariable("board_gubunCode") String board_gubunCode, HttpSession session,
//			 RedirectAttributes attr) throws Exception {
//		
//		MemberDTO login = (MemberDTO) session.getAttribute("login");
//		
//		
//		// 구분코드가 null이 아니거나 공백이 아니면..
//		if(board_gubunCode != null && !board_gubunCode.equals("")) {
//			// 구분코드가 P이면..
//			if(board_gubunCode.equals("P")) {
//				// 로그인값이 null이면 로그인폼으로 보내라
//				if(login == null) {
//					attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
//					return "redirect:/login/loginForm";
//				}
//				// 로그인했을때의 member_no를 sc에 넣어줌
//				sc.setMember_no(login.getMember_no());
//			}
//		}
//		
//		// 변수를 선언해서 디버깅할때 원하는 값을 받기 위해서 담아주는 습관을 가져야함.
//		List<BoardDTO> list = bsvc.listSearch(sc);
//		int count = bsvc.searchCountData(sc);
//		
//		model.addAttribute("list", list);
//		PagingMaker pMaker = new PagingMaker();
//		pMaker.setCri(sc);
//		
//		pMaker.setTotalData(count);
//		
//		model.addAttribute("pagingMaker", pMaker);
//		model.addAttribute("board_gubunCode", board_gubunCode);
//		return "bmm/pageList";
//	}
	

	// read 페이지
	@GetMapping(value = "/{board_gubunCode}/readPage")
	public String readPage(@RequestParam("board_no") int board_no, @ModelAttribute("sc") SearchCriteria sc, Model model,
			@PathVariable("board_gubunCode") String board_gubunCode) throws Exception {
		BoardDTO read = bsvc.read(board_no);
		model.addAttribute(read);
		model.addAttribute("board_gubunCode", board_gubunCode);
		bsvc.board_readcnt(board_no);
		return "bmm/readPage";
	}
	
	@GetMapping(value = "/{board_gubunCode}/write")
	public String writeGet(BoardDTO bdto, Model model, HttpSession session, RedirectAttributes attr, 
			@PathVariable("board_gubunCode") String board_gubunCode) throws Exception {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		if(login == null) {
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}
		return "bmm/write";
	}
	
	@PostMapping(value = "/{board_gubunCode}/write")
	public String writePost(BoardDTO bdto, HttpSession session, RedirectAttributes attr, 
			@PathVariable("board_gubunCode") String board_gubunCode) throws Exception {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		if(login == null) {
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}
		bdto.setMember_no(login.getMember_no());
		bdto.setBoard_gubunCode(board_gubunCode);
		bsvc.writer(bdto);
		return "redirect:/bmm/"+board_gubunCode+"/pageList";
	}
	
	
	// 수정 페이지
	@GetMapping(value = "/{board_gubunCode}/modifyPage")
	public String modifyGet(@RequestParam("board_no") int board_no, RedirectAttributes attr, Model model, 
			HttpSession session, @PathVariable("board_gubunCode") String board_gubunCode, @ModelAttribute("sc") SearchCriteria sc) throws Exception {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		BoardDTO boardDTO = bsvc.read(board_no);
		if(login == null) {
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}
		else {
			// 로그인했을때 회원정보와 게시판 글의 회원정보가 같지 않으면 로그인폼으로.
			if(login.getMember_no() != boardDTO.getMember_no()) {
				attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
				return "redirect:/login/loginForm";
			}
		}
		model.addAttribute("boardDTO" , boardDTO);
		model.addAttribute("board_gubunCode", board_gubunCode);
		return "bmm/modifyPage";
	}
	
	// 수정누르면 이루어지는 코드
	@PostMapping(value = "/{board_gubunCode}/modifyPage")
	public String modifyPost(BoardDTO bdto, @ModelAttribute("sc") SearchCriteria sc, HttpSession session, RedirectAttributes attr , 
			@PathVariable("board_gubunCode") String board_gubunCode) throws Exception {
			
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		BoardDTO boardDTO = bsvc.read(bdto.getBoard_no());
		
		if(login == null) {
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}else {
			if(login.getMember_no() != boardDTO.getMember_no()) {
				attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
				return "redirect:/login/loginForm";
			}
		}
		bsvc.modify(bdto);
		attr.addAttribute("page", sc.getPage());
		attr.addAttribute("numPerPage", sc.getNumPerPage());
		attr.addAttribute("searchtype", sc.getSearchType());
		attr.addAttribute("keyword", sc.getKeyword());
		attr.addFlashAttribute("result", "modifySyccess");
		return "redirect:/bmm/"+board_gubunCode+"/pageList";
	}
	
	@GetMapping(value = "/{board_gubunCode}/delPage")
	public String delPage(@RequestParam("board_no") int board_no, SearchCriteria sc, HttpSession session,
			RedirectAttributes attr, @PathVariable("board_gubunCode") String board_gubunCode) throws Exception {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		BoardDTO boardDTO = bsvc.read(board_no);
		if(login == null) {
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}else {
			if(login.getMember_no() != boardDTO.getMember_no()) {
				attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
				return "redirect:/login/loginForm";
			}
		}
		// 서비스 접근해서 remove
		bsvc.remove(board_no);
		// page, numPerPage, searchType, keyword ... 다 가지고 있어야함
		attr.addAttribute("page", sc.getPage());
		attr.addAttribute("numPerPage", sc.getNumPerPage());
		attr.addAttribute("searchType", sc.getSearchType());
		attr.addAttribute("keyword", sc.getKeyword());
		attr.addFlashAttribute("result", "delSuccess");
		return "redirect:/bmm/"+board_gubunCode+"/pageList";
	}
}




