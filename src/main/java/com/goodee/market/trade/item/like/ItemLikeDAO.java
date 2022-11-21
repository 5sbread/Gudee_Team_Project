package com.goodee.market.trade.item.like;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ItemLikeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goodee.market.trade.item.like.ItemLikeDAO.";
	
	public int setLike(ItemLikeDTO itemLikeDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setLike", itemLikeDTO);
	}


	
	public int setUnlike(ItemLikeDTO itemLikeDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setUnlike", itemLikeDTO);
	}

}
