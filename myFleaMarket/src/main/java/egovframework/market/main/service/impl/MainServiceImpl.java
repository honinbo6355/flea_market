package egovframework.market.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.market.main.service.MainService;
import egovframework.myStore.register.service.ProductResultVO;

@Service("mainService")
public class MainServiceImpl implements MainService {

	@Resource(name = "mainMapper")
	private MainMapper mainMapper;
	
	@Override
	public List<ProductResultVO> getRecommProductList() throws Exception {
		return mainMapper.selectRecommProductList();
	}
}
