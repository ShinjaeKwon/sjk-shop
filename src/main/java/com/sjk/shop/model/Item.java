package com.sjk.shop.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@EqualsAndHashCode(exclude = {"users"})
@JsonAutoDetect
public class Item {

	public static final int MAX_STOCK_QUANTITY = 999_999;
	public static final int MIN_STOCK_QUANTITY = 0;

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
	@JsonIgnoreProperties({"items"})
	private User user;

	@OneToMany(mappedBy = "item", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties({"items"})
	private List<Review> reviews;

	private int count;

	public void increaseCount() {
		this.count++;
	}

	public void decreaseStockQuantity(int stockQuantity) {
		if (this.stockQuantity - stockQuantity >= MIN_STOCK_QUANTITY) {
			this.stockQuantity -= stockQuantity;
			return;
		}
		new IllegalArgumentException("MIN 값을 넘었습니다.");
	}

	public void addStockQuantity(int stockQuantity) {
		if (this.stockQuantity + stockQuantity < MAX_STOCK_QUANTITY) {
			this.stockQuantity += stockQuantity;
			return;
		}
		new IllegalArgumentException("MAX 값을 넘었습니다.");
	}
}