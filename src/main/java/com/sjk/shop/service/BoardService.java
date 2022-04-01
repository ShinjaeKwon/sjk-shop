package com.sjk.shop.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjk.shop.dto.ReplySaveRequestDto;
import com.sjk.shop.model.Board;
import com.sjk.shop.model.Reply;
import com.sjk.shop.model.User;
import com.sjk.shop.repository.BoardRepository;
import com.sjk.shop.repository.ReplyRepository;
import com.sjk.shop.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {

	private final BoardRepository boardRepository;
	private final ReplyRepository replyRepository;
	private final UserRepository userRepository;

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

	@Transactional
	public void writeReply(ReplySaveRequestDto replySaveRequestDto) {

		User user = userRepository.findById(replySaveRequestDto.getUserId())
			.orElseThrow(() -> new IllegalArgumentException("댓글 쓰기 실패"));
		Board board = boardRepository.findById(replySaveRequestDto.getBoardId())
			.orElseThrow(() -> new IllegalArgumentException("댓글 쓰기 실패"));
		Reply reply = Reply.builder()
			.user(user)
			.board(board)
			.content(replySaveRequestDto.getContent())
			.build();

		replyRepository.save(reply);
	}

	@Transactional
	public void deleteReply(Long replyId) {
		replyRepository.deleteById(replyId);
	}

	@Transactional
	public void increaseHitCount(Long boardId) {
		Board board = boardRepository.findById(boardId)
			.orElseThrow(() -> new IllegalArgumentException("조회수 증가 실패"));
		int count = board.getCount();
		board.setCount(++count);
		boardRepository.save(board);
	}

	@Transactional(readOnly = true)
	public Page<Board> searchPosts(String keyword, Pageable pageable) {
		return boardRepository.findByTitleContaining(keyword, pageable);
	}

}