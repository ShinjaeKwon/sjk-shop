package com.sjk.shop.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjk.shop.model.RoleType;
import com.sjk.shop.model.User;
import com.sjk.shop.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

	private final UserRepository userRepository;
	private final BCryptPasswordEncoder encoder;

	@Transactional
	public void save(User user) {
		user.setPassword(encoder.encode(user.getPassword()));
		user.setRole(RoleType.USER);
		userRepository.save(user);
	}

	@Transactional
	public void editUser(User requestUser) {
		User user = userRepository.findById(requestUser.getId())
			.orElseThrow(() -> new IllegalArgumentException("회원 수정에 실패하였습니다"));
		user.setPassword(encoder.encode(requestUser.getPassword()));
		user.setEmail(requestUser.getEmail());
		user.setAddress(requestUser.getAddress());

	}

}