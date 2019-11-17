package egovframework.myStore.register.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.myStore.register.service.AttachVO;
import egovframework.myStore.register.service.ProductVO;
import egovframework.myStore.register.service.RegisterService;
import egovframework.market.cmmn.service.util.FileUtils;
import egovframework.market.cmmn.service.util.JsonUtils;
import egovframework.market.login.service.UserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class RegisterController {
	
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	
	@Resource(name = "registerService")
	private RegisterService registerService;
	
	@RequestMapping(value = "/myStore/register.do", method = RequestMethod.GET)
	public String myStoreRegister(ModelMap model) throws Exception {
		try {
			List<EgovMap> aCategoryList = registerService.getACategoryList();
			
			System.out.println("aCategoryList : " + aCategoryList);
			model.addAttribute("A_CATEGORY_LIST", aCategoryList);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			System.out.println("register 메소드 종료");
		}
		
		return "register/register.tiles2";
	}
	
	@RequestMapping(value = "/myStore/bCategoryList.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String bCategoryList(@RequestBody String param) throws Exception {
		String bCategoryJson = null;
		try {
			System.out.println("param : " + param);
			
			bCategoryJson = registerService.getBCategoryList(param);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			System.out.println("bCategoryList 메소드 종료");
		}
		
		return bCategoryJson;
	}
	
	@RequestMapping(value = "/myStore/productRegister.do", method = RequestMethod.POST)
	public String productRegister(HttpSession session, @ModelAttribute ProductVO product, @ModelAttribute AttachVO attach, BindingResult bindingResult) throws Exception {	
		try {
			if (bindingResult.hasErrors()) {
				List<ObjectError> errors = bindingResult.getAllErrors();
				for (ObjectError error:errors) {
					System.out.println("error : " + error.getDefaultMessage());
				}
				return "redirect:register.do";
			}
			
//			if (session.getAttribute("USER") == null) { /* 로그인이 되어 있지 않을 경우 */
//				System.out.println("로그인을 해주세요");
//				return "redirect:register.do";
//			}
			
			UserVO user = (UserVO)session.getAttribute("USER");
			product.setUserId(user.getId());
			
			registerService.registerProduct(product, attach);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			System.out.println("productRegister 메소드 종료");
		}
		
		return "redirect:manage.do";
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/myStore/uploadForm.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
//	public ResponseEntity<String> uploadForm(MultipartFile file) throws Exception {
//		logger.info("uploadForm ....originalName={}, size={}, contentType={}"
//				, file.getOriginalFilename(), file.getSize(), file.getContentType());
//		
//		ResponseEntity<String> entity = null;
//		try {
//			String savedFileName = FileUtils.uploadFile(file);
//			
//			System.out.println(savedFileName);
//			
//			entity = new ResponseEntity<>(savedFileName, HttpStatus.CREATED);
//		} catch (Exception e) {
//			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
//		} finally {
//			System.out.println("uploadForm 메소드 종료");
//		}
//		
//		return entity;
//	}
	
	@ResponseBody
	@RequestMapping(value = "/myStore/deleteFile.do", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestBody String file) throws Exception {
		logger.info("deleteFile ....file={}", file);
		ResponseEntity<String> entity = null;
		
		try {
			Map<String, Object> paramMap = JsonUtils.JsonToMap(file);
			String fileName = (String)paramMap.get("file");
			
			FileUtils.deleteFile(fileName);
			
			entity = new ResponseEntity<>("deleted", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		} finally {
			System.out.println("deleteFile 메소드 종료");
		}
		System.out.println("entity : " + entity);
		
		return entity;
	}
	
	@RequestMapping(value = "/myStore/uploadForm.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> uploadForm(MultipartHttpServletRequest mhsq) throws Exception {
		System.out.println("uploadForm");
		ResponseEntity<String> entity = null;
				
		try {
			Iterator<String> iterator = mhsq.getFileNames();
			List<String> resultFileList = new ArrayList<String>();
			
			while (iterator.hasNext()) {
				MultipartFile mf = mhsq.getFile(iterator.next());
				resultFileList.add(FileUtils.uploadFile(mf));
			}
			
			logger.info("resultFileList={}", resultFileList);
			
			String resultFileListJson = JsonUtils.ListToJson(resultFileList);
			
			logger.info("resultFileListJson={}", resultFileListJson);
			
			entity = new ResponseEntity<>(resultFileListJson, HttpStatus.CREATED);
			
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
