package egovframework.myStore.manage.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.market.cmmn.service.util.FileUtils;
import egovframework.market.cmmn.service.util.JsonUtils;
import egovframework.myStore.manage.service.ManageService;
import egovframework.myStore.register.service.AttachVO;
import egovframework.myStore.register.service.ProductVO;
import egovframework.myStore.register.service.impl.RegisterMapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("manageService")
public class ManageServiceImpl implements ManageService {

	@Resource(name = "manageMapper")
	private ManageMapper manageMapper;
	
	@Override
	public List<ProductVO> getProductList(int userId) throws Exception {
		return manageMapper.selectProductList(userId);
	}

	@Override
	public List<EgovMap> getAttachList(Map<String, Object> paramMap) throws Exception {
		return manageMapper.selectAttachList(paramMap);
	}

	@Override
	public ProductVO getProduct(String prodId) throws Exception {
		return manageMapper.selectProduct(prodId);
	}
	
	@Transactional
	@Override
	public void modifyProduct(ProductVO product, AttachVO attach) throws Exception {
		manageMapper.deleteAttach(Integer.toString(product.getProdId()));
		manageMapper.updateProduct(product);
		
		if (attach == null) { return; }
		
		List<AttachVO> attachList = attach.getAttachList();
		
		for (AttachVO attachVO : attachList) {
			manageMapper.replaceAttach(attachVO);
		}
	}

	@Transactional
	@Override
	public void deleteProduct(String prodId) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("prodId", prodId);
		
		List<EgovMap> attachList = manageMapper.selectAttachList(paramMap);
		
		for (EgovMap map : attachList) {
			String fileName = (String)map.get("storedFileName");
			FileUtils.deleteFile(fileName);
		}
		
		manageMapper.deleteAttach(prodId);
		manageMapper.deleteProduct(prodId);
	}
}
