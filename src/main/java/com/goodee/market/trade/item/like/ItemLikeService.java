package com.goodee.market.trade.item.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemLikeService {

	@Autowired
	private ItemLikeDAO itemLikeDAO;
	
	public int setLike(ItemLikeDTO itemLikeDTO) throws Exception {
		return itemLikeDAO.setLike(itemLikeDTO);
	}


	
	public int setUnlike(ItemLikeDTO itemLikeDTO) throws Exception {
		return itemLikeDAO.setUnlike(itemLikeDTO);
	}
	
}
