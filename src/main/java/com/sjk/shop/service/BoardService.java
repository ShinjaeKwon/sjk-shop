package com.sjk.shop.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjk.shop.model.Board;
import com.sjk.shop.model.User;
import com.sjk.shop.repository.BoardRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {

	private final BoardRepository boardRepository;

	@Transactional
	public void write(Board board, User user) {
		board.setCount(0);
		board.setUser(user);
		boardRepository.save(board);
	}

	@Transactional(readOnly = true)
	public Page<Board> postList(Pageable pageable) {
		return boardRepository.findAll(pageable);
	}

	@Transactional(readOnly = true)
	public Board boardDetail(Long id) {
		return boardRepository.findById(id)
			.orElseThrow(() -> new IllegalArgumentException("글 상세보기 실패"));
	}

	@Transactional
	public void deletePost(Long id) {
		boardRepository.deleteById(id);
	}

	@Transactional
	public void updatePost(Long id, Board requestBoard) {
		Board board = boardRepository.findById(id)
			.orElseThrow(() -> new IllegalArgumentException("글 수정 실패"));
		board.setTitle(requestBoard.getTitle());
		board.setContent(requestBoard.getContent());
	}
}