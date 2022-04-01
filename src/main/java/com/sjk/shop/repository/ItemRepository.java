package com.sjk.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sjk.shop.model.Item;

public interface ItemRepository extends JpaRepository<Item, Long> {
}
