package choi.notice.model;

import java.sql.SQLException;
import java.util.List;

public interface InterNoticeDAO {
	
	// 조회할 페이지번호를 파라미터로 받아서 그 페이지번호의 게시글들을 셀렉트 해오는 메소드
	List<NoticeDTO> selectAllNotice() throws SQLException;
	
	
	// 글번호를 입력받아서 한개의 글을 select 하는 메소드
	NoticeDTO select_one_notice(int notice_num) throws SQLException;

}
