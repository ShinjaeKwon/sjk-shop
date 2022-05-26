package com.sjk.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sjk.shop.dto.OrderRequestDto;
import com.sjk.shop.model.Item;
import com.sjk.shop.model.User;
import com.sjk.shop.service.CategoryService;
import com.sjk.shop.service.ItemService;
import com.sjk.shop.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ItemController {

	private final CategoryService categoryService;
	private final ItemService itemService;
	private final UserService userService;

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

	@GetMapping("/mymarket")
	public String myMarket(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		model.addAttribute("items", itemService.sellerItemList(auth));

		return "shop/item/myMarket/itemList";
	}

	@GetMapping("/shop/{id}/orders")
	public String myMarket(Model model, @PathVariable Long id) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		model.addAttribute("orders", itemService.findUserPurchaseItem(auth, id));

		return "shop/item/myMarket/orderList";
	}

	@GetMapping("/shop/myorder")
	public String myOrders(Model model, @PageableDefault(size = 20, sort = "id", direction = Sort.Direction.DESC)
		Pageable pageable) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		model.addAttribute("orders", itemService.myOrderList(pageable, auth));
		return "shop/order/myorder";
	}

	@GetMapping("/searchItem")
	public String search(@RequestParam(value = "keyword") String keyword, Model model,
		@PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("items", itemService.searchItem(keyword, pageable));
		return "shop/shopIndex";
	}

	@PostMapping("/order/confirm")
	public String orderConfirm(HttpServletRequest request, Model model) {
		String itemId = request.getParameter("itemId");
		String stockQuantity = request.getParameter("stockQuantity");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (itemService.isCart(itemId, stockQuantity)) { //카트이면
			User user = userService.findUser(auth);
			model.addAttribute("cart", itemService.findCartByUser(user));
		} else {
			OrderRequestDto orderRequestDto =
				new OrderRequestDto(Integer.parseInt(stockQuantity), Long.parseLong(itemId));
			itemService.addCart(orderRequestDto, auth);

			User user = userService.findUser(auth);
			model.addAttribute("cart", itemService.findCartByUser(user));
		}
		return "shop/order/orderConfirm";
	}

	@GetMapping("/shop/orderDetail")
	public String orderDetail(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userService.findUser(auth);
		model.addAttribute("order", itemService.findOrderByUser(user));
		return "shop/order/detail";
	}

	@GetMapping("/userOrderList/{id}")
	public String userOrderList(@PathVariable Long id, Model model) {
		Item item = itemService.findItemById(id);
		model.addAttribute("orderItemList", itemService.findOrderItem(item));
		return "shop/order/userOrderList";
	}
}
