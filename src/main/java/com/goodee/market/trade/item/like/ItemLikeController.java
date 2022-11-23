package com.goodee.market.trade.item.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping ("/itemlike/*")
public class ItemLikeController {
	
	@Autowired
	private ItemLikeService itemLikeService;
	
	@PostMapping("like")
	@ResponseBody
	public int addLike(ItemLikeDTO itemLikeDTO) throws Exception {
		
		int result = itemLikeService.setLike(itemLikeDTO);
		return result;
	}
	
	
	@PostMapping("unlike")
	@ResponseBody
	public int deleteLike(ItemLikeDTO itemLikeDTO) throws Exception {
		
		int result = itemLikeService.setUnlike(itemLikeDTO);
		return result;
	}
}
