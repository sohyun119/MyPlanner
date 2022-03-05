package com.SH.planner.plan;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.SH.planner.plan.bo.TodoBO;
import com.SH.planner.plan.model.TodoList;

@Controller
@RequestMapping("/plan")
public class TodoController {
	
	@Autowired
	private TodoBO todoBO;
	
	@GetMapping("/todoList_view")
	public String todoListView(
			@RequestParam("startDate") Date startDate
			, @RequestParam("endDate") Date endDate
			, HttpServletRequest request
			, Model model
			) {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<TodoList> todoList = todoBO.selectTodoList(userId, startDate, endDate);
		
		model.addAttribute("todoList", todoList);
		
		return "plan/todoList_view";
	}

	
	
	
}
