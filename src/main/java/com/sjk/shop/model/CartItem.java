package com.sjk.shop.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class CartItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(fetch = FetchType.EAGER)
	private Item item;

	@ManyToOne(fetch = FetchType.LAZY)
	private Cart cart;

	private int stockQuantity = 0;

	public CartItem(Item item, Cart cart) {
		this.item = item;
		this.cart = cart;
	}

	public static CartItem createCartItem(Cart cart, Item item) {
		CartItem cartItem = new CartItem(item, cart);
		return cartItem;
	}

	public void addStockQuantity(int stockQuantity) {
		this.stockQuantity += stockQuantity;
	}

}
