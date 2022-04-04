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

	@ManyToOne(fetch = FetchType.EAGER)
	private Cart cart;

	private int stockQuantity;

	public static CartItem createCartItem(Cart cart, Item item, int stockQuantity) {
		CartItem cartItem = new CartItem();
		cartItem.setCart(cart);
		cartItem.setItem(item);
		cartItem.setStockQuantity(stockQuantity);
		return cartItem;
	}

	public void addStockQuantity(int stockQuantity) {
		this.stockQuantity += stockQuantity;
	}

}
