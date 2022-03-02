package com.SH.planner.user.dao;

import org.apache.ibatis.annotations.Param;

public interface UserDAO {
	
	
	public int duplicate_id(@Param("loginId") String loginId);
	
	public int insertUser(
			@Param("email") String email
			, @Param("name") String name
			, @Param("loginId") String loginId
			, @Param("password") String password
			);

}
