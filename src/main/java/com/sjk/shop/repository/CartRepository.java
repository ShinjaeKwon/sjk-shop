package com.sjk.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sjk.shop.model.Cart;

public interface CartRepository extends JpaRepository<Cart, Long> {
}
