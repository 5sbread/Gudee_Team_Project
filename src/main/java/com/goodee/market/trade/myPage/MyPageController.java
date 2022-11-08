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

import com.goodee.market.member.MemberDTO;
import com.goodee.market.member.MemberService;
import com.goodee.market.trade.item.ItemDAO;
import com.goodee.market.trade.item.ItemDTO;
import com.goodee.market.trade.review.ReviewDTO;

@Controller  //return 값은 내부 파일명
@RequestMapping(value = "/mypage/trade/*")
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping(value = "main")
	public ModelAndView getMypage (HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		memberDTO = memberService.getMemberDetail(memberDTO);
		mv.addObject("myPage", memberDTO);
		
		List<ItemDTO> ar = myPageService.getSellItemList();
		mv.addObject("sellitemlist", ar);
		
		ar = myPageService.getBuyItemList();
		mv.addObject("buyitemlist", ar);
		
		List<ReviewDTO> ar2 = myPageService.getReviewList();
		mv.addObject("reviewlist", ar2);
		
		System.out.println("중고 마이페이지");
		mv.setViewName("mypage/trade/main");
		return mv;
	}
	
	
	//--------------------------------
	//@RequestMapping(value = "sellitemlist", method = RequestMethod.GET)
	// 두개 같은 의미 | ↑ 줄이면 ↓
	@GetMapping(value = "sellitemlist")
	public String getSellItemList (Model model) throws Exception{				
		List<ItemDTO> ar = myPageService.getSellItemList();
		model.addAttribute("sellitemlist", ar);
		System.out.println("중고 마이페이지 - sell List 접속");
		return "mypage/trade/sellitemlist";
	}
	
	
	@GetMapping(value = "buyitemlist")
	public String getBuyItemList (Model model) throws Exception{				
		List<ItemDTO> ar = myPageService.getBuyItemList();
		model.addAttribute("buyitemlist", ar);
		System.out.println("중고 마이페이지 - buy List 접속");
		return "mypage/trade/buyitemlist";
	}
	
//	
//	@GetMapping(value = "buyitemlist")
//	public ModelAndView getBuyItemList () throws Exception{
//		ModelAndView mv = new ModelAndView();
//		System.out.println("중고 마이페이지 - buy List 접속");
//		
//		mv.addObject("getBuyItemList", myPageService.getBuyItemList());
//		mv.setViewName("mypage/buyitemlist");
//		return mv;
//	}
	
	
	@GetMapping(value = "reviewlist")
	public String getReviewList (Model model) throws Exception{				
		List<ReviewDTO> ar = myPageService.getReviewList();
		model.addAttribute("reviewlist", ar);
		System.out.println("중고 마이페이지 - review List 접속");
		return "mypage/trade/reviewlist";
	}

}
