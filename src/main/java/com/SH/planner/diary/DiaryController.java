package com.SH.planner.diary;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/diary")
public class DiaryController {
	
	
	@RequestMapping("/timeline_view")
	public String timelineView(
			
			) {
		return "diary/timeline_view";
	}
	

}
