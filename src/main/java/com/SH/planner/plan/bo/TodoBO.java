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
		List<TodoListCheck> todoListCheck = new ArrayList<>();
		
		for(int i=0; i<todoList.size(); i++) {
			TodoListCheck todoCheck = new TodoListCheck();
			
			todoCheck.setTodoList(todoList.get(i));
			boolean isCheck = todoDAO.isChecked(todoList.get(i).getId());
			todoCheck.setCheck(isCheck);
			
			todoListCheck.add(todoCheck);
		}
		
		return todoListCheck;
	}
	
	public int basicAddTodo(TodoList todoList) {
		int count = todoDAO.basicInsertTodo(todoList);
		int id = todoList.getId();
		return id;	
	}
	
	public int defaultCheck(int todoListId) {
		return todoDAO.defaultCheck(todoListId);
	}
	
	public int changeCheck(int todoListId) {
		boolean isCheck = todoDAO.isChecked(todoListId);
		int count = 0;
		
		// check == true 이면 체크 취소, check == false 이면 체크 
		if(isCheck) {
			count = todoDAO.cancleCheck(todoListId);
		}
		else {
			count = todoDAO.plusCheck(todoListId);
		}
		
		return count;
	}
	
	
	
}
