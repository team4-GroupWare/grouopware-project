package com.mycompany.webapp.noticeboard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.noticeboard.model.NoticeBoard;
import com.mycompany.webapp.noticeboard.model.NoticeFile;
import com.mycompany.webapp.noticeboard.service.INoticeBoardService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/board")
public class NoticeBoardController {
	@Autowired
	INoticeBoardService noticeBoardService;
	
	//게시글 목록
	@GetMapping({"/list", "/list/{boardCateId}"})
	public String getBoardList(@PathVariable Integer boardCateId, @RequestParam(defaultValue="1") int pageNo, HttpSession session, Model model ) {
		log.info("실행");
		if(boardCateId == null) {
			boardCateId = 1;
		}
		
		int boardRow = noticeBoardService.selectTotalBoardPageByCategoryId(boardCateId);
		
		Pager pager = new Pager(10, 5, boardRow, pageNo);
	
		List<NoticeBoard> boardList = noticeBoardService.selectBoardListByCategory(pager, boardCateId);
		
		model.addAttribute("boardCateId", boardCateId);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager", pager);
		
		return "board/boardlist";
	}
	
	@GetMapping("/detail/{noticeId}")
	public String getBoardDetail(@PathVariable int noticeId, Model model) {
		log.info("실행");
		NoticeBoard noticeNoard = noticeBoardService.selectBoard(noticeId);
		
		model.addAttribute("noticeNoard", noticeNoard);
		model.addAttribute("boardCategoryId", noticeNoard.getBoardCateId());
		
		return "board/boarddetail";
	}
	
	@GetMapping("/write")
	public String getBoardWrite() {
		log.info("실행");
		return "board/write";
	}
	
	@PostMapping("/write")
	public String writeBoard(NoticeBoard noticeBoard) {
		log.info("=실행");
		
		try{
			noticeBoard.setNoticeContent(noticeBoard.getNoticeContent().replace("\r\n", "<br>"));
			MultipartFile mfile = noticeBoard.getFile();
			if(mfile!=null && !mfile.isEmpty()) {
				NoticeFile file = new NoticeFile();
				file.setNoticeFileName(mfile.getOriginalFilename());
				file.setNoticeFileSize(mfile.getSize());
				file.setNoticeFileContentType(mfile.getContentType());
				file.setNoticeFileData(mfile.getBytes());
				noticeBoardService.insertBoard(noticeBoard, file);
			} else {
				noticeBoardService.insertBoard(noticeBoard);
			}
		} catch(Exception e){
			e.printStackTrace();
			
		}
		return "redirect:/board/list/" + noticeBoard.getBoardCateId();
	}
}
