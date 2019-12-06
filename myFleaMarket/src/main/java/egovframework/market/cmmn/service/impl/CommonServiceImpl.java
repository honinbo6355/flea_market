package egovframework.market.cmmn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import egovframework.market.cmmn.service.Category;
import egovframework.market.cmmn.service.CommonService;

@Service("commonService")
public class CommonServiceImpl implements CommonService{

	@Resource(name = "commonMapper")
	private CommonMapper commonMapper;
	
	@Override
	public List<Category> getCategoryList() throws Exception {
		return commonMapper.selectCategoryList();
	}
}
