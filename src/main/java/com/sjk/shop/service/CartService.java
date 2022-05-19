package com.sjk.shop.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjk.shop.model.Cart;
import com.sjk.shop.model.User;
import com.sjk.shop.repository.CartRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class CartService {

	private final CartRepository cartRepository;

	@Transactional
	public Cart findCartByUser(User user) {
		Cart cart = cartRepository.findByUser(user)
			.orElse(Cart.createCart(user));
		cartRepository.save(cart);
		return cart;
	}
}
