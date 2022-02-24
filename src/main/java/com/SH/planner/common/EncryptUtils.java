package com.SH.planner.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

// 비밀번호 암호화를 위한 클래스
public class EncryptUtils {
	
	// 암호화 메소드
	public static String md5(String message) {
		
		String encData = null;
		
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("MD5");
			
			byte[] bytes = message.getBytes();
			md.update(bytes);
			
			byte[] digest = md.digest();
			
			for(int i=0; i<digest.length; i++) {
				encData += Integer.toHexString(digest[i] & 0xff);
			}
		} 
			catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
		
		return encData;
		
		
		
	}

}
