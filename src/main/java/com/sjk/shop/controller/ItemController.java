package com.sjk.shop.controller;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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
		return "shop/item/saveItem";
	}

	@GetMapping("/shop/{id}")
	public String detail(@PathVariable Long id, Model model) {
		model.addAttribute("item", itemService.itemDetail(id));
		return "shop/item/detail";
	}

	@GetMapping("/shop/cart")
	public String cartDetail(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		model.addAttribute("cart", itemService.cartDetail(auth));
		return "shop/cart/cart";
	}

	@GetMapping("/shop/orderList/{id}")
	public String orderList(@PathVariable Long id, Model model) {
		model.addAttribute("orders", itemService.orderList(id));
		return "shop/order/orderDetail";
	}

	@GetMapping("/shop/order")
	public String orders(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		model.addAttribute("orders", itemService.orderBeforeList(auth));
		return "shop/order/orders";
	}

}
