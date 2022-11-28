package com.goodee.market.trade.item;

import java.sql.Date;
import java.util.List;

import com.goodee.market.member.MemberDTO;
import com.goodee.market.trade.item.like.ItemLikeDTO;


public class ItemDTO{
	
	   private Long itemNum;
	   private Long memberNum;
	   private String itemTitle;
	   private String itemContents;
	   private String itemCategory;
	   private Integer itemPrice;
	   private Date itemDueDate;
	   private Integer itemStatus;
	   
	   private List<ItemImageDTO> itemImageDTOs;
	   private List<ItemLikeDTO> itemLikeDTOs;
	   private List<BuyerDTO> buyerDTOs;
	   
	   
	   
	   
	public List<ItemLikeDTO> getItemLikeDTOs() {
		return itemLikeDTOs;
	}
	public void setItemLikeDTOs(List<ItemLikeDTO> itemLikeDTOs) {
		this.itemLikeDTOs = itemLikeDTOs;
	}
	public List<BuyerDTO> getBuyerDTOs() {
		return buyerDTOs;
	}
	public void setBuyerDTOs(List<BuyerDTO> buyerDTOs) {
		this.buyerDTOs = buyerDTOs;
	}
	public List<ItemImageDTO> getItemImageDTOs() {
	 return itemImageDTOs;
	}
	public void setItemImageDTOs(List<ItemImageDTO> itemImageDTOs) {
		this.itemImageDTOs = itemImageDTOs;
	}
  
	public Long getItemNum() {
		return itemNum;
	}
	public void setItemNum(Long itemNum) {
		this.itemNum = itemNum;
	}
	public Long getMemberNum() {
		if(this.memberNum==null) {
			this.memberNum=0L;
		}
		return memberNum;
	}
	public void setMemberNum(Long memberNum) {
		this.memberNum = memberNum;
	}
	public String getItemTitle() {
		return itemTitle;
	}
	public void setItemTitle(String itemTitle) {
		this.itemTitle = itemTitle;
	}
	public String getItemContents() {
		return itemContents;
	}
	public void setItemContents(String itemContents) {
		this.itemContents = itemContents;
	}
	public String getItemCategory() {
		return itemCategory;
	}
	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}
	public Integer getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(Integer itemPrice) {
		this.itemPrice = itemPrice;
	}
	public Date getItemDueDate() {
		return itemDueDate;
	}
	public void setItemDueDate(Date itemDueDate) {
		this.itemDueDate = itemDueDate;
	}
	public Integer getItemStatus() {
		return itemStatus;
	}
	public void setItemStatus(Integer itemStatus) {
		this.itemStatus = itemStatus;
	}
	

	
	
	
	   
	   
	   

}
