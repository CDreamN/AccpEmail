package com.accp.jboa.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.accp.jboa.dao.IStatisticsDao;
import com.accp.jboa.pojo.Statistics;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class StatisticsBiz {

	@Autowired
	private IStatisticsDao dao;
	
	public PageInfo<Statistics> query(Statistics s,Integer pageNum,Integer pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<Statistics>(dao.query(s));
	}
}
