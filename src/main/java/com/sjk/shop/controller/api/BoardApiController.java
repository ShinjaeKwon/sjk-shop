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
import com.sjk.shop.dto.ReplySaveRequestDto;
import com.sjk.shop.dto.ResponseDto;
import com.sjk.shop.model.Board;
import com.sjk.shop.service.BoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class BoardApiController {

	private final BoardService boardService;

	@PostMapping("/api/board")
	public ResponseDto<Integer> save(@RequestBody Board board, @AuthenticationPrincipal PrincipalDetail principal) {
		boardService.write(board, principal.getUser());
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/api/board/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable Long id) {
		boardService.deletePost(id);
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

	@PutMapping("/api/board/{id}")
	public ResponseDto<Integer> update(@PathVariable Long id, @RequestBody Board board) {
		boardService.updatePost(id, board);
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

	@PostMapping("/api/board/{boardId}/reply")
	public ResponseDto<Integer> replySave(@RequestBody ReplySaveRequestDto replySaveRequestDto) {
		boardService.writeReply(replySaveRequestDto);
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/api/board/{boardId}/reply/{replyId}")
	public ResponseDto<Integer> replyDelete(@PathVariable Long replyId) {
		boardService.deleteReply(replyId);
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

	@PostMapping("/api/board/{boardId}/reply/{replyId}")
	public ResponseDto<Integer> replyEdit(@RequestBody Map<String, String> map, @PathVariable Long boardId,
		@PathVariable Long replyId) {
		String content = map.get("content");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		boardService.editReply(replyId, boardId, content, auth);
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}

}