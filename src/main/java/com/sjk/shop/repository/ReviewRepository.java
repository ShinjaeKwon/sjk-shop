package com.sjk.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sjk.shop.model.Review;

public interface ReviewRepository extends JpaRepository<Review, Long> {
}
