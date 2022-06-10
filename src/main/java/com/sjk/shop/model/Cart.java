package com.sjk.shop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Cart {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@OneToOne
	@JoinColumn(name = "userId", unique = true)
	private User user;

	private int count;

	private Cart(User user) {
		this.user = user;
		this.count = 0;
	}

	public static Cart createCart(User user) {
		return new Cart(user);
	}

	public void addCartCount(Integer wishStockQuantity) {
		if (wishStockQuantity > 0) {
			count += wishStockQuantity;
		}
	}

	public void decreaseCartCount(int stockQuantity) {
		if (count - stockQuantity >= 0) {
			this.count -= stockQuantity;
		}
	}

}
