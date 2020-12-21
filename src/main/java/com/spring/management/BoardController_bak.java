//package com.spring.management;
//
//import java.util.List;
//
//import javax.inject.Inject;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.spring.dto.BoardDTO;
//import com.spring.dto.MemberDTO;
//import com.spring.dto.PagingMaker;
//import com.spring.dto.SearchCriteria;
//import com.spring.service.BoardService;
//
//@Controller
//@RequestMapping("/bmm/*")
//public class BoardController_bak {
//	
	/*
	 * private static final Logger logger =
	 * LoggerFactory.getLogger(BoardController.class);
	 */
	
//	@Inject
//	private BoardService bsvc;
	
//	// 전체 페이지 리스트
//	@GetMapping(value = "/{board_gubunCode}/pageList")
//	public String list(@ModelAttribute("sc") SearchCriteria sc, Model model,
//			@PathVariable("board_gubunCode") String board_gubunCode, HttpSession session,
//			 RedirectAttributes attr) throws Exception {
//		
//		
//		MemberDTO login = (MemberDTO) session.getAttribute("login");
//		
//		
//		if(board_gubunCode != null && !board_gubunCode.equals("")) {
//			if(board_gubunCode.equals("P")) {
//				if(login == null) {
//					attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
//					return "redirect:/login/loginForm";
//				}
//				sc.setMember_no(login.getMember_no());			
//			}
//		}
//		List<BoardDTO> list = bsvc.listSearch(sc);
//		int count = bsvc.searchCountData(sc);
//		
//		model.addAttribute("list", list);
//		PagingMaker pMaker = new PagingMaker();
//		pMaker.setCri(sc);
//		
//		
//		
//		pMaker.setTotalData(count);
//		
//		model.addAttribute("pagingMaker", pMaker);
//		model.addAttribute("board_gubunCode", board_gubunCode);
//		return "bmm/pageList";
//	}
//	
////	// 전체 페이지 리스트
////		@GetMapping(value = "/pageList")
////		public String Personlist(@ModelAttribute("sc") SearchCriteria sc, Model model, HttpSession session,
////				@PathVariable("board_gubunCode") String board_gubunCode) throws Exception {
////			
////			// 개인게시판 작성자만 보여야되니까 login 정보를 넘겨서 이용??
////			MemberDTO login = (MemberDTO) session.getAttribute("login");
////			
////			if(login == null) {
////				return "redirect:/login/loginForm";
////			}
////			
////			List<BoardDTO> list = bsvc.listSearch(sc);
////			
////			model.addAttribute("login", login);
////			model.addAttribute("list", list);
////			PagingMaker pMaker = new PagingMaker();
////			pMaker.setCri(sc);
////			
////			pMaker.setTotalData(bsvc.searchCountData(sc));
////			
////			model.addAttribute("pagingMaker", pMaker);
////			return "bmm/pageList";
////		}
//	
//	// read 페이지
//	@GetMapping(value = "/{board_gubunCode}/readPage")
//	public String readPage(@RequestParam("board_no") int board_no, @ModelAttribute("sc") SearchCriteria sc, Model model,
//			@PathVariable("board_gubunCode") String board_gubunCode) throws Exception {
//		
//		BoardDTO read = bsvc.read(board_no);
//		
//		model.addAttribute(read);
//		model.addAttribute("board_gubunCode", board_gubunCode);
//		bsvc.board_readcnt(board_no);
//		
//		return "bmm/readPage";
//	}
//	
//	@GetMapping(value = "/{board_gubunCode}/write")
//	public String writeGet(BoardDTO bdto, Model model, HttpSession session, RedirectAttributes attr, @PathVariable("board_gubunCode") String board_gubunCode) throws Exception {
//		MemberDTO login = (MemberDTO) session.getAttribute("login");
//		
//		if(login == null) {
//			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
//			return "redirect:/login/loginForm";
//		}
//		return "bmm/write";
//	}
//	
//	@PostMapping(value = "/{board_gubunCode}/write")
//	public String writePost(BoardDTO bdto, HttpSession session, RedirectAttributes attr, @PathVariable("board_gubunCode") String board_gubunCode) throws Exception {
//		
//		MemberDTO login = (MemberDTO) session.getAttribute("login");
//		
//		if(login == null) {
//			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
//			return "redirect:/login/loginForm";
//		}
//		
//		bdto.setMember_no(login.getMember_no());
//		bdto.setBoard_gubunCode(board_gubunCode);
//		bsvc.writer(bdto);
//		return "redirect:/bmm/"+board_gubunCode+"/pageList";
//	}
//	
//	
//	// 수정 페이지
//	@GetMapping(value = "/{board_gubunCode}/modifyPage")
//	public String modifyGet(@RequestParam("board_no") int board_no, Model model, @ModelAttribute("sc") SearchCriteria sc, 
//			HttpSession session, RedirectAttributes attr, @PathVariable("board_gubunCode") String board_gubunCode) throws Exception {
//		
//		MemberDTO login = (MemberDTO) session.getAttribute("login");
//		
//		BoardDTO boardDTO = bsvc.read(board_no);
//		
//		if(login == null) {
//			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
//			return "redirect:/login/loginForm";
//		}
//		else {
//			if(login.getMember_no() != boardDTO.getMember_no()) {
//				attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
//				return "redirect:/login/loginForm";
//			}
//		}
//		
//		
//		model.addAttribute("boardDTO" , boardDTO);
//		model.addAttribute("board_gubunCode", board_gubunCode);
//		
//		return "/bmm/modifyPage";
//	}
//	
//	// 수정누르면 이루어지는 코드
//	@PostMapping(value = "/{board_gubunCode}/modifyPage")
//	public String modifyPost(BoardDTO bdto, SearchCriteria sc, RedirectAttributes reAttr, HttpSession session, RedirectAttributes attr, 
//			@PathVariable("board_gubunCode") String board_gubunCode) throws Exception {
//			
//		MemberDTO login = (MemberDTO) session.getAttribute("login");
//		
//		BoardDTO boardDTO = bsvc.read(bdto.getBoard_no());
//		
//			
//		if(login == null) {
//			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
//			return "redirect:/login/loginForm";
//		}else {
//			if(login.getMember_no() != boardDTO.getMember_no()) {
//				attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
//				return "redirect:/login/loginForm";
//			}
//		}
//		
//		bsvc.modify(bdto);
//		
//		reAttr.addAttribute("page", sc.getPage());
//		reAttr.addAttribute("numPerPage", sc.getNumPerPage());
//		reAttr.addAttribute("searchtype", sc.getSearchType());
//		reAttr.addAttribute("keyword", sc.getKeyword());
//		
//		reAttr.addFlashAttribute("result", "modifySyccess");
//		
//		
//		return "redirect:/bmm/"+board_gubunCode+"/pageList";
//	}
//	
//	@GetMapping(value = "/{board_gubunCode}/delPage")
//	public String delPage(@RequestParam("board_no") int board_no, SearchCriteria sc, RedirectAttributes reAttr, HttpSession session, RedirectAttributes attr,
//			 @PathVariable("board_gubunCode") String board_gubunCode) throws Exception {
//		
//		MemberDTO login = (MemberDTO) session.getAttribute("login");
//		
//		BoardDTO boardDTO = bsvc.read(board_no);
//		
//		if(login == null) {
//			attr.addFlashAttribute("message", "로그인이 필요한 기능입니다.");
//			return "redirect:/login/loginForm";
//		}else {
//			if(login.getMember_no() != boardDTO.getMember_no()) {
//				return "redirect:/login/loginForm";
//			}
//				
//		}
//		
//		// 서비스 접근해서 remove
//		bsvc.remove(board_no);
//		
//		// page, numPerPage, searchType, keyword ... 다 가지고 있어야함
//		reAttr.addAttribute("page", sc.getPage());
//		reAttr.addAttribute("numPerPage", sc.getNumPerPage());
//		reAttr.addAttribute("searchType", sc.getSearchType());
//		reAttr.addAttribute("keyword", sc.getKeyword());
//		
//		reAttr.addFlashAttribute("result", "delSuccess");
//		
//		
//		return "redirect:/bmm/"+board_gubunCode+"/pageList";
//	}
//}


















