package com.sjk.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sjk.shop.model.Item;
import com.sjk.shop.model.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {

	List<OrderItem> findByItem(Item item);

}

