package com.accp.jboa.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.accp.jboa.biz.ReimburseBiz;
import com.accp.jboa.pojo.CheckInfo;
import com.accp.jboa.pojo.Reimburse;
import com.accp.jboa.pojo.Status;
import com.accp.jboa.vo.EmployeeVo;
import com.accp.jboa.vo.ReimburseVo;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value="reimburse")
public class ReimburseAction {
	
	@Autowired
	private ReimburseBiz biz;
	
	@RequestMapping(value="list",method=RequestMethod.GET)
	public String query(Model model,ReimburseVo rv,Integer pageNum,Integer pageSize) throws Exception{
		if(pageNum == null || pageNum == 0) pageNum = 1;
		if(pageSize == null || pageSize == 0) pageSize = 4;
		List<Status> list = biz.allStatus();
		PageInfo<ReimburseVo> page = biz.query(rv, pageNum, pageSize);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		return "bxlist";
	}
	
	@RequestMapping(value="queryOn",method=RequestMethod.GET)
	public String queryOn(Model model,ReimburseVo rv) throws Exception{
		PageInfo<ReimburseVo> page = biz.query(rv, 1, 4);
		List<CheckInfo> chelist = biz.queryCheck(rv.getReimburseId().toString());
		Reimburse re = biz.queryInfo(rv.getReimburseId().toString());
		model.addAttribute("info", page.getList().get(0));
		model.addAttribute("list", re.getDetails());
		model.addAttribute("chelist", chelist);
		return "bxdetails";
	}
	
	@RequestMapping(value="adminbx",method=RequestMethod.GET)
	public String adminbx(Model model,ReimburseVo rv) throws Exception{
		PageInfo<ReimburseVo> page = biz.query(rv, 1, 4);
		List<CheckInfo> chelist = biz.queryCheck(rv.getReimburseId().toString());
		Reimburse re = biz.queryInfo(rv.getReimburseId().toString());
		model.addAttribute("info", page.getList().get(0));
		model.addAttribute("list", re.getDetails());
		model.addAttribute("chelist", chelist);
		return "bxexamination";
	}
	
	@RequestMapping(value="checkbx",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> goCheck(CheckInfo c,HttpSession session) throws Exception{
		Map<String, String> map = new HashMap<String,String>();
		try {
			c.setCheckMan(((EmployeeVo)session.getAttribute("user")).getEmployeeId());
			biz.modifyCheckbx(c);
			biz.addCheck(c);
			map.put("code", "200");
		} catch(Exception e) {
			map.put("code", "500");
		}
		return map;
	}
	
	@RequestMapping(value="add",method=RequestMethod.GET)
	public String add(Model model,ReimburseVo rv) throws Exception{
		PageInfo<ReimburseVo> page = biz.query(rv, 1, 4);
		List<CheckInfo> chelist = biz.queryCheck(rv.getReimburseId().toString());
		Reimburse re = biz.queryInfo(rv.getReimburseId().toString());
		model.addAttribute("info", page.getList().get(0));
		model.addAttribute("list", re.getDetails());
		model.addAttribute("chelist", chelist);
		return "bxadd";
	}
	
	@RequestMapping(value="addDetail",method=RequestMethod.POST)
	public String addDetail() throws Exception{
		
		return "bxadd";
	}
}
