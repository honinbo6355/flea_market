package egovframework.market.login.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import egovframework.market.cmmn.service.util.JsonUtils;
import egovframework.market.login.service.Authority;
import egovframework.market.login.service.LoginService;
import egovframework.market.login.service.NaverLoginApi;
import egovframework.market.login.service.UserVO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	@Resource(name = "loginMapper")
	private LoginMapper loginMapper;
	
	private final static String CLIENT_ID = "HzqEe9I_XQh7_p3MpmVG";
	private final static String CLIENT_SECRET = "mjIAc_gT3k";
	//private final static String REDIRECT_URI = "http://localhost:8080/myFleaMarket/callback.do";
	private final static String REDIRECT_URI = "http://13.124.225.208:8080/myFleaMarket/callback.do";
	private final static String SESSION_STATE = "oauth_state";
	/* 프로필 조회 API URL */
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	/* 네아로 인증  URL 생성  Method */
	@Override
	public String getAuthorizationUrl(HttpSession session) throws Exception {
		/* 세션 유효성 검증을 위하여 난수를 생성 */
		String state = generateRandomString();
		/* 생성한 난수 값을 session에 저장 */
		setSession(session,state);

		/* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.state(state) //앞서 생성한 난수값을 인증 URL생성시 사용함
				.build(NaverLoginApi.instance());

		return oauthService.getAuthorizationUrl();
	}
	
	/* 네아로 Callback 처리 및  AccessToken 획득 Method */
	@Override
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{
		
		/* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
		String sessionState = getSession(session);
		if(StringUtils.equals(sessionState, state)){
		
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(CLIENT_ID)
					.apiSecret(CLIENT_SECRET)
					.callback(REDIRECT_URI)
					.state(state)
					.build(NaverLoginApi.instance());
					
			/* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;
	}
	
	/* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
	@Override
	public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{

		OAuth20Service oauthService =new ServiceBuilder()
    			.apiKey(CLIENT_ID)
    			.apiSecret(CLIENT_SECRET)
    			.callback(REDIRECT_URI).build(NaverLoginApi.instance());
    	
    	OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		return response.getBody();
	}
	
	/* 세션 유효성 검증을 위한 난수 생성기 */
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	
	/* http session에 데이터 저장 */
	private void setSession(HttpSession session,String state){
		session.setAttribute(SESSION_STATE, state);		
	}

	/* http session에서 데이터 가져오기 */	
	private String getSession(HttpSession session){
		return (String) session.getAttribute(SESSION_STATE);
	}
	
	@Override
	public UserVO getUserByNaverId(Map<String, Object> idMap) throws Exception {
		return loginMapper.selectUserByNaverId(idMap);
	}

	@Override
	public int addNaverUser(Map<String, Object> paramMap) throws Exception {
		int snsRegisterResult;
		int id;
		Authority authority;
		
		String snsRegisterPhone1 = (String)paramMap.remove("snsRegisterPhone1");
		String snsRegisterPhone2 = (String)paramMap.remove("snsRegisterPhone2");
		String snsRegisterPhone3 = (String)paramMap.remove("snsRegisterPhone3");
		String snsRegisterPhone = snsRegisterPhone1 + '-' + snsRegisterPhone2 + '-' + snsRegisterPhone3;
		
		String snsRegisterAddr = (String)paramMap.remove("snsRegisterAddr");
		String snsRegisterAddrDetail = (String)paramMap.remove("snsRegisterAddrDetail");
		String snsRegisterFullAddr = snsRegisterAddr + ' ' + snsRegisterAddrDetail;
		
		paramMap.put("snsRegisterPhone", snsRegisterPhone);
		paramMap.put("snsRegisterFullAddr", snsRegisterFullAddr);
		
		loginMapper.insertNaverUser(paramMap);
		
		id = (int)paramMap.get("id");
		
		System.out.println("paramMap.get('id') : " + id);
		
		authority = new Authority(id, "user");
		snsRegisterResult = loginMapper.insertAuthority(authority);
		
		return snsRegisterResult;
	}
	
	@Override
	public String emailCheck(String param) throws Exception {
		Map<String, Object> paramMap, countMap;
		int count;
		String countJson, email;
		
		paramMap = JsonUtils.JsonToMap(param);
    	
    	System.out.println("paramMap : " + paramMap);
    	
    	email = (String)paramMap.get("email");
    	
    	System.out.println("email : " + email);
		
    	count = loginMapper.emailCheck(email);
    	
    	System.out.println("count : " + count);
    	
    	countMap = new HashMap<String, Object>();
    	
    	countMap.put("count", count);
    	
    	countJson = JsonUtils.MapToJson(countMap);
    	
    	System.out.println("countJson : " + countJson);
		
		return countJson;
	}
	
	@Override
	public String nicknameCheck(String param) throws Exception {
		Map<String, Object> paramMap, countMap;
		int count;
		String countJson, nickname;
		
		paramMap = JsonUtils.JsonToMap(param);
    	
    	System.out.println("paramMap : " + paramMap);
    	
    	nickname = (String)paramMap.get("nickname");
    	
    	System.out.println("nickname : " + nickname);
		
    	count = loginMapper.nicknameCheck(nickname);
    	
    	System.out.println("count : " + count);
    	
    	countMap = new HashMap<String, Object>();
    	
    	countMap.put("count", count);
    	
    	countJson = JsonUtils.MapToJson(countMap);
    	
    	System.out.println("countJson : " + countJson);
		
		return countJson;
	}
	
	@Override
	public int addUser(Map<String, Object> paramMap) throws Exception {
		int registerResult, id;
		Authority authority;
		
		String registerPhone1 = (String)paramMap.remove("registerPhone1");
		String registerPhone2 = (String)paramMap.remove("registerPhone2");
		String registerPhone3 = (String)paramMap.remove("registerPhone3");
		String registerPhone = registerPhone1 + '-' + registerPhone2 + '-' + registerPhone3;
		
		String registerAddr = (String)paramMap.remove("registerAddr");
		String registerAddrDetail = (String)paramMap.remove("registerAddrDetail");
		String registerFullAddr = registerAddr + ' ' + registerAddrDetail;
		
		paramMap.put("registerPhone", registerPhone);
		paramMap.put("registerFullAddr", registerFullAddr);
		
		loginMapper.insertUser(paramMap);
		
		id = (int)paramMap.get("id");
		
		authority = new Authority(id, "user");
		registerResult = loginMapper.insertAuthority(authority);

		return registerResult;
	}

	@Override
	public UserVO getUserById(String email) throws Exception {
		return loginMapper.selectUserById(email);
	}
}
