package com.sist.change;

public class JspChange {
	private static String[] jsp={
			"default.jsp",
			"../board/notice.jsp",
			"../book/book.jsp",
			"../board/tip.jsp",
			"../board/qna.jsp",
			"../board/free.jsp",
			"../alliance/alliance.jsp",
			"../mypage/mypage_check.jsp",
			"../board/free_find.jsp",		
			"../board/free_content.jsp",	
			"../board/free_insert.jsp",
			"../board/free_update.jsp",
			"../board/free_reply.jsp"
	};
	
	public static String change(int no){
		return jsp[no];
	}
}




















