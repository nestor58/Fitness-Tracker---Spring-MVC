package com.gonzaleznestorweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {
	
	@RequestMapping(value="/greeting")
	public String sayHello(Model model) {
		
		model.addAttribute("greeting", "Hello world of Spring"
				+ "<h1>the title goes here</h1>"
				+ "<b>it looks great</b>");
		return "hello";
	}

}
