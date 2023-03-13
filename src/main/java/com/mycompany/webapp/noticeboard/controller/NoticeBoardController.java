package com.mycompany.webapp.noticeboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/board")
public class NoticeBoardController {
	
	@GetMapping("/list")
	public String getBoardList() {
		log.info("실행");
		return "board/boardlist";
	}
	
	@GetMapping("/detail")
	public String getBoardDetail() {
		log.info("실행");
		return "board/boarddetail";
	}
	
	@GetMapping("/write")
	public String getBoardWrite() {
		log.info("실행");
		return "board/write";
	}
}
