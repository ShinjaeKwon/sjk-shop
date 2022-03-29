package com.sjk.shop.model;

public enum RoleType {
	USER, SELLER, ADMIN;

	public static RoleType findRole(String roleTypeName) {
		if (roleTypeName.equalsIgnoreCase(String.valueOf(ADMIN))) {
			return ADMIN;
		} else if (roleTypeName.equalsIgnoreCase(String.valueOf(SELLER))) {
			return SELLER;
		}
		return USER;

	}
}
