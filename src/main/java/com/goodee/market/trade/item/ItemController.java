package com.goodee.market.trade.item;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.market.util.Pager;

@Controller
@RequestMapping("/trade/*")
//http://localhost/market/item/detail
public class ItemController{
	
	@Autowired
	private ItemService itemService;
	
	
	//메인페이지
	@GetMapping(value = "main")
	public ModelAndView getTradeMain(Pager pager)throws Exception {
		System.out.println("중고 메인~.~");
		ModelAndView mv = new ModelAndView();
		List<ItemDTO> ar = itemService.getTradeMain(pager);
		mv.addObject("list", ar);	
		mv.addObject("pager", pager);
		mv.setViewName("trade/main");
		return mv;
	}
	
	
	//카테고리 메인
	@GetMapping(value = "category")
	public ModelAndView getList(Pager pager)throws Exception {
		System.out.println("category");
		ModelAndView mv = new ModelAndView();
		List<ItemDTO> ar =itemService.getList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("trade/category");
		return mv;
	}
	
	
	//찜목록
	@GetMapping(value = "heartlist")
	public ModelAndView getHeartList(Pager pager)throws Exception {
		System.out.println("찜.");
		ModelAndView mv =new ModelAndView();
		List<ItemDTO> ar = itemService.getHeartList(pager);
		mv.addObject("list", ar);	
		mv.addObject("pager", pager);
		mv.setViewName("trade/heartlist");
		return mv;
	}

	
	//글상세
	@GetMapping(value="detail")
	public ModelAndView getDetail(Long num, ModelAndView mv) throws Exception {
		ItemDTO itemDTO = new ItemDTO();
		itemDTO.setItemNum(num);
		System.out.println("detail 실행");
		itemDTO = itemService.getDetail(itemDTO);
		mv.addObject("dto", itemDTO);
		mv.setViewName("trade/detail");
		
		return mv;		
	} 
	

	//글작성
	@GetMapping(value="add")
	public String setAdd(ItemDTO itemDTO) throws Exception {
		return "trade/add";
	}
	
	
	@PostMapping(value="add")
	public ModelAndView setAdd(ItemDTO itemDTO,MultipartFile[] files,HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView(); 
		int item= itemService.setAdd(itemDTO,files,session.getServletContext());
		mv.setViewName("redirect:./category");
		System.out.println("add success");
		return mv;
	}
	
	
	//글수정
	@GetMapping(value="update")
	public ModelAndView setUpdate(ItemDTO itemDTO, ModelAndView mv)throws Exception {
		
		mv.setViewName("trade/update");
		return mv;
	}
	
	
	@PostMapping(value="update")
	public String setUpdate(ItemDTO itemDTO)throws Exception {
		int result= itemService.setUpdate(itemDTO);
	return "redirect:./detail?itemNum="+itemDTO.getItemNum();
	}
	
	
	//글삭제
	public String setDelete(ItemDTO itemDTO)throws Exception {
	int result= itemService.setDelete(itemDTO);
	return "redirect:./category";
	}
	
}
