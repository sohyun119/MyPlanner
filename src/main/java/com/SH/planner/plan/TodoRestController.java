package com.SH.planner.plan;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.SH.planner.plan.bo.TodoBO;
import com.SH.planner.plan.model.TodoList;

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
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		TodoList todoList = new TodoList();
		todoList.setUserId(userId);
		todoList.setColor(color);
		todoList.setTitle(title);
		todoList.setDate(date);
		int id = todoBO.basicAddTodo(todoList);
		
		int count = todoBO.defaultCheck(id);
		
		Map<String, String> map = new HashMap<>();
		if(count == 1) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
	
	@GetMapping("/todo/check")
	public Map<String, String> todoCheck(
			@RequestParam("todoListId") int todoListId
			){
		
		int count = todoBO.changeCheck(todoListId);
		
		Map<String, String> map = new HashMap<>();
		if(count == 1) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		return map;
	}
	
	@GetMapping("/todo/delete")
	public Map<String, String> todoDelete(
			@RequestParam("todoListId") int todoListId
			){
		int count = todoBO.deleteTodo(todoListId);
		
		Map<String, String> map = new HashMap<>();
		if(count >= 1) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		return map;
	}
	
	
	@PostMapping("/todo/simple_create")
	public Map<String, String> todoSimpleCreate(
			@RequestParam("title") String title
			,
			@DateTimeFormat(pattern="yyyy-MM-dd")
			@RequestParam("startDate") Date startDate
			, 
			@DateTimeFormat(pattern="yyyy-MM-dd")
			@RequestParam("endDate") Date endDate
			, HttpServletRequest request
			){
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = todoBO.insertSimpleTodo(userId, title, startDate, endDate);
		
		Map<String, String> map = new HashMap<>();
		if(count == 1) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
	@GetMapping("/todo/colorChange")
	public Map<String, String> todoColorChange(
			@RequestParam("color") String color
			, @RequestParam("todoListId") int todoListId
			){
		
		int count = todoBO.todoColorChange(todoListId, color);
		
		Map<String, String> map = new HashMap<>();
		if(count == 1) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
	@PostMapping("/preTodo/pick")
	public Map<String, String> preTodoPick(
			@RequestParam("todoListId") int todoListId
			,@DateTimeFormat(pattern="yyyy-MM-dd")
			@RequestParam("date") Date date
			, @RequestParam("title") String title
			, HttpServletRequest request
			){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		TodoList todoList = new TodoList();
		todoList.setUserId(userId);
		todoList.setConnectedTodoId(todoListId);
		todoList.setColor("black");
		todoList.setTitle(title);
		todoList.setDate(date);
		int id = todoBO.basicAddTodo(todoList);
		
		int count = todoBO.defaultCheck(id);

		Map<String, String> map = new HashMap<>();
		if(count == 1) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
	
	
	
	

}
