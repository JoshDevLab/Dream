package choi.notice.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import choi.notice.model.InterNoticeDAO;
import choi.notice.model.NoticeDAO;
import choi.notice.model.NoticeDTO;
import common.controller.AbstractController;

public class NoticeController extends AbstractController{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		
		if("GET".equalsIgnoreCase(method)) {	//method가 "GET"일 때
			
			InterNoticeDAO ndao = new NoticeDAO();
			
			List<NoticeDTO> noticeList = ndao.selectAllNotice();
			
			request.setAttribute("noticeList", noticeList);
			super.setViewPage("/WEB-INF/view/notice/notice.jsp");
		}
		else {	//method가 "POST"일 때
			
		}
	}
}
