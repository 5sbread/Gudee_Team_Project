package com.goodee.market.trade.myPage;

import java.util.List;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goodee.market.member.MemberDTO;
import com.goodee.market.trade.item.ItemDTO;
import com.goodee.market.trade.review.ReviewDTO;
import com.goodee.market.trade.sellItemList.SellItemListDTO;
import com.goodee.market.util.MyPagePager;

@Repository
public class MyPageDAO implements MyPageInterface{
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goodee.market.trade.myPage.MyPageDAO.";
	
	
	@Override
	public MemberDTO getMyPage(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE +"getMyPage", memberDTO);
	}
	
		
	//찜 목록
	
	
	//판매 리스트
	@Override
	public List<ItemDTO> getSellItemList(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE +"getSellItemList", memberDTO);
	}
	
	


	//구매 리스트
	@Override
	public List<ItemDTO> getBuyItemList(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getBuyItemList", memberDTO);
	}
	
	
	//작성한 후기글 리스트
	@Override
	public List<ReviewDTO> getReviewList(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getReviewList", memberDTO);
	}
	
	@Override
	public Long getMyPageCount(MyPagePager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getMyPageCount", pager);
	}
	
	
}
