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
		//좋아요 누른 상태인지
		int exist = itemLikeDAO.isLikeExist(itemLikeDTO);
		System.out.println("EXIST"+exist);
		boolean isExist = false;
		//1이면 이미 누른 상태 -> 취소
		if (exist == 1) {
			isExist = true;
			System.out.println(isExist);
		}
		System.out.println(isExist);
		return isExist;
	}
	
	public int setUnlike(ItemLikeDTO itemLikeDTO) throws Exception {
		return itemLikeDAO.setUnlike(itemLikeDTO);
	}
	
	//상품의 좋아요 총 개수
	public int getItemLike (ItemDTO itemDTO) throws Exception {
		return itemLikeDAO.getItemLike(itemDTO);
	}
	
	//유저가 좋아요한 상품 갯수
	public int getLikeCount (ItemLikeDTO itemLikeDTO) throws Exception {
		int count = itemLikeDAO.getLikeCount(itemLikeDTO);
		return count;
	}
	
}
