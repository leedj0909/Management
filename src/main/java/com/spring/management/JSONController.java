package com.spring.management;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.service.LoginService;

@Controller 
public class JSONController {
	
	@Inject
	private LoginService lsvc;
	
	// 1.요청 페이지에서 아이디를 가져와서 아이디 중복 확인 후 MAP으로 반환
		@GetMapping(value = "/idCheck")
		@ResponseBody
		public Map<String, Object> idCheck(@RequestParam("member_id") String member_id) {
			// 1) 서비스 메소드 실행해서 아이디 중복 여부 저장
			boolean result = lsvc.idCheck(member_id);
			// 2) Map에 result 값 저장
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("result", result);
			// 3) map 리턴
			return map;
		}

}
