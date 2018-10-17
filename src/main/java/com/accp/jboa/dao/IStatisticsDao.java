package com.accp.jboa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.accp.jboa.pojo.Statistics;

public interface IStatisticsDao {
	
	public List<Statistics> query(@Param("s") Statistics s);
}
