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
	public JsonArray getCategoryList() throws Exception {
		List<Category> categoryList;
		JsonArray jsonCategoryArray;
		Gson gson;
		JsonElement jsonCategoryElement;
		
		categoryList = commonMapper.selectCategoryList();
		
		gson = new Gson();
		jsonCategoryElement = gson.toJsonTree(categoryList, new TypeToken<List<Category>>() {}.getType());
			
		if (!jsonCategoryElement.isJsonArray()) {
			throw new Exception();
		}
		jsonCategoryArray = jsonCategoryElement.getAsJsonArray();

		System.out.println("getCategoryList() jsonCategoryArray : " + jsonCategoryArray);
		
		return jsonCategoryArray;
	}
}
