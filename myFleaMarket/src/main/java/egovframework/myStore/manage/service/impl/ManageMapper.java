package egovframework.myStore.manage.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.market.cmmn.service.util.SearchVO;
import egovframework.myStore.register.service.AttachVO;
import egovframework.myStore.register.service.ProductVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("manageMapper")
public interface ManageMapper {

	List<ProductVO> selectProductList(Map<String, Object> paramMap) throws Exception;

	List<EgovMap> selectAttachList(Map<String, Object> paramMap) throws Exception;

	ProductVO selectProduct(String prodId) throws Exception;

	Object updateProduct(ProductVO product, AttachVO attach) throws Exception;

	void updateProduct(ProductVO product) throws Exception;

	void deleteAttach(String prodId) throws Exception;

	void replaceAttach(AttachVO attachVO) throws Exception;

	void deleteProduct(String prodId) throws Exception;

	int selectProductListCnt(Map<String, Object> paramMap) throws Exception;
}
