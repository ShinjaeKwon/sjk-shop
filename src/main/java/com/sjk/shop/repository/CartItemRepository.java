package com.sjk.shop.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sjk.shop.model.Cart;
import com.sjk.shop.model.CartItem;

public interface CartItemRepository extends JpaRepository<CartItem, Long> {
	Optional<CartItem> findByCartIdAndItemId(Long cartId, Long itemId);

	List<CartItem> findByCart(Cart cart);
}
