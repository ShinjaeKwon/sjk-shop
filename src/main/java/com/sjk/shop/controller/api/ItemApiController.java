package com.sjk.shop.controller.api;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.sjk.shop.config.auth.PrincipalDetail;
import com.sjk.shop.dto.OrderRequestDto;
import com.sjk.shop.dto.ItemSaveRequestDto;
import com.sjk.shop.dto.ResponseDto;
import com.sjk.shop.model.RoleType;
import com.sjk.shop.model.User;
import com.sjk.shop.service.CategoryService;
import com.sjk.shop.service.ItemService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ItemApiController {

	private final ItemService itemService;
	private final CategoryService categoryService;

	@PostMapping("/api/item/save")
	public ResponseDto<Integer> save(@RequestBody ItemSaveRequestDto itemSaveRequestDto,
		@AuthenticationPrincipal PrincipalDetail principal) {
		User user = principal.getUser();
		if (user.getRole() == RoleType.USER) {
			new IllegalArgumentException("판매자가 아닙니다.");
		}
		itemService.save(itemSaveRequestDto);
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

	@PostMapping("/api/category/save")
	public ResponseDto<Integer> categorySave(@RequestBody Map<String, String> map,
		@AuthenticationPrincipal PrincipalDetail principal) {
		User user = principal.getUser();
		if (user.getRole() == RoleType.USER) {
			new IllegalArgumentException("판매자가 아닙니다.");
		}
		categoryService.addCategory(map.get("category"));
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

	@PostMapping("/api/item/wish")
	public ResponseDto<Integer> addCart(@RequestBody OrderRequestDto orderRequestDto) {
		itemService.addCart(orderRequestDto);
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/api/cart/{userId}")
	public ResponseDto<Integer> deleteAllCart(@PathVariable Long userId) {
		itemService.deleteAllCart(userId);
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/api/cart/{userId}/{itemId}")
	public ResponseDto<Integer> deleteItemCart(@PathVariable Long userId, @PathVariable Long itemId) {
		itemService.deleteItemCart(userId, itemId);
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

	@PostMapping("/api/order") /* PutMapping */
	public ResponseDto<Integer> order(@RequestBody OrderRequestDto orderRequestDto) {
		itemService.order(orderRequestDto);
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}
/*
	@PostMapping("/api/order") */
/* PutMapping *//*

	public ResponseDto<Integer> orderAll(@RequestBody List<OrderRequestDto> orderRequestDto) {
		itemService.orderAll(orderRequestDto);
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}
*/


	@PutMapping("/api/order")
	public ResponseDto<Integer> orderConfirm(@RequestBody Map<String, String> map) {
		Long userId = Long.parseLong(map.get("userId"));
		itemService.orderConfirm(userId); //orderId 도 추가
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

}
