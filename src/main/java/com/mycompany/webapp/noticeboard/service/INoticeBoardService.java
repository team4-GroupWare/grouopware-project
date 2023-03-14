package com.mycompany.webapp.noticeboard.service;

import java.util.List;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.noticeboard.model.NoticeBoard;
import com.mycompany.webapp.noticeboard.model.NoticeFile;

public interface INoticeBoardService {

	/**
	 * 공지사항 카테고리별 행 갯수
	 * @author : LEEJIHO
	 * @param boardCategoryId
	 * @return : 행 갯수
	 */
	public int selectTotalBoardPageByCategoryId(int boardCategoryId);

	/**
	 * 공지사항  카티고리 목록 
	 * @author : LEEJIHO
	 * @param pager
	 * @param boardCategoryId
	 * @return
	 */
	public List<NoticeBoard> selectBoardListByCategory(Pager pager, int boardCategoryId);

	/**
	 * 공지사항 작성(파일 없을 경우)
	 * @author : LEEJIHO
	 * @param noticeBoard
	 */
	public int insertBoard(NoticeBoard noticeBoard);

	/**
	 * 공지사항 작성(파일 있을 경우)
	 * @author : LEEJIHO
	 * @param noticeBoard
	 * @param file
	 */
	public int insertBoard(NoticeBoard noticeBoard, NoticeFile file);

	/**
	 * 공지사항 상세 조회
	 * @author : LEEJIHO
	 * @param noticeId
	 * @return
	 */
	public NoticeBoard selectBoard(int noticeId);

}
