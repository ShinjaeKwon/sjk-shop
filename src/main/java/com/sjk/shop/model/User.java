package com.sjk.shop.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false, length = 30)
	private String name;

	@Column(nullable = false, length = 30)
	private String userName;

	@Column(nullable = false, length = 100)
	private String password;

	@Column(nullable = false, length = 20)
	private String phone;

	@Column(nullable = false, length = 50)
	private String email;

	@Column(nullable = false, length = 100)
	private String address;

	@ColumnDefault("'user'")
	private String role;

	@OneToOne
	@JoinColumn(name = "CART_ID")
	private Cart cart;

	@CreationTimestamp
	private Timestamp createDate;

}
