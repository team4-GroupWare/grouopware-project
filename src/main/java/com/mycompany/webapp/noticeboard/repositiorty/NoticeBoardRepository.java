package com.mycompany.webapp.noticeboard.repositiorty;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.noticeboard.model.NoticeBoard;
import com.mycompany.webapp.noticeboard.model.NoticeFile;

@Repository
public interface NoticeBoardRepository {
	/**
	 * 공지사항 작성 
	 * @author : LEEJIHO
	 * @param board
	 * @return
	 */
	public int insertBoard(NoticeBoard board);
	
	/**
	 * 공지사항 작성 시 파일 첨부
	 * @author : LEEJIHO
	 * @param file
	 * @return
	 */
	public int insertFileData(NoticeFile file);
	
	//공지사항 수정
	/*public int updateBoard(NoticeBoard board);
	public int updateFileData(NoticeFile file);*/
	
	//공지사항 삭제
	public int  deleteFileData(int boardId);
	public int deleteBoard(int boardId);
	
	/**
	 * 카테고리별 공지사항 갯수
	 * @author : LEEJIHO
	 * @param boardCateId
	 * @return
	 */
	public int selectTotalBoardPageByCategoryId(int boardCateId);
	
	/**
	 * 공지사항 목록
	 * @author : LEEJIHO
	 * @param pager
	 * @param boardCateId
	 * @return
	 */
	public List<NoticeBoard> selectBoardListByCategory(@Param("pager") Pager pager, @Param("boardCateId") int boardCateId);
	
	/**
	 * 메인 페이지 공지사항 최신 5개 목록
	 * @author : LEEJIHO
	 * @param boardCateId
	 * @return
	 */
	public List<NoticeBoard> selectMainBoardListByCategory(int boardCateId);
	
	/**
	 * 게시글 상세보기
	 * @author : LEEJIHO
	 * @param boardId
	 * @return
	 */
	public NoticeBoard selectBoard(int boardId);
	public NoticeFile selectNoticeFile(int fileId);
	
	/**
	 * 조회수 증가
	 * @author : LEEJIHO
	 * @param boardId
	 * @return
	 */
	public int updateReadCount(int boardId);
	

	//검색
	/*int selectTotalBoardPageByKeyword(String keyword);
	List<Board> searchListByContentKeyword(@Param("keyword") String keyword, @Param("start") int start, @Param("end") int end);
	Comments selectComment(int commentId);*/
	
	//공지사항
	//List<Board> selectBoardListByRole(@Param("start")int start,@Param("end") int end);
}
