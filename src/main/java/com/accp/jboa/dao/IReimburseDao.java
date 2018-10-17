package com.accp.jboa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.accp.jboa.pojo.CheckInfo;
import com.accp.jboa.pojo.Reimburse;
import com.accp.jboa.pojo.Status;
import com.accp.jboa.vo.ReimburseVo;

public interface IReimburseDao {
	
	public List<ReimburseVo> query(@Param("r")ReimburseVo r);
	
	public Reimburse queryInfo(@Param("id") String id);
	
	public List<CheckInfo> queryCheck(@Param("id") String id);
	
	public void checkbx(@Param("rv") ReimburseVo rv);
	
	public void insertCheck(@Param("c") CheckInfo c);
	
	public List<Status> allStatus();
}
