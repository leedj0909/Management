package com.spring.management;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.MemberDTO;
import com.spring.service.LoginService;

@Controller
@RequestMapping("/login/*")
public class LoginController {
	
	@Inject
	private LoginService lsvc;
	
	// 1. 로그인 페이지로 이동하는 요청 처리
	// 로그인 페이지로 단순 이동
		@GetMapping(value = "/loginForm")
		public String goLoginForm(MemberDTO mdto, HttpSession session) {
			
			MemberDTO login = (MemberDTO) session.getAttribute("login");
			
			if(login != null) {
				return "redirect:/";
			}
			return "/login/loginForm";
		}

		// 2. 로그인 요청 처리
		// 사용자가 입력한 id와 pw를 가져와서 일치한 데이터가 있으면 !null, 없으면 null
		@PostMapping(value = "/loginPost")
		public String login(MemberDTO mdto, Model model, RedirectAttributes attr, HttpSession session) {
			// 1) 서비스 로그인 함수 실행
			MemberDTO login = lsvc.login(mdto);
			
			if(login.getMember_password().equals(mdto.getMember_password())) {
				session.setAttribute("login", login);
				attr.addFlashAttribute("message", "로그인되었습니다.");
				return "redirect:/";
			}
				attr.addFlashAttribute("message", "아이디와 비밀번호를 확인해주세요.");
				return "redirect:/login/loginForm";
		}
			
		// 3. 로그아웃 처리 -> 세션 초기화 해야함
		@GetMapping(value = "/logout")
		public String logout(HttpSession session, HttpServletRequest request) {
			
			session = request.getSession(false);
			// 1) 세션 초기화
			session.invalidate();
			// 2) 메인 페이지로 리다이렉트
			return "redirect:/login/loginForm";
		}

		// 4. 회원 가입 페이지로 이동 요청 처리
		@GetMapping(value = "/register")
		public void goRegister() {
		}

		// 5. 회원 가입 처리
		@PostMapping(value = "/register")
		public String register(MemberDTO mdto, RedirectAttributes attr) {

			int result = lsvc.register(mdto);
			
			attr.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
			
			return "redirect:/login/loginForm";
		}

	
	/*
	 * @GetMapping(value = "/loginForm") public String loginForm(HttpSession
	 * session, HttpServletRequest request, Model model) throws Exception {
	 * 
	 * // 세션을 사용한다는 의미 즉, 세션 데이터를 부를 모든 컨트롤러는 해당 내용 입력 session =
	 * request.getSession();
	 * 
	 * // 만약 계정이 없어서 이 페이지로 다시 돌아왔다면 if (session.getAttribute("errMsg") != null) {
	 * // alert을 띄우기 위해 해당 데이터를 전달한다. model.addAttribute("errMsg",
	 * session.getAttribute("errMsg"));
	 * 
	 * } // session을 초기화 하겠다. session.invalidate();
	 * 
	 * return "/login/loginForm"; }
	 * 
	 * @PostMapping(value = "/login") public String login(HttpSession session,
	 * HttpServletRequest request, LoginDTO ldto) throws Exception { // ID와 PWD를 넣고,
	 * 계정이 있다면 데이터가 들어가고 // 계정이 없다면 null 이나 "" 빈공백이 들어간다. String cnt =
	 * lsvc.cnt(ldto);
	 * 
	 * // 세션을 사용한다는 의미 즉, 세션 데이터를 부를 모든 컨트롤러는 해당 내용 입력 session =
	 * request.getSession();
	 * 
	 * // 만약 계정이 존재하지 않는다면. if (Integer.parseInt(cnt) == 0) {
	 * session.setAttribute("errMsg", "계정명과 비밀번호를 확인해주세요."); } // 만약 계정이 존재한다면. else
	 * if (Integer.parseInt(cnt) == 1) { LoginDTO list = lsvc.read(ldto);
	 * session.setAttribute("member_id", list.getMember_id());
	 * 
	 * return "redirect:/bmm/pageList"; } // 해당 계정이 너무 많다면 (DB에 데이터가 잘못 들어간거겠죠?
	 * 중복데이터니까) else if (Integer.parseInt(cnt) > 1) { session.setAttribute("errMsg",
	 * "계정이 너무 많습니다."); }
	 * 
	 * return "redirect:/login/loginForm"; }
	 * 
	 * @GetMapping(value = "/logout") public String logout(HttpSession session,
	 * HttpServletRequest request) throws Exception {
	 * 
	 * // 세션 객체를 불러온다. 세션이 없으면 생성하지 않는다. session = request.getSession(false);
	 * 
	 * // 모든 세션을 삭제한다. session.invalidate();
	 * 
	 * return "redirect:/login/loginForm"; }
	 */
}







