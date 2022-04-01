package com.sjk.shop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class OrderItem {

	@Id
	@GeneratedValue
	private Long id;

	@ManyToOne
	private Order order;

	@ManyToOne
	private Item item;
	private int orderPrices;
	private int count;

}