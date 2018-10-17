package com.accp.jboa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.accp.jboa.vo.EmployeeVo;

public interface IEmployeeDao {
	
	public EmployeeVo login(@Param("em") EmployeeVo em);
	
	public List<EmployeeVo> query(@Param("em") EmployeeVo em);
}
