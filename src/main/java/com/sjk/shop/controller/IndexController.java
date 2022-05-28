package com.sjk.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sjk.shop.service.ItemService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class IndexController {

	private final ItemService itemService;

	@GetMapping({"/", ""})
	public String index(Model model) {
		model.addAttribute("items", itemService.bestItem());
		return "index";
	}
}
