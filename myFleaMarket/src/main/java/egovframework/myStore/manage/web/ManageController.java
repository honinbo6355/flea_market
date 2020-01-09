package egovframework.myStore.manage.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.market.cmmn.service.util.FileUtils;
import egovframework.market.cmmn.service.util.JsonUtils;
import egovframework.market.cmmn.service.util.PagingVO;
import egovframework.market.cmmn.service.util.SearchVO;
import egovframework.market.login.service.UserVO;
import egovframework.myStore.manage.service.ManageService;
import egovframework.myStore.register.service.AttachVO;
import egovframework.myStore.register.service.ProductResultVO;
import egovframework.myStore.register.service.ProductVO;
import egovframework.myStore.register.service.RegisterService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class ManageController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	@Resource(name = "manageService")
	private ManageService manageService;
	
	@Resource(name = "registerService")
	private RegisterService registerService;

	@ModelAttribute("menuTitle")
	public String menuTitle() {
		return "물품 관리";
	}
	
	@RequestMapping(value = "/myStore/manage.do", method = RequestMethod.GET)
	public String myStoreManage(ModelMap model, HttpSession session, @ModelAttribute SearchVO searchVO) throws Exception {
		logger.info("myStoreManage .....");
		
		try {
			int userId = ((UserVO)session.getAttribute("USER")).getId();
			System.out.println(userId);
			
			Map<String, Object> paramMap = new HashMap<>();
			
			paramMap.put("userId", userId);
			paramMap.put("pageStart", searchVO.getPageStart());
			paramMap.put("perPageNum", searchVO.getPerPageNum());
			paramMap.put("keyword", searchVO.getKeyword());
			
			List<ProductResultVO> productList = manageService.getProductList(paramMap);
			logger.info("productList={}", productList);
			
			int count = manageService.getProductListCnt(paramMap);
			PagingVO pagingVO = new PagingVO();
			pagingVO.setSearch(searchVO);
			pagingVO.setTotalCount(count);
			
			model.addAttribute("PROD_LIST", productList);
			model.addAttribute("PAGING", pagingVO);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			System.out.println("myStoreManage 메소드 종료");
		}
		
		return "manage/manage.tiles2";
	}
	
	@RequestMapping(value = "/myStore/modify.do", method = RequestMethod.GET)
	public String myStoreModify(@RequestParam String prodId, ModelMap model, @ModelAttribute SearchVO searchVO) throws Exception {
		System.out.println("prodId : " + prodId);
		
		try {
			List<EgovMap> aCategoryList = registerService.getACategoryList();
			
			System.out.println("aCategoryList : " + aCategoryList);
			
			ProductResultVO product = manageService.getProduct(prodId);
			
			System.out.println("product : " + product);
			
			model.addAttribute("A_CATEGORY_LIST", aCategoryList);
			model.addAttribute("PROD", product);
			model.addAttribute("SEARCH", searchVO);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			System.out.println("myStoreModify 메소드 종료");
		}
		
		return "manage/modify.tiles2";
	}
	
	@ResponseBody
	@RequestMapping(value = "/myStore/getUploadFile.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
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
	
	@RequestMapping(value = "/myStore/productModify.do", method = RequestMethod.POST)
	public String productModify(HttpSession session, @ModelAttribute ProductVO product, @ModelAttribute AttachVO attach
			, BindingResult bindingResult) throws Exception {
		try {
			if (bindingResult.hasErrors()) {
				List<ObjectError> errors = bindingResult.getAllErrors();
				for (ObjectError error:errors) {
					System.out.println("error : " + error.getDefaultMessage());
				}
				return "redirect:modify.do?prodId=" + product.getProdId();
			}
			
			UserVO user = (UserVO)session.getAttribute("USER");
			product.setUserId(user.getId());
			
			manageService.modifyProduct(product, attach);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			System.out.println("productModify 메소드 종료");
		}
		
		return "redirect:manage.do";
	}
	
	@RequestMapping(value = "/myStore/productDelete.do", method = RequestMethod.POST)
	public String productDelete(@RequestParam String prodId, RedirectAttributes redirectAttributes, SearchVO searchVO) throws Exception{
		try {
			manageService.deleteProduct(prodId);
			redirectAttributes.addAttribute("page", searchVO.getPage());
			redirectAttributes.addAttribute("perPageNum", searchVO.getPerPageNum());
			redirectAttributes.addAttribute("keyword", searchVO.getKeyword());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			System.out.println("productDelete 메소드 종료");
		}
		
		return "redirect:manage.do";
	}
}
