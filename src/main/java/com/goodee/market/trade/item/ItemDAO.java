package com.goodee.market.trade.item;

import java.util.List;


import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitterReturnValueHandler;

import com.goodee.market.member.MemberDTO;
import com.goodee.market.trade.review.ReviewDTO;
import com.goodee.market.util.MainPager;
import com.goodee.market.util.Pager;


@Repository
public class ItemDAO implements ItemInterface{

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.goodee.market.trade.item.ItemDAO.";
	
	
	
	  // fileDetail
		public ItemImageDTO getFileDetail(ItemImageDTO itemImageDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getFileDetail", itemImageDTO);
		}
	public int setFileDelete(ItemImageDTO itemImageDTO)throws Exception {
		return sqlSession.delete(NAMESPACE+"setFileDelete", itemImageDTO);
	}
	
	public int setAddFile(ItemImageDTO itemImageDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setAddFile", itemImageDTO);
	}

//----------------------------------------------------------------------	
	@Override 
	public Long getCount(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getCount", pager);
	}
	
	@Override
	public Long getMainCount(MainPager mainPager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getMainCount", mainPager);
	}
	
//----------------------------------------------------------------------	
	
	@Override
	public ItemDTO getDetail(ItemDTO itemDTO)throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getDetail",itemDTO);
	}
	
	@Override
	public int setAdd(ItemDTO itemDTO, MultipartFile[] files, ServletContext servletContext) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setAdd", itemDTO);

	}
	
	@Override
	public int setUpdate(ItemDTO itemDTO, MultipartFile [] files, ServletContext servletContext)throws Exception {
		
		return sqlSession.update(NAMESPACE+"setUpdate", itemDTO);
	}
	
	@Override
	public int setDelete(ItemDTO itemDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", itemDTO);
	}

//----------------------------------------------------------------------	
	@Override
	public List<ItemDTO> getList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList",pager);
	}

	@Override
	public List<ItemDTO> getTradeMain(MainPager mainPager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getTradeMain", mainPager);
	}

	@Override
	public List<ItemDTO> getLikeList(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getLikeList", memberDTO);
	}
}

