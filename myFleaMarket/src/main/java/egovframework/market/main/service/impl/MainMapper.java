package egovframework.market.main.service.impl;

import java.util.List;

import egovframework.myStore.register.service.ProductVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mainMapper")
public interface MainMapper {

	List<ProductVO> selectRecommProductList() throws Exception;
}
