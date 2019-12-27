package egovframework.myStore.manage.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.market.cmmn.service.util.SearchVO;
import egovframework.myStore.register.service.AttachVO;
import egovframework.myStore.register.service.ProductResultVO;
import egovframework.myStore.register.service.ProductVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("manageMapper")
public interface ManageMapper {

	List<ProductResultVO> selectProductList(Map<String, Object> paramMap) throws Exception;

	List<EgovMap> selectAttachList(Map<String, Object> paramMap) throws Exception;

	ProductResultVO selectProduct(String prodId) throws Exception;

	void updateProduct(ProductVO product) throws Exception;

	void deleteAttach(String prodId) throws Exception;

	void replaceAttach(AttachVO attachVO) throws Exception;

	void deleteProduct(String prodId) throws Exception;

	int selectProductListCnt(Map<String, Object> paramMap) throws Exception;
}
