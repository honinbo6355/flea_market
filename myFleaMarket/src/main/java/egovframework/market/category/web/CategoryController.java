package egovframework.market.category.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;

import egovframework.market.category.service.CategoryService;
import egovframework.market.category.service.Inquiry;
import egovframework.market.cmmn.service.Category;
import egovframework.market.cmmn.service.CommonService;
import egovframework.market.cmmn.service.util.JsonUtils;
import egovframework.market.cmmn.service.util.PagingVO;
import egovframework.market.cmmn.service.util.SearchVO;
import egovframework.market.login.service.UserVO;
import egovframework.myStore.manage.service.ManageService;
import egovframework.myStore.manage.web.ManageController;
import egovframework.myStore.register.service.ProductResultVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class CategoryController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	@Resource(name = "categoryService")
	private CategoryService categoryService;
	
	@Resource(name = "manageService")
	private ManageService manageService;
	
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
			
			List<ProductResultVO> productList = categoryService.getCateProductList(paramMap);
			
			int count = categoryService.getCateProductCnt(category);
			PagingVO pagingVO = new PagingVO();
			pagingVO.setSearch(searchVO);
			pagingVO.setTotalCount(count);
			
			model.addAttribute("CATEGORY_LIST", categoryList);
			model.addAttribute("LEFT_CATEGORY_LIST", leftCategoryList);
			model.addAttribute("CATEGORY", category);
			model.addAttribute("PROD_LIST", productList);
			model.addAttribute("PAGING", pagingVO);
		} catch (Exception e) {
    		System.out.println(e.getMessage());
    	} finally {
    		System.out.println("categoryMain 메소드 종료\n\n\n");
    	}
		
		return "category/main.tiles";
	}
	
	@RequestMapping(value = "/productDetail.do", method = RequestMethod.GET)
	public String productDetail(@RequestParam String prodId, ModelMap model) throws Exception {
		try {
			List<Category> categoryList = commonService.getCategoryList();
			ProductResultVO product = categoryService.getProductDetail(prodId);
			
			System.out.println("product : " + product);
			
			model.addAttribute("CATEGORY_LIST", categoryList);
			model.addAttribute("PROD", product);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			System.out.println("productDetail 메소드 종료\n\n\n");
		}
		
		return "category/productDetail.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getUploadFile.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> getUploadFile(@RequestBody String prodId) throws Exception {
		System.out.println("getUploadFile prodId : " + prodId);
		
		ResponseEntity<String> entity = null;
		try {
			Map<String, Object> paramMap = JsonUtils.JsonToMap(prodId);
			
			List<EgovMap> attachList = manageService.getAttachList(paramMap);
			
			logger.info("attachList={}", attachList);
			
			String attachListJson = JsonUtils.ListToJson(attachList);
			
			logger.info("attachListJson={}", attachListJson);
			
			entity = new ResponseEntity<>(attachListJson, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} finally {
			System.out.println("getUploadFile 메소드 종료");
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/inqRegister.do", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> inqRegister(@RequestBody Inquiry inquiry, HttpSession session) throws Exception {
		logger.info("inqRegister inquiry={}", inquiry);
		
		ResponseEntity<String> entity = null;
		
		try {			
			UserVO user = (UserVO)session.getAttribute("USER");
			
			inquiry.setEmail(user.getEmail());
			
			categoryService.registerInquiry(inquiry);
			
			entity = new ResponseEntity<>("success", HttpStatus.CREATED);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} finally {
			System.out.println("inqRegister 메소드 종료");
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "getInqList.do", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public ResponseEntity<List<Inquiry>> getInqList(@RequestParam String prodId) throws Exception {
		System.out.println("getInqList 실행");
		
		ResponseEntity<List<Inquiry>> entity = null;
		
		try {
			List<Inquiry> inqList = categoryService.getInqList(prodId);
			
			System.out.println("inqList : " + inqList);
			
			entity = new ResponseEntity<>(inqList, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} finally {
			System.out.println("getInqList 메소드 종료");
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "modifyInquiry.do", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> modifyInquiry(@RequestBody Inquiry inquiry) throws Exception {
		logger.info("inquiry={}", inquiry);
		
		ResponseEntity<String> entity = null;
		
		try {
			categoryService.modifyInquiry(inquiry);
			
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} finally {
			System.out.println("modifyInquiry 메소드 종료");
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "removeInquiry.do", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> removeInquiry(@RequestBody String inqNum) throws Exception {
		logger.info("inqNum={}", inqNum);
		ResponseEntity<String> entity = null;
	
		try {
			Map<String, Object> paramMap = JsonUtils.JsonToMap(inqNum);
			
			System.out.println("paramMap : " + paramMap);
			
			categoryService.removeInquiry(paramMap);
			
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
