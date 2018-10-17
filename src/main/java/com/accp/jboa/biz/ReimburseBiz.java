package com.accp.jboa.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.accp.jboa.dao.IReimburseDao;
import com.accp.jboa.pojo.CheckInfo;
import com.accp.jboa.pojo.Reimburse;
import com.accp.jboa.pojo.Status;
import com.accp.jboa.vo.ReimburseVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ReimburseBiz {
	
	@Autowired
	private IReimburseDao dao;
	
	public PageInfo<ReimburseVo> query(ReimburseVo rv,Integer pageNum,Integer pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<ReimburseVo>(dao.query(rv));
	}
	
	public Reimburse queryInfo(String id) {
		return dao.queryInfo(id);
	}
	
	public List<CheckInfo> queryCheck(String id){
		return dao.queryCheck(id);
	}
	
	public List<Status> allStatus(){
		return dao.allStatus();
	}
	
	public void modifyCheckbx(CheckInfo c) {
		ReimburseVo rv = new ReimburseVo();
		rv.setReimburseId(c.getBizId());
		rv = query(rv,1,1).getList().get(0);
		dao.checkbx(rv);
	}
	
	public void addCheck(@Param("c") CheckInfo c) {
		dao.insertCheck(c);
	}
}
