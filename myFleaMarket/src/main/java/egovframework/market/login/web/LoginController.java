package egovframework.market.login.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;

import egovframework.market.cmmn.service.util.JsonUtils;
import egovframework.market.login.service.LoginService;
import egovframework.market.login.service.UserVO;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Controller
public class LoginController {
	
	@Resource(name = "loginService")
	private LoginService loginService;
	
    @RequestMapping(value = "/loginRegister.do", method = RequestMethod.GET) 
    public String loginRegister(HttpSession session, ModelMap model) throws Exception {
    	try {
    		/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
        	String naverAuthUrl = loginService.getAuthorizationUrl(session);
        	System.out.println("naverAuthUrl : " + naverAuthUrl);
        	model.addAttribute("naverAuthUrl", naverAuthUrl);
        	
    	} catch(Exception e) {
    		System.out.println(e.getMessage());
    	} finally {
    		System.out.println("loginRegister 메소드 종료\n\n\n");
    	}
    	
    	return "login/loginRegister.tiles";
    }
    
    @RequestMapping(value = "/callback.do", method = RequestMethod.GET)
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session, ModelMap model, RedirectAttributes redirectAttributes) throws Exception {
    	
    	try {
    		Map<String, Object> idMap = new HashMap<String, Object>();
    		UserVO user;
    		
    		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
    		OAuth2AccessToken oauthToken = loginService.getAccessToken(session, code, state);
    		String apiResult = loginService.getUserProfile(oauthToken);
    		System.out.println("apiResult : " + apiResult);

    		JsonParser parser = new JsonParser();
    		JsonElement element = parser.parse(apiResult);
    		String id = element.getAsJsonObject().get("response").getAsJsonObject().get("id").getAsString();
    		
    		System.out.println("element : " + element);
    		System.out.println("id : " + id);
    		
    		idMap.put("id", id);
    		
    		user = loginService.getUserByNaverId(idMap);
    		
    		if (user == null) { //만약 일치하는 사용자가 없다면 네이버 사용자 계정으로 회원가입이 가능하도록 한다 
    			UserVO joinNaverUser = new UserVO();
    			joinNaverUser.setSnsId(id);
    			joinNaverUser.setEmail(element.getAsJsonObject().get("response").getAsJsonObject().get("email").getAsString());
    			model.addAttribute("NEW_SNS_USER", joinNaverUser);
    			return "login/snsRegister.tiles";
    		}
    		
    		System.out.println("user.getAuthority() : " + user.getAuthority().getAuthority());
    		// 만약 일치하는 사용자가 있다면 메인 페이지로 이동
    		session.setAttribute("USER", user);
    		
    	} catch(Exception e) {
    		System.out.println(e.getMessage());
    	} finally {
    		System.out.println("callback 메소드 종료\n\n\n");
    	}
    	
    	return "redirect:/main.do";
	}
    
    @RequestMapping(value = "/login.do", method = RequestMethod.POST, produces="application/json; charset=utf-8")
    @ResponseBody
    public String login(@RequestBody String param, HttpSession session) throws Exception {
    	String loginResultJson = null;
    	try {
    		Map<String, Object> paramMap = JsonUtils.JsonToMap(param);

    		System.out.println("paramMap : " + paramMap);
    		
    		String email = (String)paramMap.get("email");
    		String pw = (String)paramMap.get("pw");
    		
    		UserVO user = loginService.getUserById(email);
    	
    		System.out.println("user : " + user);
    		
    		Map<String, Object> loginResultMap = new HashMap<String, Object>();
    		
    		if (user == null) /* 아이디가 존재하지 않을 경우 */
    			loginResultMap.put("loginResult", "idError");
    		else if (!user.getPassword().equals(pw)) /* 비밀번호가 일치하지 않을 경우 */
    			loginResultMap.put("loginResult", "pwError");
    		else { /* 로그인 성공할 경우 */
    			loginResultMap.put("loginResult", "success");
    			session.setAttribute("USER", user);
    		}
    		loginResultJson = JsonUtils.MapToJson(loginResultMap);
    		
    	} catch (Exception e) {
    		System.out.println(e.getMessage());
    	} finally {
    		System.out.println("login 메소드 종료\n\n\n");
    	}
    	
    	return loginResultJson;
    }
    
    @RequestMapping(value = "/userSnsRegister.do", method = RequestMethod.POST)
    public String userSnsRegister(@RequestParam Map<String, Object> paramMap, RedirectAttributes redirectAttributes) throws Exception {
    	try {
    		System.out.println("paramMap : " + paramMap);
        	
        	int snsRegisterResult = loginService.addNaverUser(paramMap);
        	redirectAttributes.addFlashAttribute("SNS_REGISTER_RESULT", snsRegisterResult);
        	//User joinedNaverUser = loginService.getUserByNaverId(idMap);
        	//session.setAttribute("USER", joinedNaverUser);
        
    	} catch (Exception e) {
    		System.out.println(e.getMessage());
    	} finally {
    		System.out.println("userSnsRegister 메소드 종료\n\n\n");
    	}
 
    	return "redirect:/loginRegister.do";
    }
    
    @RequestMapping(value = "/emailCheck.do", method = RequestMethod.POST, produces="application/json; charset=utf-8")
    @ResponseBody
    public String emailCheck(@RequestBody String param) throws Exception {
    	String countJson = null;
    	try {
    		System.out.println("param : " + param);
    		
    		countJson = loginService.emailCheck(param);
            
    	} catch (Exception e) {
    		System.out.println(e.getMessage());
    	} finally {
    		System.out.println("emailCheck 메소드 종료\n\n\n");
    	}
    	
    	return countJson;
    }
    
    @RequestMapping(value = "/nicknameCheck.do", method = RequestMethod.POST, produces="application/json; charset=utf-8")
    @ResponseBody
    public String nicknameCheck(@RequestBody String param) throws Exception {
    	String countJson = null;
    	try {
    		System.out.println("param : " + param);
    		
    		countJson = loginService.nicknameCheck(param);
        	
    	} catch (Exception e) {
    		System.out.println(e.getMessage());
    	} finally {
    		System.out.println("nicknameCheck 메소드 종료\n\n\n");
    	}
    	
    	return countJson;
    }
    
    @RequestMapping(value = "/userRegister.do", method = RequestMethod.POST)
    public String userRegister(@RequestParam Map<String, Object> paramMap, RedirectAttributes redirectAttributes) throws Exception {
    	try {
    		System.out.println("paramMap : " + paramMap);
    		
        	int userRegisterResult = loginService.addUser(paramMap);
        		
        	System.out.println("userRegisterResult : "  + userRegisterResult);
        		
        	redirectAttributes.addFlashAttribute("USER_REGISTER_RESULT", userRegisterResult);
        	
    	} catch (Exception e) {
    		System.out.println(e.getMessage());
    	} finally {
    		System.out.println("userRegister 메소드 종료\n\n\n");
    	}
   
    	return "redirect:/loginRegister.do";
    }
    
    @RequestMapping(value = "/logout.do", method = RequestMethod.GET)
    public String logout(HttpSession session) {
    	session.removeAttribute("USER");
    	return "redirect:/main.do";
    }
}
