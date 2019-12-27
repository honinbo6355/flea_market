package egovframework.market.main.service;

import java.util.List;

import egovframework.myStore.register.service.ProductResultVO;


public interface MainService {

	List<ProductResultVO> getRecommProductList() throws Exception;
}
