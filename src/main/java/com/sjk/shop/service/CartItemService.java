package com.sjk.shop.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjk.shop.model.Cart;
import com.sjk.shop.model.CartItem;
import com.sjk.shop.model.Item;
import com.sjk.shop.repository.CartItemRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class CartItemService {

	private final CartItemRepository cartItemRepository;

	@Transactional
	public void findCartItemByCartAndItem(Cart cart, Item item, Integer wishStockQuantity) {
		CartItem cartItem = cartItemRepository.findByCartIdAndItemId(cart.getId(), item.getId())
			.orElse(CartItem.createCartItem(cart, item));
		cartItem.addStockQuantity(wishStockQuantity);
		cart.addCartCount(wishStockQuantity);
		cartItemRepository.save(cartItem);
	}
}
