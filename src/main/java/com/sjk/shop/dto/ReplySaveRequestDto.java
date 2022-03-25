package com.sjk.shop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReplySaveRequestDto {

	private Long userId;
	private Long boardId;
	private String content;
}
