package com.sjk.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sjk.shop.model.Item;
import com.sjk.shop.model.User;

public interface ItemRepository extends JpaRepository<Item, Long> {

	List<Item> findAllByUser(User user);
}
