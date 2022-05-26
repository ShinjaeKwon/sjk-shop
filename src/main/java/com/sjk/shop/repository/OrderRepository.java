package com.sjk.shop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.sjk.shop.model.Item;
import com.sjk.shop.model.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {
	List<Order> findAllByUserId(Long id);

	Page<Order> findAllByUserId(Pageable pageable, Long userId);

	@Query("SELECT o FROM Order o "
		+ "INNER JOIN  OrderItem  oi "
		+ "ON oi.order = o WHERE oi.item = :item")
	List<Order> findByItem(@Param("item") Item item);
}

