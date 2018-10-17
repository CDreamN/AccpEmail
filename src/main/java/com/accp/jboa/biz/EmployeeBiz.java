package com.accp.jboa.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.accp.jboa.dao.IEmployeeDao;
import com.accp.jboa.vo.EmployeeVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class EmployeeBiz {
	
	@Autowired
	private IEmployeeDao dao;
	
	public EmployeeVo login(EmployeeVo em) {
		return dao.login(em);
	}
	
	public PageInfo<EmployeeVo> query(EmployeeVo em,Integer pageNum,Integer pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<EmployeeVo>(dao.query(em));
	}
}
