package com.sjk.shop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ItemSaveRequestDto {

	private String name;
	private String img;
	private int price;
	private int stockQuantity;
	private String category;
	private Long userId;
	private String content;
}
