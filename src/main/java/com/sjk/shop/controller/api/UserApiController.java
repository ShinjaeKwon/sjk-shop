package com.sjk.shop.controller.api;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.sjk.shop.dto.ResponseDto;
import com.sjk.shop.service.UserService;
import com.sjk.shop.model.User;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class UserApiController {

	private final UserService userService;

	@PostMapping("/auth/joinProc")
	public ResponseDto<Integer> save(@RequestBody User user) {
		userService.save(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
}