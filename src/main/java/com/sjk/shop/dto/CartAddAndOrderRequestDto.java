package com.sjk.shop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CartAddAndOrderRequestDto {

	private Integer stockQuantity;
	private Long userId;
	private Long itemId;

}
