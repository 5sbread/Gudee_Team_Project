package com.goodee.market.trade.myPage;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.market.member.MemberDTO;
import com.goodee.market.trade.buyItemList.BuyItemListDTO;
import com.goodee.market.trade.item.ItemDTO;
import com.goodee.market.trade.review.ReviewDTO;
import com.goodee.market.trade.sellItemList.SellItemListDTO;
import com.goodee.market.util.MyPagePager;

@Service
public class MyPageService {
	
	@Autowired
	private MyPageDAO myPageDAO;
	
	
	public MemberDTO getMyPage (MemberDTO memberDTO) throws Exception{
		return myPageDAO.getMyPage(memberDTO);
	}
	
	//판매 리스트
	public List<ItemDTO> getSellItemList (MyPagePager myPagePager) throws Exception{
		Long totalCount = myPageDAO.getMyPageCount(myPagePager);
		myPagePager.getNum(totalCount);
		myPagePager.getRowNum();
		
		return myPageDAO.getSellItemList(myPagePager);
	}
	
	//구매 리스트
	public List<ItemDTO> getBuyItemList(ItemDTO itemDTO) throws Exception{
		return myPageDAO.getBuyItemList(itemDTO);
	}
	
	//후기글 리스트
	public List<ReviewDTO> getReviewList (ReviewDTO reviewDTO) throws Exception{
		return myPageDAO.getReviewList(reviewDTO);
	}
	

}
