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
	
	/**
	 * 공지사항 목록
	 * @author : LEEJIHO
	 * @param boardCateId : 공지사항 카테고리 아이디 (1:공지사항, 2:상내경조사)
	 * @param pageNo : 현재 페이지
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping({"/list", "/list/{boardCateId}"})
	public String getBoardList(@PathVariable Integer boardCateId, @RequestParam(defaultValue="1") int pageNo, HttpSession session, Model model) {
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
	
	/**
	 * 공지사항 상세조회
	 * @author : LEEJIHO
	 * @param noticeId : 공지사항 게시글 아이디
	 * @param model
	 * @return
	 */
	@GetMapping("/detail/{noticeId}")
	public String getBoardDetail(@PathVariable int noticeId, Model model) {
		log.info("실행");
		NoticeBoard noticeNoard = noticeBoardService.selectBoard(noticeId);
		
		model.addAttribute("noticeNoard", noticeNoard);
		model.addAttribute("boardCategoryId", noticeNoard.getBoardCateId());
		
		return "board/boarddetail";
	}
	
	/**
	 * 공지사항 작성 폼 불러오기
	 * @author : LEEJIHO
	 * @return
	 */
	@GetMapping("/write")
	public String getBoardWrite() {
		log.info("실행");
		return "board/write";
	}
	
	/**
	 * 공지사항 작성
	 * @author : LEEJIHO
	 * @param noticeBoard : 작상한 내용을 담은 NoticeBoard DTO
	 * @return
	 */
	@PostMapping("/write")
	public String writeBoard(NoticeBoard noticeBoard) {
		log.info("=실행");
		
		try{
			noticeBoard.setNoticeContent(noticeBoard.getNoticeContent().replace("\r\n", "<br>"));
			MultipartFile mfile = noticeBoard.getFile();
			if(mfile!=null && !mfile.isEmpty()) { //파일이 존재할 경우
				NoticeFile file = new NoticeFile();
				file.setNoticeFileName(mfile.getOriginalFilename());
				file.setNoticeFileSize(mfile.getSize());
				file.setNoticeFileContentType(mfile.getContentType());
				file.setNoticeFileData(mfile.getBytes());
				
				noticeBoardService.insertBoard(noticeBoard, file);
			} else { //파일이 존재하지 않을 경우
				noticeBoardService.insertBoard(noticeBoard);
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/board/list/" + noticeBoard.getBoardCateId();
	}
	
	/**
	 * 메인 화면 공지사항 목록
	 * @author : LEEJIHO
	 * @param boardCateId : 공지사항 카테고리 아이디
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/mainboardlist/{boardCateId}")
	public String getMainBoardList(@PathVariable Integer boardCateId, HttpSession session, Model model) {
		log.info("실행");
		if(boardCateId == null) {
			boardCateId = 1;
		}
		
		//공지사항 목록
		List<NoticeBoard> boardList = noticeBoardService.selectMainBoardListByCategory(boardCateId);
		
		//사내경조사 목록
		//List<NoticeBoard> boardList = noticeBoardService.selectMainBoardListByCategory(boardCateId);
		
		model.addAttribute("boardCateId", boardCateId);
		model.addAttribute("boardList", boardList);
		
		/*if(boardCateId == 1) {
			return "board/main_boardlist";
		}*/
		
		return "board/main_boardlist";
	}
}
