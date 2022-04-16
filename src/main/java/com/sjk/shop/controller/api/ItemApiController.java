package com.sjk.shop.controller.api;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.sjk.shop.config.auth.PrincipalDetail;
import com.sjk.shop.dto.ItemSaveRequestDto;
import com.sjk.shop.dto.OrderRequestDto;
import com.sjk.shop.dto.ResponseDto;
import com.sjk.shop.model.RoleType;
import com.sjk.shop.model.User;
import com.sjk.shop.service.CategoryService;
import com.sjk.shop.service.ItemService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		itemService.addCart(orderRequestDto, auth);
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/api/cart")
	public ResponseDto<Integer> deleteAllCart() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		itemService.deleteAllCart(auth);
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/api/cart/{itemId}")
	public ResponseDto<Integer> deleteItemCart(@PathVariable Long itemId) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		itemService.deleteItemCart(auth, itemId);
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/api/item/delete/{itemId}")
	public ResponseDto<Integer> deleteItem(@PathVariable Long itemId) {
		itemService.deleteItem(itemId);
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

	@PutMapping("/api/order")
	public ResponseDto<Integer> order(@RequestBody OrderRequestDto orderRequestDto) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		itemService.order(orderRequestDto, auth);
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

	@PostMapping("/api/order")
	public ResponseDto<Integer> orderConfirm(@RequestBody Map<String, String> map) {
		Long userId = Long.parseLong(map.get("userId"));
		itemService.orderConfirm(userId); //orderId 도 추가
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

}
