package com.SH.planner.diary.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.SH.planner.diary.model.Diary;

@Repository
public interface DiaryDAO {
	
	
	public int insertDiary(
			@Param("userId") int userId
			,@Param("content") String content
			, @Param("imagePath") String filePath);
	
	public List<Diary> selectDiaryList(@Param("userId") int userId);
	
	public Diary selectDiary(@Param("id") int diaryId);
	
	public int deleteDiary(@Param("id") int diaryId);
	
	

}
