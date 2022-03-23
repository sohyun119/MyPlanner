package com.SH.planner.plan;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.SH.planner.plan.bo.TodoBO;
import com.SH.planner.plan.model.TodoList;
import com.SH.planner.plan.model.TodoListCheck;

@Controller
@RequestMapping("/plan")
public class TodoController {
	
	@Autowired
	private TodoBO todoBO;
	
	@GetMapping("/todoList_view")
	public String todoListView(
			HttpServletRequest request
			, Model model
			) throws ParseException {
		// xml에서 날짜비교를 위해 formatter 를 이용하여 보내주어야 한다. 
		Date today = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String date = formatter.format(today);
		today = formatter.parse(date);
	
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<TodoList> todoList = todoBO.selectTodoList(userId, today);
		List<TodoListCheck> todoListCheck = todoBO.selectTodoListCheck(todoList);
		
		model.addAttribute("allTodoList", todoListCheck);
		model.addAttribute("checkDate", today);
		
		return "plan/todoList_view";
	}
	
	@GetMapping("/todoList_view_otherDay")
	public String todoListView_otherDay(
			HttpServletRequest request
			, Model model,
			@DateTimeFormat(pattern="yyyy-MM-dd")
			@RequestParam("date") Date date
			) throws ParseException {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<TodoList> todoList = todoBO.selectTodoList(userId, date);
		List<TodoListCheck> todoListCheck = todoBO.selectTodoListCheck(todoList);
		
		model.addAttribute("allTodoList", todoListCheck);
		model.addAttribute("checkDate", date);
		
		return "plan/todoList_view";
	}

	
	@GetMapping("/todo/simple_create_view")
	public String todoSimpleCreate(
			HttpServletRequest request
			, Model model
			) {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<TodoList> simpleTodoList = new ArrayList<>();
		simpleTodoList = todoBO.selectSimpleTodoList(userId);
		
		model.addAttribute(simpleTodoList);
		
		return "plan/todo_simple_create_view";
	}
	
	
	
}
