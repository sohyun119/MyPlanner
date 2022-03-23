package com.SH.planner.plan.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.SH.planner.plan.model.TodoList;

@Repository
public interface TodoDAO {
	
	public List<TodoList> selectTodoList(
			@Param("userId") int userId
			, @Param("date") Date date
			);

	public int basicInsertTodo(
			TodoList todoList 
			);	
	
	public int defaultCheck(@Param("todoListId") int todoListId);
	
	public boolean isChecked(@Param("todoListId") int todoListId);
	
	public int cancleCheck(@Param("todoListId") int todoListId);
	
	public int plusCheck(@Param("todoListId") int todoListId);
	
	public int deleteTodo(@Param("todoListId") int todoListId);
	
	public int deleteCheck(@Param("todoListId") int todoListId);
	
	public List<TodoList> selectSimpleTodoList(@Param("userId") int userId, @Param("color") String color);
	
	public int insertSimpleTodo(@Param("userId") int userId,
			@Param("title") String title, 
			@Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("color") String color);
	
	
	
	
	
}
