package com.sjk.shop.controller.api;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.sjk.shop.config.auth.PrincipalDetail;
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
}
