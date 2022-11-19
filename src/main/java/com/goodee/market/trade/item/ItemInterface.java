package com.goodee.market.trade.item;

import java.util.List;


import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import com.goodee.market.member.MemberDTO;
import com.goodee.market.util.MainPager;
import com.goodee.market.util.Pager;

public interface ItemInterface {
	

	public List<ItemDTO> getTradeMain(MainPager mainpager) throws Exception;
	
	public List<ItemDTO> getList(Pager pager)throws Exception;

	public List<ItemDTO> getLikeList (MemberDTO memberDTO) throws Exception;
	
	
	public int setAddFile(ItemImageDTO itemImageDTO)throws Exception;
	
	public int setFileDelete(ItemImageDTO itemImageDTO)throws Exception;
	
	public Long getCount(Pager pager) throws Exception;
	
	public Long getMainCount (MainPager mainPager) throws Exception;
	
	
	public ItemDTO getDetail(ItemDTO itemDTO) throws Exception;
	
	public int setAdd(ItemDTO itemDTO, MultipartFile[] files, ServletContext servletContext)throws Exception;
	
	public int setUpdate(ItemDTO itemDTO, MultipartFile[] files, ServletContext servletContext) throws Exception;
	
	public int setDelete(ItemDTO itemDTO) throws Exception;

}
