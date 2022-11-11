package com.goodee.market.trade.myPage;

import java.util.List;

import com.goodee.market.member.MemberDTO;
import com.goodee.market.trade.buyItemList.BuyItemListDTO;
import com.goodee.market.trade.item.ItemDTO;
import com.goodee.market.trade.review.ReviewDTO;
import com.goodee.market.trade.sellItemList.SellItemListDTO;
import com.goodee.market.util.MyPagePager;

public interface MyPageInterface {
	
	
	//찜 리스트
	//public List<E> getHeartList() throws Exception;
	
	//마이페이지 메인
	public MemberDTO getMyPage(MemberDTO memberDTO) throws Exception;
	
	//판매 리스트
	public List<ItemDTO> getSellItemList(MemberDTO memberDTO) throws Exception;
	
	//구매 리스트
	public List<ItemDTO> getBuyItemList(ItemDTO itemDTO) throws Exception;
	
	//작성한 후기글 리스트
	public List<ReviewDTO> getReviewList(ReviewDTO reviewDTO) throws Exception;
	
	public Long getMyPageCount (MyPagePager pager) throws Exception;

}
