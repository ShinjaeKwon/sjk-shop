package com.sjk.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sjk.shop.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
}
