package com.sean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MessageController {
	
	@Value("${message}")
	private String message;

	@GetMapping("/messages")
	public String getMessage() {
		return message;
	}

}