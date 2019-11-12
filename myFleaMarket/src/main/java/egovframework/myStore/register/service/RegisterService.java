package egovframework.myStore.register.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface RegisterService {

	List<EgovMap> getACategoryList() throws Exception;
	String getBCategoryList(String param) throws Exception;
	void registerProduct(ProductVO product, AttachVO attach) throws Exception;
}
