package com.goodee.market.trade.item.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.market.trade.item.ItemDTO;

@Service
public class ItemLikeService {

	@Autowired
	private ItemLikeDAO itemLikeDAO;
	
	public int setLike(ItemLikeDTO itemLikeDTO) throws Exception {
		return itemLikeDAO.setLike(itemLikeDTO);
	}
	
	
	public boolean isLikeExist (ItemLikeDTO itemLikeDTO) throws Exception {
		int exist = itemLikeDAO.isLikeExist(itemLikeDTO);
		boolean isExist = false;
		
		if (exist == 1) {
			isExist = true;
		}
		return isExist;
	}

	
	public int setUnlike(ItemLikeDTO itemLikeDTO) throws Exception {
		return itemLikeDAO.setUnlike(itemLikeDTO);
	}
	
	public int getItemLike (ItemDTO itemDTO) throws Exception {
		return itemLikeDAO.getItemLike(itemDTO);
	}
	
}
