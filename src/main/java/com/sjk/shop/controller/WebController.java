package com.sjk.shop.controller;

import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebController implements ErrorController {

	@RequestMapping("/error")
	public ResponseEntity<Object> exception(HttpServletResponse response, HttpServletRequest request) {
		if (Objects.equals(request.getContentType(), MediaType.APPLICATION_JSON_VALUE)) {
			Map<String, Object> body = Map.of("error", "Not Found", "timestamp", System.currentTimeMillis());
			return new ResponseEntity<>(body, HttpStatus.NOT_FOUND);
		}
		StringBuffer sb = new StringBuffer();
		sb
			.append("<h1>존재하지 않는 페이지입니다.<h2>")
			.append("<a href=\"/shop\">메인 페이지로 이동</a>");
		return new ResponseEntity<>(sb.toString(), HttpStatus.NOT_FOUND);
	}

}
