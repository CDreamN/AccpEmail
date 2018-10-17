package com.accp.jboa.action;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.accp.jboa.biz.EmployeeBiz;
import com.accp.jboa.vo.EmployeeVo;

@Controller
@RequestMapping("/Employee")
public class EmployeeAction {

	@Autowired
	private EmployeeBiz biz;

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(Model model, HttpSession session, EmployeeVo em, String VerCode) throws Exception {
		em = biz.login(em);
		if (session.getAttribute("Vercode") == null || !session.getAttribute("Vercode").toString().toUpperCase().equals(VerCode.toUpperCase())) {
			model.addAttribute("MSG", "验证码错误。");
			model.addAttribute("TEXT", "重新登录");
			model.addAttribute("URL", "login.jsp");
		} else {
			if (em != null) {
				model.addAttribute("MSG", "登录成功。");
				model.addAttribute("TEXT", "进入首页");
				model.addAttribute("URL", "reimburse/list");
				session.setAttribute("user", em);
			} else {
				model.addAttribute("MSG", "账号或密码错误。");
				model.addAttribute("TEXT", "重新登录");
				model.addAttribute("URL", "login.jsp");
			}
		}
		return "info";
	}
}
