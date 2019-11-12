package egovframework.market.login.service.impl;

import java.util.Map;

import egovframework.market.login.service.Authority;
import egovframework.market.login.service.UserVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("loginMapper")
public interface LoginMapper {

	UserVO selectUserByNaverId(Map<String, Object> idMap) throws Exception;

	int insertNaverUser(Map<String, Object> paramMap) throws Exception;

	int insertAuthority(Authority authority) throws Exception;

	int emailCheck(String email) throws Exception;
			
	int nicknameCheck(String nickname) throws Exception;

	int insertUser(Map<String, Object> paramMap) throws Exception;

	UserVO selectUserById(String email) throws Exception;
}
