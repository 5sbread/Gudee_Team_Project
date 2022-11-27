package com.goodee.market.trade.myPage;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.market.member.MemberDTO;
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
	public List<ItemDTO> getSellItemList (MemberDTO memberDTO) throws Exception{
		
		return myPageDAO.getSellItemList(memberDTO);
	}
	
	//구매 리스트
	public List<ItemDTO> getBuyItemList(MemberDTO memberDTO) throws Exception{
		return myPageDAO.getBuyItemList(memberDTO);
	}
	
	//후기글 리스트
	public List<ReviewDTO> getReviewList (MemberDTO memberDTO) throws Exception{
		return myPageDAO.getReviewList(memberDTO);
	}
	

}
