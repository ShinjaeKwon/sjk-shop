package com.sjk.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sjk.shop.model.Board;

public interface BoardRepository extends JpaRepository<Board, Long> {

}
