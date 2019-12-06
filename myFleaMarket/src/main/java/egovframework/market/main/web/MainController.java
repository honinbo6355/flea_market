package egovframework.market.main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.JsonArray;

import egovframework.market.cmmn.service.Category;
import egovframework.market.cmmn.service.CommonService;
import egovframework.market.main.service.MainService;
import egovframework.myStore.register.service.ProductVO;

@Controller
public class MainController {

	@Resource(name = "commonService")
	private CommonService commonService;
	
	@Resource(name = "mainService")
	private MainService mainService;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(ModelMap model) throws Exception {
		try {
			List<Category> categoryList = commonService.getCategoryList();
			List<ProductVO> productList = mainService.getRecommProductList();
			
			System.out.println("productList : " + productList);
			
			model.addAttribute("CATEGORY_LIST", categoryList);
			model.addAttribute("PROD_LIST", productList);
		} catch (Exception e) {
			System.out.println(e.getMessage());
    	} finally {
    		System.out.println("main 메소드 종료\n\n\n");
    	}
		
		return "main/main.tiles";
	}
}
