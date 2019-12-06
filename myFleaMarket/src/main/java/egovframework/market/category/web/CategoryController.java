package egovframework.market.category.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonArray;

import egovframework.market.category.service.CategoryService;
import egovframework.market.cmmn.service.Category;
import egovframework.market.cmmn.service.CommonService;
import egovframework.market.cmmn.service.util.PagingVO;
import egovframework.market.cmmn.service.util.SearchVO;
import egovframework.myStore.register.service.ProductVO;

@Controller
public class CategoryController {
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@Resource(name = "categoryService")
	private CategoryService categoryService;
	
	@RequestMapping(value = "/categoryMain.do", method = RequestMethod.GET)
	public String categoryMain(@ModelAttribute Category category, @ModelAttribute SearchVO searchVO, ModelMap model) throws Exception {
		try {
			List<Category> categoryList = commonService.getCategoryList();
			List<Category> leftCategoryList = categoryService.getLeftCategoryList(category);
			
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("cateCode", category.getCateCode());
			paramMap.put("cateLevel", category.getCateLevel());
			paramMap.put("pageStart", searchVO.getPageStart());
			paramMap.put("perPageNum", searchVO.getPerPageNum());
			
			List<ProductVO> productList = categoryService.getCateProductList(paramMap);
			
			int count = categoryService.getCateProductCnt(category);
			PagingVO pagingVO = new PagingVO();
			pagingVO.setSearch(searchVO);
			pagingVO.setTotalCount(count);
			
			model.addAttribute("CATEGORY_LIST", categoryList);
			model.addAttribute("LEFT_CATEGORY_LIST", leftCategoryList);
			model.addAttribute("ACTIVE_CATE_CODE", category.getCateCode());
			model.addAttribute("PROD_LIST", productList);
			model.addAttribute("PAGING", pagingVO);
		} catch (Exception e) {
    		System.out.println(e.getMessage());
    	} finally {
    		System.out.println("categoryMain 메소드 종료\n\n\n");
    	}
		
		return "category/main.tiles";
	}
}
