package com.sjk.shop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjk.shop.dto.ItemSaveRequestDto;
import com.sjk.shop.dto.OrderRequestDto;
import com.sjk.shop.model.Cart;
import com.sjk.shop.model.CartItem;
import com.sjk.shop.model.Item;
import com.sjk.shop.model.Order;
import com.sjk.shop.model.User;
import com.sjk.shop.repository.CartItemRepository;
import com.sjk.shop.repository.CartRepository;
import com.sjk.shop.repository.CategoryRepository;
import com.sjk.shop.repository.ItemRepository;
import com.sjk.shop.repository.OrderRepository;
import com.sjk.shop.repository.UserRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class ItemService {

	private final ItemRepository itemRepository;
	private final CategoryRepository categoryRepository;
	private final UserRepository userRepository;
	private final CartItemRepository cartItemRepository;
	private final CartRepository cartRepository;
	private final OrderRepository orderRepository;

	private final OrderService orderService;
	private final OrderItemService orderItemService;
	private final CartService cartService;
	private final CartItemService cartItemService;

	@Transactional
	public void save(ItemSaveRequestDto requestItem) {
		String img = requestItem.getImg().replaceFirst("src", "style=\"width: 200px; height: 200px;\" src");
		User user = userRepository.findById(requestItem.getUserId())
			.orElseThrow(() -> new IllegalArgumentException("존재 하지 않는 유저 입니다."));
		Item item = Item.builder()
			.name(requestItem.getName())
			.img(img)
			.price(requestItem.getPrice())
			.stockQuantity(requestItem.getStockQuantity())
			.category(categoryRepository.findByName(requestItem.getCategory()))
			.user(user)
			.count(0)
			.build();

		itemRepository.save(item);
	}

	@Transactional(readOnly = true)
	public Page<Item> itemList(Pageable pageable) {
		return itemRepository.findAll(pageable);
	}

	@Transactional
	public Item itemDetail(Long id) {
		Item item = itemRepository.findById(id)
			.orElseThrow(() -> new IllegalArgumentException("아이템 상세보기 실패"));
		item.increaseCount();
		return item;
	}

	@Transactional
	public void addCart(OrderRequestDto cartAddRequestDto, Authentication auth) {
		User user = userRepository.findByUsername(auth.getName())
			.orElseThrow(() -> new IllegalArgumentException("사용자 정보가 정확하지 않습니다."));
		Item item = itemRepository.findById(cartAddRequestDto.getItemId())
			.orElseThrow(() -> new IllegalArgumentException("아이템 정보가 정확하지 않습니다."));
		Integer wishStockQuantity = cartAddRequestDto.getStockQuantity();

		Cart cart = cartService.findCartByUser(user);
		cartItemService.findCartItemByCartAndItem(cart, item, wishStockQuantity);
	}

	@Transactional
	public Cart cartDetail(Authentication auth) {
		User user = userRepository.findByUsername(auth.getName())
			.orElseThrow(() -> new IllegalArgumentException("로그인한 사용자의 정보가 정확하지 않습니다."));

		return cartService.findCartByUser(user);
	}

	@Transactional
	public void deleteAllCart(Authentication auth) {
		User user = userRepository.findByUsername(auth.getName())
			.orElseThrow(() -> new IllegalArgumentException("로그인한 사용자의 정보가 정확하지 않습니다."));
		Cart cart = cartRepository.findByUser(user)
			.orElseThrow(() -> new IllegalArgumentException("장바구니 불러오기 실패"));
		cartRepository.delete(cart);
	}

	@Transactional
	public void order(OrderRequestDto orderRequestDto, Authentication auth) {
		User user = userRepository.findByUsername(auth.getName())
			.orElseThrow(() -> new IllegalArgumentException("로그인한 사용자 정보가 정확하지 않습니다."));
		Item item = itemRepository.findById(orderRequestDto.getItemId())
			.orElseThrow(() -> new IllegalArgumentException("주문 실패"));

		Integer orderQuantity = orderRequestDto.getStockQuantity();
		if (item.getStockQuantity() - orderQuantity < 0) {
			new IllegalArgumentException("재고 수량 초과");
		}

		Order order = orderService.saveOrderByUser(user);
		int orderPrice = item.getPrice() * orderQuantity;
		orderItemService.saveOrderItem(order, item, orderPrice, orderQuantity);
		order.addPriceInOrder(orderPrice);
		item.decreaseStockQuantity(orderQuantity);
	}

	@Transactional
	public void cartOrder(Long cartId, String requests, Authentication auth) {
		User user = userRepository.findByUsername(auth.getName())
			.orElseThrow(() -> new IllegalArgumentException("로그인한 사용자 정보가 정확하지 않습니다."));
		Cart cart = cartRepository.findById(cartId)
			.orElseThrow(() -> new IllegalArgumentException("장바구니 정보가 잘못되었습니다."));

		List<CartItem> cartItems = cart.getCartItems();
		Order order = orderService.saveOrderByUser(user);
		order.addRequests(requests);
		for (CartItem cartItem : cartItems) {
			int orderQuantity = cartItem.getStockQuantity(); //개별 주문 수량
			Item item = cartItem.getItem();//개별 아이템
			if (item.getStockQuantity() - orderQuantity < 0) {
				new IllegalArgumentException("재고 수량 초과");
			}
			int orderPrice = item.getPrice() * orderQuantity;
			orderItemService.saveOrderItem(order, item, orderPrice, orderQuantity);
			order.addPriceInOrder(orderPrice);
			item.decreaseStockQuantity(orderQuantity);
		}
		cartRepository.deleteById(cartId);
	}

	@Transactional
	public void deleteItemCart(Authentication auth, Long itemId) {
		User user = userRepository.findByUsername(auth.getName())
			.orElseThrow(() -> new IllegalArgumentException("로그인한 사용자 정보가 정확하지 않습니다."));
		Cart userCart = cartRepository.findByUser(user)
			.orElseThrow(() -> new IllegalArgumentException("로그인 정보가 정확하지 않습니다."));
		CartItem userCartItem = cartItemRepository.findByCartIdAndItemId(userCart.getId(), itemId)
			.orElseThrow(() -> new IllegalArgumentException("아이템 불러오기 실패"));
		userCart.decreaseCartCount(userCartItem.getStockQuantity());
		cartItemRepository.delete(userCartItem);
	}

	@Transactional
	public Page<Order> userOrderList(Pageable pageable, Long userId) {
		return orderRepository.findAllByUserId(pageable, userId);
	}

	@Transactional
	public Order findOrder(Long orderId) {
		return orderRepository.findById(orderId)
			.orElseThrow(() -> new IllegalArgumentException("상품 조회 실패"));
	}

	@Transactional
	public void deleteItem(Long itemId) {
		Item item = itemRepository.findById(itemId)
			.orElseThrow(() -> new IllegalArgumentException("상품 삭제 실패"));
		itemRepository.delete(item);
	}

	@Transactional
	public Page<Order> myOrderList(Pageable pageable, Authentication auth) {
		User user = userRepository.findByUsername(auth.getName())
			.orElseThrow(() -> new IllegalArgumentException("로그인한 사용자 정보가 정확하지 않습니다."));
		return userOrderList(pageable, user.getId());
	}

	@Transactional(readOnly = true)
	public Page<Item> searchItem(String keyword, Pageable pageable) {
		return itemRepository.findByNameContaining(keyword, pageable);
	}

	@Transactional
	public Page<Order> allOrderList(Pageable pageable) {
		return orderRepository.findAll(pageable);
	}

	@Transactional
	public void changeToShipping(Long orderId) {
		Order order = orderRepository.findById(orderId)
			.orElseThrow(() -> new IllegalArgumentException("OrderId가 정확하지 않습니다."));
		order.changeToShipping();
	}

	@Transactional
	public void changeToCompleted(Long orderId) {
		Order order = orderRepository.findById(orderId)
			.orElseThrow(() -> new IllegalArgumentException("OrderId가 정확하지 않습니다."));
		order.changeToCompleted();
	}

	@Transactional
	public void changeToCancel(Long orderId, Authentication auth) {
		User user = userRepository.findByUsername(auth.getName())
			.orElseThrow(() -> new IllegalArgumentException("로그인한 사용자 정보가 정확하지 않습니다."));
		Order order = orderRepository.findById(orderId)
			.orElseThrow(() -> new IllegalArgumentException("주문이 정확하지 않습니다."));
		if (order.isUser(user)) {
			new IllegalArgumentException("로그인 사용자와 주문자가 일치하지 않습니다.");
		}
		if (order.isCancel()) {
			new IllegalArgumentException("현재 주문을 취소할 수 없는 상태입니다.");
		}
		order.orderCancel();
	}

	@Transactional
	public Cart findCartByUser(User user) {
		return cartRepository.findByUser(user)
			.orElseThrow(() -> new IllegalArgumentException("장바구니 정보가 정확하지 않습니다."));
	}

	public boolean isCart(String itemId, String stockQuantity) {
		if (itemId == null || stockQuantity == null) {
			return true;
		}
		return false;
	}

	@Transactional
	public Order findOrderByUser(User user) {
		List<Order> orderList = orderRepository.findAllByUserId(user.getId());
		return orderList.get(orderList.size() - 1);
	}

	@Transactional
	public void changeToConfirm(long orderId) {
		Order order = orderRepository.findById(orderId)
			.orElseThrow(() -> new IllegalArgumentException("OrderId가 정확하지 않습니다."));
		order.changeToConfirm();
	}
}