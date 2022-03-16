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
	
	public List<TodoList> selectTodoList(int userId, Date date){
		return todoDAO.selectTodoList(userId, date);
	}
	
	public int basicAddTodo(int userId, String title, Date date, String color) {
		return todoDAO.basicInsertTodo(userId, title, date, color);
	}

}
