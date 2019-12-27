package egovframework.market.cmmn.service;

import java.util.List;
import java.util.Map;

import com.google.gson.JsonArray;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CommonService {
	List<Category> getCategoryList() throws Exception;
}
