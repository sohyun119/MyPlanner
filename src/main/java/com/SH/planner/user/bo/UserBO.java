package com.SH.planner.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.SH.planner.common.EncryptUtils;
import com.SH.planner.user.dao.UserDAO;
import com.SH.planner.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int duplicate_id(String loginId) {
		return userDAO.duplicate_id(loginId);
	}
	
	public int signUp(String email, String name, String loginId, String password) {
		
		return userDAO.insertUser(email, name, loginId, EncryptUtils.md5(password));
	}
	
	public User signIn(String loginId, String password) {
		
		return userDAO.signIn(loginId, EncryptUtils.md5(password));
	}

}
