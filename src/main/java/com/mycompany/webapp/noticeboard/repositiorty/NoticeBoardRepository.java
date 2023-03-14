package com.mycompany.webapp.noticeboard.repositiorty;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.noticeboard.model.NoticeBoard;
import com.mycompany.webapp.noticeboard.model.NoticeFile;

@Repository
public interface NoticeBoardRepository {
	int selectMaxArticleNo();
	int selectMaxFileId();
	
	//공지사항 작성
	public int insertBoard(NoticeBoard board);
	public int insertFileData(NoticeFile file);
	
	//공지사항 수정
	public int updateBoard(NoticeBoard board);
	public int updateFileData(NoticeFile file);
	
	//공지사항 삭제
	public int  deleteFileData(int boardId);
	public int deleteBoard(int boardId);
	
	//공지사항 목록
	public int selectTotalBoardPageByCategoryId(int boardCateId);
	public List<NoticeBoard> selectBoardListByCategory(@Param("pager") Pager pager, @Param("boardCateId") int boardCateId);
	
	//게시글 상세보기
	NoticeBoard selectBoard(int boardId);
	NoticeFile selectNoticeFile(int fileId);
	
	//조회수 증가
	void updateReadCount(int boardId);

	//댓글 작성, 수정, 삭제
//	void insertComment(Comments comment);
//	void updateComment(Comments comment);
//	void deleteComment(int commentId);
	
    //댓글 조회
//    int selectTotalCommentsPageByCommentId(int boardId);
//    List<Comments> selectCommentsListByCommentId(@Param("boardId") int commentId, @Param("start") int start, @Param("end") int end);

	//검색
	/*int selectTotalBoardPageByKeyword(String keyword);
	List<Board> searchListByContentKeyword(@Param("keyword") String keyword, @Param("start") int start, @Param("end") int end);
	Comments selectComment(int commentId);*/
	
	//공지사항
	//List<Board> selectBoardListByRole(@Param("start")int start,@Param("end") int end);
}
