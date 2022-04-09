package com.sjk.shop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderRequestDto {

	private Integer stockQuantity; //수량
	private Long userId; //주문자 User user;
	private Long itemId; //아이템

}
