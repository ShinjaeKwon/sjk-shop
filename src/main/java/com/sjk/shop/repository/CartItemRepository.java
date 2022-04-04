package com.sjk.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sjk.shop.model.CartItem;

public interface CartItemRepository extends JpaRepository<CartItem, Long> {
}
