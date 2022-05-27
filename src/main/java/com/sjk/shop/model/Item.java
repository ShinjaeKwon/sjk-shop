package com.sjk.shop.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonAutoDetect;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@JsonAutoDetect
public class Item {

	public static final int MAX_STOCKQAUNTITY = 999_999;
	public static final int MIN_STOCKQUANTITY = 0;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false, length = 30)
	private String name;

	@Lob
	private String img;

	@Column(nullable = false)
	private int price;

	@Column(nullable = false)
	private int stockQuantity;

	@ManyToOne
	private Category category;

	@ManyToOne
	private User user;

	private int count;

	public void increaseCount() {
		this.count++;
	}

	public void decreaseStockQuantity(int stockQuantity) {
		if (this.stockQuantity - stockQuantity >= MIN_STOCKQUANTITY) {
			this.stockQuantity -= stockQuantity;
			return;
		}
		new IllegalArgumentException("MIN 값을 넘었습니다.");
	}

	public void addStockQuantity(int stockQuantity) {
		if (this.stockQuantity + stockQuantity < MAX_STOCKQAUNTITY) {
			this.stockQuantity += stockQuantity;
			return;
		}
		new IllegalArgumentException("MAX 값을 넘었습니다.");
	}
}