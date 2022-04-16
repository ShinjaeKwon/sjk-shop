package com.sjk.shop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonAutoDetect;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonAutoDetect
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
	private int orderQuantity;

	public OrderItem(Order order, Item item, int orderPrices, int orderQuantity) {
		this.order = order;
		this.item = item;
		this.orderPrices = orderPrices;
		this.orderQuantity = orderQuantity;
	}
}