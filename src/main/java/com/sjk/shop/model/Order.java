package com.sjk.shop.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonAutoDetect;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name = "Orders")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonAutoDetect
@Entity
public class Order {

	@Id
	@GeneratedValue
	private Long id;

	@ManyToOne
	private User user;

	@OneToMany(mappedBy = "order", fetch = FetchType.EAGER)
	private List<OrderItem> orderItems = new ArrayList<>();

	@CreationTimestamp
	private Timestamp orderDate;

	@Enumerated(EnumType.STRING)
	private OrderStatus status = OrderStatus.BEFORE; //default value

	public Order(User user) {
		this.user = user;
	}

	public void changeToConfirm() {
		this.status = OrderStatus.CONFIRM;
	}

	public void changeToShipping() {
		this.status = OrderStatus.SHIPPING;
	}

	public void changeToCompleted() {
		this.status = OrderStatus.COMPLETED;
	}

	public void orderCancel() {
		this.status = OrderStatus.CANCEL;
	}

	public boolean isUser(User user) {
		return this.user == user;
	}
}
