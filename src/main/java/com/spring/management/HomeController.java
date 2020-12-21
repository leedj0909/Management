package com.spring.management;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dto.BoardDTO;
import com.spring.dto.SearchCriteria;
import com.spring.service.BoardService;
import com.spring.service.MemoService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	private BoardService bsvc;
	
	@Inject
	private MemoService msvc;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(SearchCriteria sc, Model model) throws Exception {
		
		List<BoardDTO> list = bsvc.mainList(sc);
		
		model.addAttribute("list", list);
		
		return "main/management";
	}
	
	
	
	
}
