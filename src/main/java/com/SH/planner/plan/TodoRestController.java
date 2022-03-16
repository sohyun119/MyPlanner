package com.SH.planner.plan;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.SH.planner.plan.bo.TodoBO;

@RestController
@RequestMapping("/plan")
public class TodoRestController {
	
	@Autowired
	private TodoBO todoBO;
	
	@PostMapping("/todo/create")
	public Map<String, String> createTodo(
			@RequestParam("title") String title,
			@DateTimeFormat(pattern="yyyy-MM-dd")
			@RequestParam("date") Date date
			, @RequestParam("color") String color
			, HttpServletRequest request
			) throws ParseException{
		
		int userId = (Integer)request.getAttribute("userId");
		
		int count = todoBO.basicAddTodo(userId, title, date, color);
		
		Map<String, String> map = new HashMap<>();
		if(count == 1) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		
		return map;
	}

}
