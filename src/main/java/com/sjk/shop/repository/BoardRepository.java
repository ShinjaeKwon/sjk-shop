package com.sjk.shop.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.sjk.shop.model.Board;

public interface BoardRepository extends JpaRepository<Board, Long> {

	Page<Board> findByTitleContaining(String keyword, Pageable pageable);
}
