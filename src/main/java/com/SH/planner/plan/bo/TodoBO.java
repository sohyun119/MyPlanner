package com.SH.planner.plan.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.SH.planner.plan.dao.TodoDAO;
import com.SH.planner.plan.model.TodoList;
import com.SH.planner.plan.model.TodoListCheck;

@Service
public class TodoBO {
	
	@Autowired
	private TodoDAO todoDAO;
	
	public List<TodoList> selectTodoList(int userId, Date date){
		return todoDAO.selectTodoList(userId, date);
	}
	
	public List<TodoListCheck> selectTodoListCheck(List<TodoList> todoList){
		TodoListCheck todoCheck = new TodoListCheck();
		List<TodoListCheck> todoListCheck = new ArrayList<>();
		
		for(int i=0; i<todoList.size(); i++) {
			todoCheck.setTodoList(todoList.get(i));
			boolean isCheck = todoDAO.isChecked(todoList.get(i).getId());
			todoCheck.setCheck(isCheck);
			todoListCheck.add(todoCheck);
		}
		
		return todoListCheck;
	}
	
	public int basicAddTodo(int userId, String title, Date date, String color) {
		return todoDAO.basicInsertTodo(userId, title, date, color);
	}

}
