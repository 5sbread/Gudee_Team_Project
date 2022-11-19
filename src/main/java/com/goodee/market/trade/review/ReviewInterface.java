package com.goodee.market.trade.review;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;
import com.goodee.market.util.Pager;
import com.goodee.market.util.ReviewPager;

public interface ReviewInterface {

	public List<ReviewDTO> getReviewMain(ReviewPager pager) throws Exception;
	
	
	public Long getCount(ReviewPager pager) throws Exception;

	public ReviewDTO getDetail(ReviewDTO reviewDTO) throws Exception;
	
	public int setAdd(ReviewDTO reviewDTO, MultipartFile[] files, ServletContext servletContext)throws Exception;
	
	public int setAddFile(ReviewImageDTO reviewImageDTO)throws Exception;
	
	public int setUpdate(ReviewDTO reviewDTO, MultipartFile [] files, ServletContext servletContext) throws Exception;
	
	public int setDelete(ReviewDTO reviewDTO) throws Exception;
	
}
