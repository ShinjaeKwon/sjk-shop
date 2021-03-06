package com.sjk.shop.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjk.shop.model.Order;
import com.sjk.shop.model.RoleType;
import com.sjk.shop.model.User;
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
		user.setAccount(requestUser.getAccount());
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
	public Page<Order> userOrders(Pageable pageable, Long userId) {
		Page<Order> orders = itemService.userOrderList(pageable, userId);
		return orders;
	}

	@Transactional
	public Order userOrderDetail(Long orderId) {
		return itemService.findOrder(orderId);
	}

	@Transactional
	public void isAdminAndSeller(Authentication auth) {
		User user = userRepository.findByUsername(auth.getName())
			.orElseThrow(() -> new IllegalArgumentException("로그인한 사용자 정보가 정확하지 않습니다."));
		if (user.getRole() == RoleType.USER) {
			new IllegalArgumentException("사용자 권한이 정확하지 않습니다.");
		}
	}

	@Transactional
	public User findUser(Authentication auth) {
		return userRepository.findByUsername(auth.getName())
			.orElseThrow(() -> new IllegalArgumentException("로그인한 사용자 정보가 정확하지 않습니다."));
	}

	// @Transactional
	// public List<Order> findSellerItemOrderList(Long userId) {
	// 	User user = userRepository.findById(userId)
	// 		.orElseThrow(() -> new IllegalArgumentException("사용자 정보가 정확하지 않습니다.")); // 등록한 아이템을 꺼내서
	// 	if (!user.isSeller()) {
	// 		new IllegalArgumentException("회원의 권한이 SELLER가 아닙니다.");
	// 	}
	// 	return itemService.findItemBuyUser(user);
	// }
}