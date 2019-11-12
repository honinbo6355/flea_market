package egovframework.myStore.register.service.impl;

import java.util.List;

import egovframework.myStore.register.service.AttachVO;
import egovframework.myStore.register.service.ProductVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("registerMapper")
public interface RegisterMapper {

	List<EgovMap> selectACategoryList() throws Exception;

	List<String> selectBCategoryList(String param) throws Exception;

	int insertProduct(ProductVO product) throws Exception;

	void insertAttach(AttachVO attachVO) throws Exception;
}
