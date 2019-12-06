package egovframework.market.main.service;

import java.util.List;

import egovframework.myStore.register.service.ProductVO;

public interface MainService {

	List<ProductVO> getRecommProductList() throws Exception;
}
