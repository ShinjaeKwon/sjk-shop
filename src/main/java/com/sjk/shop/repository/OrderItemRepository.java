package com.sjk.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sjk.shop.model.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
}
