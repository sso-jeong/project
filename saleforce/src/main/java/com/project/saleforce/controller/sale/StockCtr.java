package com.project.saleforce.controller.sale;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.saleforce.model.StockVO;
import com.project.saleforce.paging.Pager;
import com.project.saleforce.service.StockSrv;

@Controller
public class StockCtr {
	@Autowired
	StockSrv sSrv;

	@RequestMapping("SFA_stock_manage")
	public ModelAndView getStockList(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "s.itemcd") String searchOpt, @RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		int count = sSrv.getStockCount(searchOpt, words);
		Pager pager = new Pager(count, curPage);

		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<StockVO> list = sSrv.getStockList(start, end, searchOpt, words);
		mav.addObject("stocklist", list);
		mav.addObject("count", count);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);

		mav.addObject("start", start);
		mav.addObject("end", end);

		mav.addObject("blockBegin", pager.getBlockBegin());
		mav.addObject("blockEnd", pager.getBlockEnd());
		mav.addObject("curBlock", pager.getCurBlock());
		mav.addObject("totalBlock", pager.getTotBlock());

		mav.addObject("prevPage", pager.getPrevPage());
		mav.addObject("nextPage", pager.getNextPage());
		mav.addObject("curPage", pager.getCurPage());
		mav.addObject("totalPage", pager.getTotPage());

		mav.addObject("selected", pager.getCurPage());

		mav.setViewName("sale/SFA_stock_manage");
		return mav;
	}

	@RequestMapping("/getOneStock")
	@ResponseBody
	public StockVO getOneStock(String itemcd) {
		return sSrv.getOneStock(itemcd);
	}

	@RequestMapping("/stockpopup")
	public ModelAndView stockpopup(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "d.indt") String searchOpt, @RequestParam(defaultValue = "") String words,
			String itemcd) {
		ModelAndView mav = new ModelAndView();
		int count = sSrv.getStockDetailCount(searchOpt, words, itemcd);
		Pager pager = new Pager(count, curPage);

		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<StockVO> list = sSrv.getStockDetail(start, end, searchOpt, words, itemcd);

		mav.addObject("stockdetaillist", list);
		mav.addObject("count", count);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);

		mav.addObject("start", start);
		mav.addObject("end", end);

		mav.addObject("blockBegin", pager.getBlockBegin());
		mav.addObject("blockEnd", pager.getBlockEnd());
		mav.addObject("curBlock", pager.getCurBlock());
		mav.addObject("totalBlock", pager.getTotBlock());

		mav.addObject("prevPage", pager.getPrevPage());
		mav.addObject("nextPage", pager.getNextPage());
		mav.addObject("curPage", pager.getCurPage());
		mav.addObject("totalPage", pager.getTotPage());

		mav.addObject("selected", pager.getCurPage());

		mav.setViewName("/popup/stockpopup");
		return mav;
	}

}
