package com.SH.planner.plan;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.SH.planner.plan.bo.TodoBO;
import com.SH.planner.plan.model.TodoList;

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
		
		model.addAttribute("todoList", todoList);
		
		return "plan/todoList_view";
	}

	
	
	
}
