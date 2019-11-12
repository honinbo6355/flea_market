package egovframework.myStore.register.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.myStore.register.service.AttachVO;
import egovframework.myStore.register.service.ProductVO;
import egovframework.myStore.register.service.RegisterService;
import egovframework.market.cmmn.service.util.JsonUtils;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("registerService")
public class RegisterServiceImpl implements RegisterService {

	@Resource(name = "registerMapper")
	private RegisterMapper registerMapper;
	
	@Override
	public List<EgovMap> getACategoryList() throws Exception {
		return registerMapper.selectACategoryList();
	}

	@Override
	public String getBCategoryList(String param) throws Exception {
		
		System.out.println("param : " + param);
		
		Map<String, Object> paramMap = JsonUtils.JsonToMap(param);
		
		System.out.println("paramMap : " + paramMap);
		
		String aCategory = (String)paramMap.get("aCategory");
		
		System.out.println("param : " + param);
		
		List<String> bCategoryList = registerMapper.selectBCategoryList(aCategory);
		
		System.out.println("bCategoryList : " + bCategoryList);
	
		String bCategoryJson = JsonUtils.ListToJson(bCategoryList);
		
		return bCategoryJson;
	}

	@Transactional
	@Override
	public void registerProduct(ProductVO product, AttachVO attach) throws Exception {
		registerMapper.insertProduct(product);
		
		if (attach == null) { return; }
		
		List<AttachVO> attachList = attach.getAttachList();
		
		for (AttachVO attachVO : attachList) {
			registerMapper.insertAttach(attachVO);
		}
	}
}
