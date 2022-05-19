package com.sjk.shop.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjk.shop.model.Item;
import com.sjk.shop.model.Order;
import com.sjk.shop.model.OrderItem;
import com.sjk.shop.repository.OrderItemRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderItemService {

	private final OrderItemRepository orderItemRepository;

	@Transactional
	public void saveOrderItem(Order order, Item item, int orderPrice, Integer orderQuantity) {
		OrderItem orderItem = new OrderItem(order, item, orderPrice, orderQuantity);
		orderItemRepository.save(orderItem);
		order.addPriceInOrder();
	}

}
