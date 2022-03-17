package com.sjk.shop.controller.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjk.shop.model.User;
import com.sjk.shop.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

	private final UserRepository userRepository;

	@Transactional
	public void save(User user) {
		try {
			userRepository.save(user);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("UserService.register" + e.getMessage());
		}
	}
}
