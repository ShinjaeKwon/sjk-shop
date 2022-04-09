package com.sjk.shop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjk.shop.dto.OrderRequestDto;
import com.sjk.shop.dto.ItemSaveRequestDto;
import com.sjk.shop.model.Cart;
import com.sjk.shop.model.CartItem;
import com.sjk.shop.model.Item;
import com.sjk.shop.model.Order;
import com.sjk.shop.model.OrderItem;
import com.sjk.shop.model.OrderStatus;
import com.sjk.shop.model.User;
import com.sjk.shop.repository.CartItemRepository;
import com.sjk.shop.repository.CartRepository;
import com.sjk.shop.repository.CategoryRepository;
import com.sjk.shop.repository.ItemRepository;
import com.sjk.shop.repository.OrderItemRepository;
import com.sjk.shop.repository.OrderRepository;
import com.sjk.shop.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ItemService {

	private final ItemRepository itemRepository;
	private final CategoryRepository categoryRepository;
	private final UserRepository userRepository;
	private final CartItemRepository cartItemRepository;
	private final CartRepository cartRepository;
	private final OrderRepository orderRepository;
	private final OrderItemRepository orderItemRepository;

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
			.build();

		itemRepository.save(item);
	}

	@Transactional(readOnly = true)
	public Page<Item> itemList(Pageable pageable) {
		return itemRepository.findAll(pageable);
	}

	@Transactional(readOnly = true)
	public Item itemDetail(Long id) {
		return itemRepository.findById(id)
			.orElseThrow(() -> new IllegalArgumentException("아이템 상세보기 실패"));
	}

	@Transactional
	public void addCart(OrderRequestDto cartAddRequestDto) {
		User user = userRepository.findById(cartAddRequestDto.getUserId())
			.orElseThrow(() -> new IllegalArgumentException("장바구니 추가 실패"));
		Item item = itemRepository.findById(cartAddRequestDto.getItemId())
			.orElseThrow(() -> new IllegalArgumentException("장바구니 추가 실패"));
		Integer wishStockQuantity = cartAddRequestDto.getStockQuantity();

		Cart cart = cartRepository.findByUserId(user.getId());

		if (cart == null) {
			cart = Cart.createCart(user);
			cartRepository.save(cart);
		}

		CartItem cartItem = cartItemRepository.findByCartIdAndItemId(cart.getId(), item.getId());
		if (cartItem == null) {
			cartItem = CartItem.createCartItem(cart, item, wishStockQuantity);
		} else {
			cartItem.setCart(cartItem.getCart());
			cartItem.setItem(cartItem.getItem());
			cartItem.addStockQuantity(wishStockQuantity);
			cartItem.setStockQuantity(cartItem.getStockQuantity());
		}
		cartItemRepository.save(cartItem);

		cart.setCount(cart.getCount() + wishStockQuantity);

	}

	@Transactional
	public Cart cartDetail(Long userId) {
		Cart cart = cartRepository.findByUserId(userId); //Optional<Cart>
			if (cart == null) {
				cart = Cart.createCart(
					userRepository.findById(userId)
						.orElseThrow(() -> new IllegalArgumentException("장바구니 불러오기 실패"))
			);
		}
		return cart;
	}

	@Transactional
	public void deleteAllCart(Long userId) {
		Cart cart = cartRepository.findByUserId(userId);
		cartRepository.delete(cart);
	}

	@Transactional
	public void order(OrderRequestDto orderRequestDto) {
		Item item = itemRepository.findById(orderRequestDto.getItemId())
			.orElseThrow(() -> new IllegalArgumentException("주문 실패"));
		User user = userRepository.findById(orderRequestDto.getUserId()) /*Security 사용 */
			.orElseThrow(() -> new IllegalArgumentException("주문 실패"));
		Integer orderQuantity = orderRequestDto.getStockQuantity();

		if (item.getStockQuantity() - orderQuantity < 0) {
			new IllegalArgumentException("재고 수량 초과");
		}

		//서비스 분리
		Order order = new Order(); //생성자로 변경
		order.setUser(user);
		order.setStatus(OrderStatus.BEFORE);
		orderRepository.save(order); //save

		//서비스 분리
		OrderItem orderItem = OrderItem.builder() //생성자로 변경
			.item(item)
			.orderPrices(item.getPrice() * orderQuantity)
			.orderQuantity(orderQuantity)
			.order(order)
			.build();
		orderItemRepository.save(orderItem);

		item.setStockQuantity(item.getStockQuantity() - orderQuantity); //item 안에 구현
	}

	@Transactional
	public List<Order> orderList(Long id) {
		return orderRepository.findAllByUserId(id);
	}

	@Transactional
	public void orderConfirm(Long userId) {
		List<Order> allByUserId = orderRepository.findAllByUserId(userId);
		for (Order order : allByUserId) {
			order.setStatus(OrderStatus.CONFIRM);
		}
	}

	@Transactional
	public void deleteItemCart(Long userId, Long itemId) {
		Cart byUserId = cartRepository.findByUserId(userId);
		CartItem byCartIdAndItemId = cartItemRepository.findByCartIdAndItemId(byUserId.getId(), itemId);
		cartItemRepository.delete(byCartIdAndItemId);
		byUserId.setCount(byUserId.getCount() - byCartIdAndItemId.getStockQuantity());
	}

	public void orderAll(List<OrderRequestDto> orderRequestDto) {
		for (OrderRequestDto requestDto : orderRequestDto) {
			order(requestDto);
		}
	}
}
