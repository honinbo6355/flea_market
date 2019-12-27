package egovframework.market.main.service.impl;

import java.util.List;

import egovframework.myStore.register.service.ProductResultVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mainMapper")
public interface MainMapper {

	List<ProductResultVO> selectRecommProductList() throws Exception;
}
