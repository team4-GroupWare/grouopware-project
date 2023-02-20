package com.mycompany.webapp.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/attendance")
public class AttendanceController {
	@GetMapping("/attendance")
	String attendance(){
		log.info("실행");
		return "main";
	}
	
}
