package com.SH.planner.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.SH.planner.user.model.User;

@Repository
public interface UserDAO {
	
	
	public int duplicate_id(@Param("loginId") String loginId);
	
	public int insertUser(
			@Param("email") String email
			, @Param("name") String name
			, @Param("loginId") String loginId
			, @Param("password") String password
			);

	public User signIn(@Param("loginId") String loginId, @Param("password") String password);
	
	
}
