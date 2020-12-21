package com.spring.management;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.MemberDTO;
import com.spring.dto.PagingMaker;
import com.spring.dto.SearchCriteria;
import com.spring.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	private MemberService msvc;
	
	
	@GetMapping(value = "/memberList")
	public String memberList(Model model, MemberDTO mdto, @ModelAttribute("sc") SearchCriteria sc, 
			HttpSession session, RedirectAttributes attr) throws Exception {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		List<MemberDTO> memberlist = null;
		int count = 0;
		// 로그인 값이 null, 안됬으면 로그인폼으로
		if(login == null) {
			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
			return "redirect:/login/loginForm";
		}
		// 로그인했을때 code가 'U'가 아닌 'S'인 사람(관리자)이면
		if(login.getMember_code().equals("S")) {
			memberlist = msvc.listSearch(sc);
			count = msvc.searchCountData(sc);
			}else {
				if(!login.getMember_code().equals("S")) {
					attr.addFlashAttribute("adminmessage", "관리자만 접근 가능한 메뉴입니다.");
					return "redirect:/";
				}
			}
			model.addAttribute("memberlist", memberlist);
			PagingMaker pMaker = new PagingMaker();
			pMaker.setCri(sc);
			pMaker.setTotalData(count);
			model.addAttribute("pagingMaker", pMaker);
			return "member/memberList";
		}
	
	@GetMapping(value = "/readPage")
	public String memberreadPage(@ModelAttribute("memberDTO") MemberDTO memberDTO, @ModelAttribute("sc") SearchCriteria sc, Model model ) throws Exception {
		
		MemberDTO read = msvc.read(memberDTO.getMember_no());
		model.addAttribute(read);
		return "member/readPage";
	}
	
	@PostMapping(value = "/modifyPage")
	public String modify(MemberDTO mdto, @ModelAttribute("sc") SearchCriteria sc, RedirectAttributes attr, HttpSession session) throws Exception {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		if(!login.getMember_code().equals("S")) {
			attr.addFlashAttribute("adminmessage", "관리자만 접근 가능한 메뉴입니다.");
			return "redirect:/";
		}
		msvc.modify(mdto);
		attr.addAttribute("page", sc.getPage());
		attr.addAttribute("numPerPage", sc.getNumPerPage());
		attr.addAttribute("searchtype", sc.getSearchType());
		attr.addAttribute("keyword", sc.getKeyword());
		attr.addFlashAttribute("result", "modifySyccess");
		return "redirect:/member/memberList";
	}
	
	@PostMapping(value = "/addMonth")
	// 자바객체를 HTTP 응답 본문(body)을 객체로 변환해서 클라이언트에게 전송
	@ResponseBody
	public MemberDTO addMonth(@ModelAttribute("memberDTO") MemberDTO memberDTO, @ModelAttribute("sc") SearchCriteria sc, Model model ) throws Exception {
		//Calendar는 자바에서 날짜와 시간에 관한 데이터를 손쉽게 처리할 수 있도록 제공하는 추상 클래스
		//Calendar 클래스는 추상 클래스이므로 객체를 직접 생성할 수는 없지만, 
		//getInstance() 메소드를 이용하여 시스템의 날짜와 시간 정보를 표현할 수 있다
		Calendar cal = Calendar.getInstance();
		// 날짜를 원하는 포맷으로 파싱시켜주는 역할(y,M,d,H(24시간),h,m,s)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String startDate = "";
		String endDate = "";
		// 만약 첫번째 달력 선택칸이 null이거나 공백이면...
		if(memberDTO.getAddStartDate() == null || "".equals(memberDTO.getAddStartDate())) {
			// sdf(SimpleDateFormat) 안에 현재시간(날짜)를 넣어줌
			// cal.getTime() -> 현재시간을 구해올 수 있음.
			startDate = sdf.format(cal.getTime());
			// 위에 startDate에 담긴 현재 날짜(시간)을 setAddStartDate에 넣어준다.
			memberDTO.setAddStartDate(startDate);
		}else {
			//parse -> 역으로 문자열 형식의 날짜로부터 Date객체를 생성시킬 수 있음
			// getAddStartDate안의 형식을 SimpleDateFormat의 형식으로 변환해서 넣어줌
			cal.setTime(sdf.parse(memberDTO.getAddStartDate())); // 날짜설정
		}
		// 만약 addMonth(form에 -개월)의 숫자가 null이 아니거나 공백이 아니면...
		if(memberDTO.getAddMonth() != null && !"".equals(memberDTO.getAddMonth())) {
			// getAddMonth String형식이기 때문에 int형으로 형변환 시켜줬음. 캘린더에 추가시킬때 int형식으로 더해줘야함
			int addMonthInt = Integer.parseInt(memberDTO.getAddMonth());
			// cal에 넣어줘야 하는데 어떤식으로 넣을껀가 MONTH(월단위)로 하겠다.
			// 월에 + AddMonth의 지정된 값을 추가해서 앞에서의 조건문에 맞게 1이면 1개월 2이면 2개월해서 더해줌
			cal.add(Calendar.MONTH, addMonthInt); // 날짜설정한 값에 넘겨온 addMonth 를 더해줌.
			// cal.getTime() -> 현재시간을 구해올 수 있음.
			endDate = sdf.format(cal.getTime()); // 더한날짜를 날짜형식으로 변환.
			memberDTO.setAddEndDate(endDate);
		}
		return memberDTO;
	}
	
//	@PostMapping(value = "/addMonth")
//	@ResponseBody
//	public MemberDTO addMonth(@ModelAttribute("sc") SearchCriteria sc, @ModelAttribute("memberDTO") MemberDTO memberDTO, Model model) throws Exception {
//		Calendar cal = Calendar.getInstance();
//		SimpleDateFormat sdf = new SimpleDateFormat();
//		String startDate = "";
//		String endDate = "";
//		
//		if(memberDTO.getAddStartDate() == null || "".equals(memberDTO.getAddStartDate())){
//			startDate = sdf.format(cal.getTime());
//			memberDTO.setAddStartDate(startDate);
//		}else {
//			cal.setTime(sdf.parse(memberDTO.getAddStartDate()));
//		}
//		if(memberDTO.getAddMonth() != null && "".equals(memberDTO.getAddMonth())) {
//			int addMonthint = Integer.parseInt(memberDTO.getAddMonth());
//			cal.add(Calendar.MONTH, addMonthint);
//			endDate = sdf.format(cal.getTime());
//			memberDTO.setAddEndDate(endDate);
//		}
//		
//		return memberDTO;
//	}

}












