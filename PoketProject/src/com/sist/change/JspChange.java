package com.sist.change;

public class JspChange {
	private static String[] jsp={
			"default.jsp",												
			"../board/notice.jsp",
			"../book/book.jsp",
			"../board/tip.jsp",
			"../board/qna.jsp",
			"../board/free.jsp",								//5
			"../alliance/alliance.jsp",
			"../mypage/mypage_check.jsp",
			"../board/free_find.jsp",		
			"../board/free_content.jsp",	
			"../board/free_insert.jsp",				//10
			"../board/free_update.jsp",
			"../board/free_reply.jsp",
			"../board/notice_find.jsp",		
			"../board/notice_content.jsp",	
			"../board/notice_insert.jsp",			//15
			"../board/notice_update.jsp",
			"../board/notice_reply.jsp",
			"../member/modify.jsp",
			"../mypage/point.jsp",
			"../board/qna_find.jsp",			//20
			"../board/qna_content.jsp",	
			"../board/qna_insert.jsp",				
			"../board/qna_update.jsp",
			"../board/tip_find.jsp",			
			"../board/tip_content.jsp",			//25	
			"../board/tip_insert.jsp",				
			"../board/tip_update.jsp"
	};
	
	public static String change(int no){
		return jsp[no];
	}
}




















