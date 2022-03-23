package com.sjk.shop.controller.api;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.sjk.shop.config.auth.PrincipalDetail;
import com.sjk.shop.dto.ResponseDto;
import com.sjk.shop.service.BoardService;
import com.sjk.shop.model.Board;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class BoardApiController {

	private final BoardService boardService;

	@PostMapping("/api/board")
	public ResponseDto<Integer> save(@RequestBody Board board, @AuthenticationPrincipal PrincipalDetail principal) {
		System.out.println("ㅎㅇ");
		boardService.write(board, principal.getUser());
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/api/board/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable Long id) {
		boardService.deletePost(id);
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

}