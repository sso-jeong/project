package com.project.saleforce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.CommuteManageVO;
import com.project.saleforce.repository.CommuteDao;

@Service
public class CommuteSrv {
	
	@Autowired
	CommuteDao commuDao;
	
	public List<CommuteManageVO> getCommuteList(int start, int end, String searchOpt, String words){
		return commuDao.getCommuteList(start, end, searchOpt, words);
	}
	
	public int getCommuteCount(String searchOpt, String words) {
		return commuDao.getCommuteCount(searchOpt, words);
	}
	
	public List<CommuteManageVO> perCommuteList(int start, int end, String searchOpt, String words, String empid){
		return commuDao.perCommuteList(start, end, searchOpt, words, empid);
	}
	
	public int perCommuteCount(String searchOpt, String words, String empid) {
		return commuDao.perCommuteCount(searchOpt, words, empid);
	}
	
	public CommuteManageVO getCommuteListOne(String dlnum) {
		return commuDao.getCommuteListOne(dlnum);
	}
	
	public List<CommuteManageVO> commutepopup(String dlnum){
		return commuDao.commutepopup(dlnum);
	}
	
	/*
	 * public void setCommuteOthers(CommuteManageVO commutevo) {
	 * commuDao.setCommuteOthers(commutevo); }
	 */
	
	public void updateCommuteRemark(CommuteManageVO commutevo) {
		commuDao.updateCommuteRemark(commutevo);
	}
	public void setCommuteP(CommuteManageVO cvo) {
		commuDao.setCommuteP(cvo);
	}
	
	public void setCommuteInfoP(CommuteManageVO cvo) {
		commuDao.setCommuteInfoP(cvo);
	}
	
	public void deleteCommuteInfo(String dlnum) {
		commuDao.deleteCommuteInfo(dlnum);
	}

}
