package com.SH.planner.diary;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.SH.planner.diary.bo.DiaryBO;

@RestController
@RequestMapping("/diary")
public class DiaryRestController {
	
	@Autowired
	public DiaryBO diaryBO;
	
	@PostMapping("/create")
	public Map<String, String> diaryCreate(
			@RequestParam("content") String content
			, @RequestParam(value = "file", required = false) MultipartFile file
			, HttpServletRequest request
			){
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = diaryBO.addDiary(userId, content, file);
		
		Map<String, String> map = new HashMap<>();
		if(count == 1) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
	@GetMapping("/delete")
	public Map<String, String> diaryDelete(
			@RequestParam("diaryId") int diaryId
			){
		
		int count = diaryBO.deleteDiary(diaryId);
		
		Map<String, String> map = new HashMap<>();
		if(count == 1) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
	
	
	

}
