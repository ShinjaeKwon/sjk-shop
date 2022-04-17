package com.sjk.shop.controller;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.sjk.shop.config.auth.PrincipalDetail;
import com.sjk.shop.service.CategoryService;
import com.sjk.shop.service.UserService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class UserController {

	private final UserService userService;
	private final CategoryService categoryService;

	@GetMapping("/auth/joinForm")
	public String joinForm() {
		return "/user/joinForm";
	}

	@GetMapping("/auth/loginForm")
	public String loginForm() {
		return "/user/loginForm";
	}

	@GetMapping("/user/updateForm")
	public String updateForm(@AuthenticationPrincipal PrincipalDetail principal) {
		return "user/updateForm";
	}

	@GetMapping("/admin/management/user")
	public String adminIndex(Model model,
		@PageableDefault(size = 10, sort = "id",
			direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("users", userService.userList(pageable));
		model.addAttribute("categories", categoryService.categoryList());
		return "user/admin";
	}

	@GetMapping("/admin/management/user/detail/{id}")
	public String userDetail(@PathVariable Long id, Model model,
		@PageableDefault(size = 10, sort = "id",
			direction = Sort.Direction.ASC) Pageable pageable) {
		model.addAttribute("user", userService.userDetail(id));
		model.addAttribute("orders", userService.userOrders(pageable, id));
		return "user/detail";
	}

	@GetMapping("/orderDetail/{id}")
	public String userOrderDetail(@PathVariable Long id, Model model) {
		model.addAttribute("order", userService.userOrderDetail(id));
		return "user/orderDetail";
	}

}