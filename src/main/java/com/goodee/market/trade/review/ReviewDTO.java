package com.goodee.market.trade.review;

import java.util.List;

import com.goodee.market.trade.item.ItemDTO;

public class ReviewDTO{
	
	//itemNum
	//memberNum
	
	private Long reviewNum;
	private String reviewTitle;
	private String reviewContent;
	private Integer reviewHit;
	private Integer reviewStar;
	private String reviewCategory;
	
	private List<ReviewImageDTO> reviewImageDTOs;
	
//-----------------------------------------------	
	public Long getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(Long reviewNum) {
		this.reviewNum = reviewNum;
	}
	
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Integer getReviewHit() {
		return reviewHit;
	}
	public void setReviewHit(Integer reviewHit) {
		this.reviewHit = reviewHit;
	}
	public Integer getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(Integer reviewStar) {
		this.reviewStar = reviewStar;
	}
	public List<ReviewImageDTO> getReviewImageDTOs() {
		return reviewImageDTOs;
	}
	public void setReviewImageDTOs(List<ReviewImageDTO> reviewImageDTOs) {
		this.reviewImageDTOs = reviewImageDTOs;
	}
	public String getReviewCategory() {
		return reviewCategory;
	}
	public void setReviewCategory(String reviewCategory) {
		this.reviewCategory = reviewCategory;
	}
	
	
	
	
	
	
	

}
