package com.project.saleforce.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.saleforce.model.CommuteManageVO;
import com.project.saleforce.repository.MainDao;

@Service
public class MainSrv {

	@Autowired
	MainDao mainDao;

	public void setCommute(CommuteManageVO commutevo) {
		mainDao.setCommute(commutevo);
	}
	
	public void setCommuteInfo(CommuteManageVO commutevo) {
		mainDao.setCommuteInfo(commutevo);
	}
	
	public void getStrTime(CommuteManageVO commutevo) {
		mainDao.getStrTime(commutevo);
	}
	
	public void getEndTime(CommuteManageVO commutevo) {
		mainDao.getEndTime(commutevo);
	}
	
	public CommuteManageVO commuLoadMain(String empid) {
		return mainDao.commuLoadMain(empid);
	}
	
	public void updateOfftime(CommuteManageVO commutevo) {
		mainDao.updateOfftime(commutevo);
	}
	
	public void updateEndTime(CommuteManageVO commutevo) {
		mainDao.updateEndTime(commutevo);
	}
	
	public void updatetottime(CommuteManageVO commutevo) {
		mainDao.updatetottime(commutevo);
	}
	
	public void dlInfoInsert(CommuteManageVO commutevo) {
		mainDao.dlInfoInsert(commutevo);
	}

}
