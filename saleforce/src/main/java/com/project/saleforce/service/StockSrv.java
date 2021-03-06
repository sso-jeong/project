package com.project.saleforce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.StockVO;
import com.project.saleforce.repository.StockDao;

@Service
public class StockSrv {

	@Autowired
	StockDao stockDao;
	
	public List<StockVO> getStockList(int start, int end, String searchOpt,String words) {
		return stockDao.getStockList(start, end, searchOpt, words);
	}
	
	public int getStockCount(String searchOpt, String words) {
		return stockDao.getStockCount(searchOpt, words);
	}
	
	public StockVO getOneStock(String itemcd) {
		return stockDao.getOneStock(itemcd);
	}
	
	public List<StockVO> getStockDetail(int start, int end, String searchOpt,String words, String itemcd) {
		return stockDao.getStockDetail(start, end, searchOpt, words, itemcd);
	}
	
	public int getStockDetailCount(String searchOpt,String words, String itemcd) {
		return stockDao.getStockDetailCount(searchOpt, words, itemcd);
	}
	
	public void setStockDetailIn(StockVO svo) {
		stockDao.setStockDetailIn(svo);
	}
	
	public void setStockDetailOut(StockVO svo) {
		stockDao.setStockDetailOut(svo);
	}
	
	public void updateStockIn(StockVO svo) {
		stockDao.updateStockIn(svo);
	}
	
	public void updateStockOut(StockVO svo) {
		stockDao.updateStockOut(svo);
	}
	
	public void deleteStock(String itemcd) {
		stockDao.deleteStock(itemcd);
	}
	
	public void deleteStockInfo(String itemcd, int seq) {
		stockDao.deleteStockInfo(itemcd, seq);
	}
}
