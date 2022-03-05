package com.SH.planner.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.SH.planner.user.bo.UserBO;
import com.SH.planner.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	
	@GetMapping("/is_duplicate_id")
	public Map<String, String> duplicate_id (@RequestParam("loginId") String loginId){
		
		int count = userBO.duplicate_id(loginId);
		
		Map<String, String> map = new HashMap<>();
		if(count == 1) {
			map.put("duplicate","true");
		}
		else {
			map.put("duplicate", "false");
		}
		
		return map;
	}
	
	@PostMapping("/sign_up")
	public Map<String, String> sign_up(
			@RequestParam("email") String email
			, @RequestParam("name") String name
			, @RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			){
		
		int count = userBO.signUp(email, name, loginId, password);
		
		Map<String, String> map = new HashMap<>();
		if(count == 1) {
			map.put("result", "success");
		}
		else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
	@PostMapping("/sign_in")
	public Map<String, String> sign_in(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request
			){
		HttpSession session = request.getSession();
		
		User user = userBO.signIn(loginId, password);
		
		Map<String, String> map = new HashMap<>();
		if(user != null) {
			map.put("result", "success");
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
		}
		else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
	
	
	
	

}
