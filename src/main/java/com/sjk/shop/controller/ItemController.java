package com.sjk.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ItemController {

	@GetMapping("/shop")
	public String shopIndex(/*Model model, @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC)
		Pageable pageable*/) {
/*
		model.addAttribute("boards", boardService.postList(pageable));
*/
		return "shop/shopIndex";
	}
}
