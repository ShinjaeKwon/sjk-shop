package com.sjk.shop.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjk.shop.model.Item;
import com.sjk.shop.model.Order;
import com.sjk.shop.model.User;
import com.sjk.shop.repository.OrderRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderService {

	private final OrderRepository orderRepository;

	@Transactional
	public Order saveOrderByUser(User user) {
		Order order = new Order(user);
		orderRepository.save(order);
		return order;
	}

	@Transactional
	public List<Order> findOrdersByItem(Item item) {
		return orderRepository.findByItem(item);
	}

}
