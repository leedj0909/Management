package com.spring.management;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.JSONResult;
import com.spring.dto.MemberDTO;
import com.spring.dto.MemoDTO;
import com.spring.service.MemoService;
@Controller
@RequestMapping("/memo/*")
public class MemoController {

	@Autowired
	private MemoService msvc;


	@GetMapping(value = "/calender")
	public String calendar(@ModelAttribute("memoDTO") MemoDTO memoDTO, Model model, HttpSession session, 
			RedirectAttributes attr) {
		if(memoDTO.getNow_date() == null || "".equals(memoDTO.getNow_date())) {
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String nowDate = sdf.format(now);
			memoDTO.setNow_date(nowDate);
		}
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		if(login == null) {
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}
		memoDTO.setMember_no(login.getMember_no());
		List<MemoDTO> memoList = msvc.findmemoList(memoDTO);
		model.addAttribute("memoList", memoList);
		return "memo/calendar";
	}
	
	@PostMapping("/memo/ajaxInsert")
	public String calendarAjaxInsert(@ModelAttribute("memoDTO") MemoDTO memoDTO, Model model, HttpSession session, RedirectAttributes attr) throws ParseException {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		if(login == null) {
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}
		memoDTO.setMember_no(login.getMember_no());
		msvc.insertMemo(memoDTO);
		
		return "/memo/calendar";
	}
}
