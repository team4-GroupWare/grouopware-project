package com.mycompany.webapp.noticeboard.service;

import java.util.List;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.noticeboard.model.NoticeBoard;
import com.mycompany.webapp.noticeboard.model.NoticeFile;

public interface INoticeBoardService {

	/**
	 * 공지사항 카테고리별 행 갯수
	 * @author : LEEJIHO
	 * @param boardCategoryId : 공지사항 카테고리 번호
	 * @return : 행 갯수
	 */
	public int selectTotalBoardPageByCategoryId(int boardCateId);

	/**
	 * 공지사항  카티고리 목록 
	 * @author : LEEJIHO
	 * @param pager : 페이저
	 * @param boardCategoryId : 공지사항 카테고리 번호
	 * @return
	 */
	public List<NoticeBoard> selectBoardListByCategory(Pager pager, int boardCateId);

	/**
	 * 공지사항 작성(파일 없을 경우)
	 * @author : LEEJIHO
	 * @param noticeBoard : 작성한 공지사항 객체
	 */
	public int insertBoard(NoticeBoard noticeBoard);

	/**
	 * 공지사항 작성(파일 있을 경우)
	 * @author : LEEJIHO
	 * @param noticeBoard : 작성한 공지사항 객체
	 * @param file : 첨부한 공지사항 파일 
	 */
	public int insertBoard(NoticeBoard noticeBoard, NoticeFile file);

	/**
	 * 공지사항 상세 조회
	 * @author : LEEJIHO
	 * @param noticeId : 해당 공지사항 게시글 번호
	 * @return
	 */
	public NoticeBoard selectBoard(int noticeId);

	/**
	 * 메인 페이지에 보여줄 최신 공지사항 5개 목록
	 * @author : LEEJIHO
	 * @param boardCateId : 공지사항 카테고리 번호
	 * @return
	 */
	public List<NoticeBoard> selectMainBoardListByCategory(int boardCateId);

}
