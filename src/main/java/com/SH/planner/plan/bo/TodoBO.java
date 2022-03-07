package com.SH.planner.plan.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.SH.planner.plan.dao.TodoDAO;
import com.SH.planner.plan.model.TodoList;

@Service
public class TodoBO {
	
	@Autowired
	private TodoDAO todoDAO;
	
	public List<TodoList> selectTodoList(
			int userId
			, Date today
			){
		return todoDAO.selectTodoList(userId, today);
	}

}
