package egovframework.myStore.manage.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
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

import egovframework.market.cmmn.service.util.FileUtils;
import egovframework.market.cmmn.service.util.JsonUtils;
import egovframework.market.login.service.UserVO;
import egovframework.myStore.manage.service.ManageService;
import egovframework.myStore.register.service.AttachVO;
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
	
	@RequestMapping(value = "/myStore/manage.do", method = RequestMethod.GET)
	public String myStoreManage(ModelMap model, HttpSession session) throws Exception {
		logger.info("myStoreManage .....");
		
		try {
			int userId = ((UserVO)session.getAttribute("USER")).getId();
			System.out.println(userId);
			
			List<ProductVO> productList = manageService.getProductList(userId);
			logger.info("productList={}", productList.get(0).getStatusName());

			model.addAttribute("PROD_LIST", productList);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			System.out.println("myStoreManage 메소드 종료");
		}
		
		return "manage/manage.tiles2";
	}
	
	@RequestMapping(value = "/myStore/modify.do", method = RequestMethod.GET)
	public String myStoreModify(@RequestParam String prodId, ModelMap model) throws Exception {
		System.out.println("prodId : " + prodId);
		
		try {
			List<EgovMap> aCategoryList = registerService.getACategoryList();
			
			System.out.println("aCategoryList : " + aCategoryList);
			
			ProductVO product = manageService.getProduct(prodId);
			
			System.out.println("product : " + product);
			
			model.addAttribute("A_CATEGORY_LIST", aCategoryList);
			model.addAttribute("PROD", product);
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
	public String productModify(HttpSession session, @ModelAttribute ProductVO product, @ModelAttribute AttachVO attach, BindingResult bindingResult) throws Exception {
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
	public String productDelete(@RequestParam String prodId) throws Exception{
		try {
			manageService.deleteProduct(prodId);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			System.out.println("productDelete 메소드 종료");
		}
		
		return "redirect:manage.do";
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/displayFile.do", method = RequestMethod.GET)
//	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
//		logger.info("display File ..... fileName={}", fileName);
//		
//		InputStream in = null;
//		HttpHeaders headers = new HttpHeaders();
//		String formatName = FileUtils.getFileExtension(fileName); //확장자명 
//		MediaType mType = FileUtils.getMediaType(formatName); // 확장자명을 이용해서 MediaType get
//
//		File file = new File(FileUtils.uploadPath, fileName);
//		
//		in = new FileInputStream(file);
//		headers.setContentType(mType);
//		
//		return new ResponseEntity<>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
//	}
}
