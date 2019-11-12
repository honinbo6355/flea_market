package egovframework.market.category.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.JsonArray;

import egovframework.market.cmmn.service.CommonService;

@Controller
public class CategoryController {
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@RequestMapping(value = "/categoryMain.do", method = RequestMethod.GET)
	public String categoryMain(ModelMap model) throws Exception {
		try {
			JsonArray jsonCategoryArray = commonService.getCategoryList();
			
			System.out.println("jsonCategoryArray : " + jsonCategoryArray);
			
			model.addAttribute("JSON_CATEGORY_ARRAY", jsonCategoryArray);
		} catch (Exception e) {
    		System.out.println(e.getMessage());
    	} finally {
    		System.out.println("categoryMain 메소드 종료\n\n\n");
    	}
		
		return "category/main.tiles";
	}
}
