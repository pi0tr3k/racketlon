package com.firstexample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;;

@Controller
public class HomeController {
	// jak przyjdzie ��danie z rootem, to widokiem bedzie home (pozniej String
	// home zostanie uzyty przez View Resolver do znalezienia odpowiedniego widoku
	// (przedrostek, przyrostek, �cie�ka)
	@RequestMapping("/")
	public String home() {
		return "home";
	}
}
