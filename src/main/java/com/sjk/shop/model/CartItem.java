package com.sjk.shop.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
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

	@ManyToOne(fetch = FetchType.EAGER)
	private Cart cart;

	private int stockQuantity;

	public CartItem(Item item, Cart cart, int stockQuantity) {
		this.item = item;
		this.cart = cart;
		this.stockQuantity = stockQuantity;
	}

	public static CartItem createCartItem(Cart cart, Item item, int stockQuantity) {
		CartItem cartItem = new CartItem(item, cart, stockQuantity);
		return cartItem;
	}

	public void addStockQuantity(int stockQuantity) {
		if (stockQuantity != this.stockQuantity) {
			this.stockQuantity += stockQuantity;
		}
	}

}
