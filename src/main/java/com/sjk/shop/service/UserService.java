package com.sjk.shop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjk.shop.model.Order;
import com.sjk.shop.model.RoleType;
import com.sjk.shop.model.User;
import com.sjk.shop.repository.OrderRepository;
import com.sjk.shop.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

	private final UserRepository userRepository;
	private final ItemService itemService;
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

	@Transactional(readOnly = true)
	public Page<User> userList(Pageable pageable) {
		return userRepository.findAll(pageable);
	}

	@Transactional
	public void setSeller(Long requestUserId, String userRole) {
		User user = userRepository.findById(requestUserId)
			.orElseThrow(() -> new IllegalArgumentException("Role 변경 실패"));
		RoleType role = RoleType.findRole(userRole);
		user.setRole(role);
	}

	@Transactional(readOnly = true)
	public User userDetail(Long userId) {
		return userRepository.findById(userId)
			.orElseThrow(() -> new IllegalArgumentException("회원 상세 보기 실패"));
	}

	@Transactional
	public void deleteUser(Long userId) {
		User user = userRepository.findById(userId)
			.orElseThrow(() -> new IllegalArgumentException("ADMIN은 탈퇴가 불가능합니다."));
		if (user.getRole() == RoleType.ADMIN) {
			return;
		}
		userRepository.deleteById(userId);
	}

	@Transactional
	public List<Order> userOrders(Long userId) {
		List<Order> orders = itemService.userOrderList(userId);
		return orders;
	}

	@Transactional
	public Order userOrderDetail(Long orderId) {
		return itemService.findOrder(orderId);
	}
}