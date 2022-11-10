package com.goodee.market.trade.myPage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.market.meetingboard.MeetingBoardDTO;
import com.goodee.market.member.MemberDTO;
import com.goodee.market.member.MemberService;
import com.goodee.market.trade.item.ItemDAO;
import com.goodee.market.trade.item.ItemDTO;
import com.goodee.market.trade.review.ReviewDTO;
import com.goodee.market.util.MyPagePager;
import com.goodee.market.util.Pager;

@Controller  //return 값은 내부 파일명
@RequestMapping(value = "/mypage/trade/*")
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping(value = "main")
	public ModelAndView getMypage (HttpSession session, MyPagePager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		//사용자 정보
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		memberDTO = myPageService.getMyPage(memberDTO);
		mv.addObject("member", memberDTO);
		
		ItemDTO itemDTO = new ItemDTO();
		//판매목록
		List<ItemDTO> ar = myPageService.getSellItemList(pager);
		mv.addObject("sellitemlist", ar);
		//구매목록
		ar = myPageService.getBuyItemList(itemDTO);
		mv.addObject("buyitemlist", ar);
		//후기목록
		ReviewDTO reviewDTO = new ReviewDTO();
		List<ReviewDTO> ar2 = myPageService.getReviewList(reviewDTO);
		mv.addObject("reviewlist", ar2);
		
		System.out.println("중고 마이페이지");
		mv.setViewName("mypage/trade/main");
		return mv;
	}
	
	
	//--------------------------------
	//@RequestMapping(value = "sellitemlist", method = RequestMethod.GET)
	// 두개 같은 의미 | ↑ 줄이면 ↓
	@GetMapping(value = "sellitemlist")
	public String getSellItemList (HttpSession session, MyPagePager pager) throws Exception{				
		ModelAndView mv = new ModelAndView();
		ItemDTO itemDTO = new ItemDTO();
		
		List<ItemDTO> ar = myPageService.getSellItemList(pager);
		mv.addObject("sellitemlist", ar);
		System.out.println("중고 마이페이지 - sell List 접속");
		return "mypage/trade/sellitemlist";
	}
	
	
	@GetMapping(value = "buyitemlist")
	public String getBuyItemList (HttpSession session, MyPagePager pager) throws Exception{				
		ModelAndView mv = new ModelAndView();
		ItemDTO itemDTO = new ItemDTO();

		List<ItemDTO> ar = myPageService.getBuyItemList(itemDTO);
		mv.addObject("buyitemlist", ar);
		System.out.println("중고 마이페이지 - buy List 접속");
		return "mypage/trade/buyitemlist";
	}
	
	
	@GetMapping(value = "reviewlist")
	public String getReviewList (HttpSession session, MyPagePager pager) throws Exception{				
		ModelAndView mv = new ModelAndView();
		ReviewDTO reviewDTO = new ReviewDTO();

		List<ReviewDTO> ar = myPageService.getReviewList(reviewDTO);
		mv.addObject("reviewlist", ar);
		System.out.println("중고 마이페이지 - review List 접속");
		return "mypage/trade/reviewlist";
	}

}
