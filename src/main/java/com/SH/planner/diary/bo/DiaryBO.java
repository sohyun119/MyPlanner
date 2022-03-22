package com.SH.planner.diary.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.SH.planner.common.FileManagerService;
import com.SH.planner.diary.dao.DiaryDAO;
import com.SH.planner.diary.model.Diary;

@Service
public class DiaryBO {
	
	@Autowired
	private DiaryDAO diaryDAO;
	
	
	public int addDiary(int userId, String content, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		return diaryDAO.insertDiary(userId, content, filePath);
	}
	
	public List<Diary> selectDiaryList(int userId){
		return diaryDAO.selectDiaryList(userId);
	}
		
	public int deleteDiary(int diaryId) {
		
		Diary diary = diaryDAO.selectDiary(diaryId);
		FileManagerService.removeFile(diary.getImagePath());
		
		return diaryDAO.deleteDiary(diaryId);
	}
	
	
	
	

}
