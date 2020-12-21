package com.spring.management;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.CommentDTO;
import com.spring.dto.MemberDTO;
import com.spring.service.CommentService;

@RestController
@RequestMapping("/comment")
public class CommentController {
	
	@Inject
	private CommentService csvc;
	
//	// 댓글 입력
//	@RequestMapping(value = "/insert.do")
//	public void insert(@ModelAttribute CommentDTO cdto, HttpSession session) throws Exception {
//		MemberDTO login = (MemberDTO) session.getAttribute("login");
//		
//		cdto.setMember_no(login.getMember_no());
//		csvc.writeComment(cdto);
//	}
//	
//	// 댓글 리스트
//	@RequestMapping(value = "/list.do")
//	public ModelAndView list(@RequestParam("board_no") Integer board_no, ModelAndView mav, HttpSession session) throws Exception {
//		
//		List<CommentDTO> list = csvc.listComment(board_no);
//		
//		mav.setViewName("bmm/commentList");
//		mav.addObject("list", list);
//		
//		
//		return mav;
//	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody CommentDTO cdto, HttpSession session, RedirectAttributes attr){
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		ResponseEntity<String> resEntity = null;
		try {
			cdto.setMember_no(login.getMember_no());
			csvc.writeComment(cdto);
			resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return resEntity;
	}
	
	@RequestMapping(value = "/selectAll/{board_no}", method = RequestMethod.GET)
	public ResponseEntity<List<CommentDTO>> list(@PathVariable("board_no") Integer board_no) throws Exception{
		
		ResponseEntity<List<CommentDTO>> resEntity = null;
		
		List<CommentDTO> list = csvc.listComment(board_no);
		
		try {
			resEntity = new ResponseEntity<List<CommentDTO>>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<List<CommentDTO>>(HttpStatus.BAD_REQUEST);
		}
		return resEntity;
	}

	@RequestMapping(value = "/{comment_no}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modify(@PathVariable("comment_no") Integer comment_no, @RequestBody CommentDTO cdto){
		
		ResponseEntity<String> resEntity = null;
		
		try {
			cdto.setComment_no(comment_no);
			csvc.modifyComment(cdto);
			resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return resEntity;
	}
	
	@RequestMapping(value = "/{comment_no}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("comment_no") Integer comment_no){
		
		ResponseEntity<String> resEntity = null;
		
		try {
			csvc.deleteComment(comment_no);
			resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			
		}
		return resEntity;
	}
	
}







