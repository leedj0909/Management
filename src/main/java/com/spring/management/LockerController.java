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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.LockerDTO;
import com.spring.dto.MemberDTO;
import com.spring.dto.PagingMaker;
import com.spring.dto.SearchCriteria;
import com.spring.service.LockerService;

@Controller
@RequestMapping("/locker/*")
public class LockerController {
	
	@Inject
	private LockerService lsvc;
	
	@GetMapping(value = "/lockerList")
	public String lockerList(Model model, @ModelAttribute("sc") SearchCriteria sc, HttpSession session, RedirectAttributes attr) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		// 로그인 값이 null, 안됬으면 로그인폼으로
		if(login == null) {
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}
		List<LockerDTO> lockerlist = lsvc.listSearch(sc);
		int count = lsvc.searchCount(sc);
		
		model.addAttribute("lockerlist", lockerlist);
		PagingMaker pMaker = new PagingMaker();
		pMaker.setCri(sc);
		pMaker.setTotalData(count);
		
		model.addAttribute("pagingMaker", pMaker);

		return "locker/lockerList";
	}
	
	@GetMapping(value = "/write")
	public String writeGet(RedirectAttributes attr, HttpSession session) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		if(login == null) {
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}
		
		return "locker/write";
	}
	
	@PostMapping(value = "/write")
	public String writePost(LockerDTO ldto, HttpSession session, RedirectAttributes attr) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		if(login == null) {
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}
		
		ldto.setMember_no(login.getMember_no());
		// 조회쿼리 돌림
		int count = lsvc.countLocker(ldto);
		if(count < 1) {
			lsvc.updateLocker(ldto);
		}else {
			attr.addFlashAttribute("message", "이미 사용중인 회원입니다.");
			return "redirect:/locker/lockerList";
		}
		return "redirect:/locker/lockerList";
	}
	
	@GetMapping(value = "/readPage")
	public String lockerreadPage(@ModelAttribute("lockerDTO") LockerDTO lockerDTO, @ModelAttribute("sc") SearchCriteria sc, Model model ) throws Exception {
		
		LockerDTO read = lsvc.read(lockerDTO.getLocker_no());
		
		model.addAttribute(read);
		
		return "locker/readPage";
	}
	
	@GetMapping(value = "/delPage")
	public String modify(LockerDTO ldto, @ModelAttribute("sc") SearchCriteria sc, RedirectAttributes attr, HttpSession session ) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		if(login == null) {
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}
		
		lsvc.modifyLocker(ldto);
		
		attr.addAttribute("page", sc.getPage());
		attr.addAttribute("numPerPage", sc.getNumPerPage());
		attr.addAttribute("searchtype", sc.getSearchType());
		attr.addAttribute("keyword", sc.getKeyword());
		
		return "redirect:/locker/lockerList";
	}

}

