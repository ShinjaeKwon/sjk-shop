package com.sjk.shop.controller;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sjk.shop.service.CategoryService;
import com.sjk.shop.service.ItemService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ItemController {

	private final CategoryService categoryService;
	private final ItemService itemService;

	@GetMapping("/shop")
	public String shopIndex(Model model, @PageableDefault(size = 20, sort = "id", direction = Sort.Direction.DESC)
		Pageable pageable) {
		model.addAttribute("items", itemService.itemList(pageable));

		return "shop/shopIndex";
	}

	@GetMapping("/shop/saveItem")
	public String saveForm(Model model) {
		model.addAttribute("categories", categoryService.categoryList());
		return "shop/saveItem";
	}
}
