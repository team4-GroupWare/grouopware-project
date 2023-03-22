package com.mycompany.webapp.noticeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.noticeboard.model.NoticeBoard;
import com.mycompany.webapp.noticeboard.model.NoticeFile;
import com.mycompany.webapp.noticeboard.repositiorty.NoticeBoardRepository;

@Service
public class NoticeBoardService implements INoticeBoardService {

	@Autowired
	private NoticeBoardRepository noticeBoardRepository;
	
	//공지사항 카테고리별 행 갯수
	@Override
	public int selectTotalBoardPageByCategoryId(int boardCateId) {
		return noticeBoardRepository.selectTotalBoardPageByCategoryId(boardCateId);
	}

	//공지사항 카테고리 별 목록
	@Override
	public List<NoticeBoard> selectBoardListByCategory(Pager pager, int boardCateId) {
		return noticeBoardRepository.selectBoardListByCategory(pager, boardCateId);
	}

	//공지사항 작성(파일 없을 경우)
	@Override
	public int insertBoard(NoticeBoard noticeBoard) {
		int row = 0;
		row = noticeBoardRepository.insertBoard(noticeBoard);
		return row;
	}

	//공지사항 작성(파일 있을 경우)
	@Transactional
	public int insertBoard(NoticeBoard noticeBoard, NoticeFile file) {
		int row = 0;
		noticeBoardRepository.insertBoard(noticeBoard);
		file.setNoticeId(noticeBoard.getNoticeId());
		if(file != null && file.getNoticeFileName() != null && !file.getNoticeFileName().equals("")) {
			row += noticeBoardRepository.insertFileData(file);
        }
		return row;
	}

	//공지사항 상세조회
	@Transactional
	public NoticeBoard selectBoard(int noticeId) {
		noticeBoardRepository.updateReadCount(noticeId);
		return noticeBoardRepository.selectBoard(noticeId);
	}

	//메인 페이지에 보여줄 최신 공지사항 5개 목록
	@Override
	public List<NoticeBoard> selectMainBoardListByCategory(int boardCateId) {
		return noticeBoardRepository.selectMainBoardListByCategory(boardCateId);
	}
	
}
