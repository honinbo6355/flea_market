package egovframework.market.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	@RequestMapping(value = "/admin/main.do", method = RequestMethod.GET)
	public String adminMain() throws Exception {
		return "admin/main";
	}
}
