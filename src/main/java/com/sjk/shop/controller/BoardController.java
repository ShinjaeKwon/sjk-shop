package com.sjk.shop.controller;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.sjk.shop.service.BoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class BoardController {

	private final BoardService boardService;

	@GetMapping("/board/{id}")
	public String findById(@PathVariable Long id, Model model) {
		model.addAttribute("board", boardService.boardDetail(id));
		boardService.increaseHitCount(id);
		return "board/detail";
	}

	@GetMapping("/board")
	public String boardIndex(Model model, @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC)
		Pageable pageable) {
		model.addAttribute("boards", boardService.postList(pageable));
		return "board/boardIndex";
	}

	@GetMapping("/board/saveForm")
	public String saveForm() {
		return "board/saveForm";
	}

	@GetMapping("/board/{id}/updateForm")
	public String updateForm(@PathVariable Long id, Model model) {
		model.addAttribute("board", boardService.boardDetail(id));
		return "board/updateForm";
	}

	@GetMapping("/searchBoard")
	public String search(@RequestParam(value = "keyword") String keyword, Model model,
		@PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("boards", boardService.searchPosts(keyword, pageable));
		return "board/boardIndex";
	}

}