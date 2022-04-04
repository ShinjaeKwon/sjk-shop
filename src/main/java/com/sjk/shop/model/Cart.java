package com.sjk.shop.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
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

	@OneToMany(mappedBy = "cart", fetch = FetchType.EAGER)
	private List<CartItem> cartItems = new ArrayList<>();

	@OneToOne
	@JoinColumn(name = "userId")
	private User user;

	private int count;

	public static Cart createCart(User user) {
		Cart cart = new Cart();
		cart.setCount(0);
		cart.setUser(user);
		return cart;
	}

}
