package com.sjk.shop.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.sjk.shop.dto.ItemSaveRequestDto;
import com.sjk.shop.model.Item;
import com.sjk.shop.repository.CategoryRepository;
import com.sjk.shop.repository.ItemRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ItemService {

	private final ItemRepository itemRepository;
	private final CategoryRepository categoryRepository;

	public void save(ItemSaveRequestDto requestItem) {
		String img = requestItem.getImg().replaceFirst("src", "style=\"width: 200px; height: 200px;\" src");
		Item item = Item.builder()
			.name(requestItem.getName())
			.img(img)
			.price(requestItem.getPrice())
			.stockQuantity(requestItem.getStockQuantity())
			.category(categoryRepository.findByName(requestItem.getCategory()))
			.build();

		itemRepository.save(item);
	}

	public Page<Item> itemList(Pageable pageable) {
		return itemRepository.findAll(pageable);
	}
}
