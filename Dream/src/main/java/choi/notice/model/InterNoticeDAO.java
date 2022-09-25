package choi.notice.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterNoticeDAO {
	
	// 페이지 번호에 알맞는 게시물을 한 페이지에 보여줄 게시물 수만큼가져오는 메소드
	List<NoticeDTO> selectAllNotice(Map<String,String> paraMap) throws SQLException;
	
	
	// 게시물번호에 알맞는 게시물 하나를 가져오는 메소드
	NoticeDTO select_one_notice(int notice_num) throws SQLException;

	// 모든 공지사항 갯수를 가져오는 메소드
	int cntAllNotice() throws SQLException;

}
