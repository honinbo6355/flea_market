package egovframework.market.login.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;
import com.github.scribejava.core.model.OAuth2AccessToken;

public interface LoginService {
	
	String getAuthorizationUrl(HttpSession session) throws Exception;

	OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException;

	String getUserProfile(OAuth2AccessToken oauthToken) throws IOException;

	UserVO getUserByNaverId(Map<String, Object> idMap) throws Exception;

	int addNaverUser(Map<String, Object> paramMap) throws Exception;

	String emailCheck(String param) throws Exception;

	String nicknameCheck(String param) throws Exception;

	int addUser(Map<String, Object> paramMap) throws Exception;

	UserVO getUserById(String email) throws Exception;
}
