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
			, @Param("startDate") Date startDate
			, @Param("endDate") Date endDate
			);

}
