package com.SH.planner.diary;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.SH.planner.diary.bo.DiaryBO;
import com.SH.planner.diary.model.Diary;

@Controller
@RequestMapping("/diary")
public class DiaryController {
	
	@Autowired
	private DiaryBO diaryBO;
	
	@GetMapping("/timeline_view")
	public String timelineView(
			HttpServletRequest request
			, Model model
			) {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<Diary> diaryList = new ArrayList<>();
		diaryList = diaryBO.selectDiaryList(userId);
		
		model.addAttribute(diaryList);
		
		return "diary/timeline_view";
	}
	

}
