package com.accp.jboa.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.accp.jboa.biz.StatisticsBiz;
import com.accp.jboa.pojo.Statistics;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/vocher")
public class StatisticsAction {
	
	@Autowired
	private StatisticsBiz biz;
	
	@RequestMapping(value="list",method=RequestMethod.GET)
	public String query(Model model,Statistics vc,Integer pageNum,Integer pageSize) throws Exception {
		if(pageNum == null || pageNum == 0) pageNum = 1;
		if(pageSize == null || pageSize == 0) pageSize = 4;
		PageInfo<Statistics> page = biz.query(vc, pageNum, pageSize);
		model.addAttribute("page", page);
		return "bxlist";
	}
}
