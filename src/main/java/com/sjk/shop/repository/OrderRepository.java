package com.sjk.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sjk.shop.model.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {
	List<Order> findAllByUserId(Long id);
}
