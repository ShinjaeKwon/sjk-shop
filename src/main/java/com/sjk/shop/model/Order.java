package com.sjk.shop.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "Orders")
public class Order {

	@Id
	@GeneratedValue
	private Long id;

	@ManyToOne
	private User user;

	@OneToMany(mappedBy = "order")
	private List<OrderItem> orderItems = new ArrayList<>();

	@CreationTimestamp
	private Timestamp orderDate;

	@Enumerated(EnumType.STRING)
	private OrderStatus status;

}
