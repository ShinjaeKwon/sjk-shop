package com.sjk.shop.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjk.shop.model.Category;
import com.sjk.shop.repository.CategoryRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CategoryService {

	private final CategoryRepository categoryRepository;

	@Transactional
	public List<Category> categoryList() {
		return categoryRepository.findAll();
	}

	@Transactional
	public void addCategory(String categoryName) {
		Category category = new Category();
		category.setName(categoryName);
		categoryRepository.save(category);
	}
}
