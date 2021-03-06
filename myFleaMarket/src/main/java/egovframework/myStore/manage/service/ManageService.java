package egovframework.myStore.manage.service;

import java.util.List;
import java.util.Map;

import egovframework.market.cmmn.service.util.SearchVO;
import egovframework.myStore.register.service.AttachVO;
import egovframework.myStore.register.service.ProductResultVO;
import egovframework.myStore.register.service.ProductVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface ManageService {
	List<ProductResultVO> getProductList(Map<String, Object> paramMap) throws Exception;
	List<EgovMap> getAttachList(Map<String, Object> paramMap) throws Exception;
	ProductResultVO getProduct(String prodId) throws Exception;
	void modifyProduct(ProductVO product, AttachVO attach) throws Exception;
	void deleteProduct(String prodId) throws Exception;
	int getProductListCnt(Map<String, Object> paramMap) throws Exception;
}
