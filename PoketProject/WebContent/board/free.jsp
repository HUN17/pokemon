<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.sist.board.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String strPage=request.getParameter("page");
	if(strPage==null)
		strPage="1";
	int curpage=Integer.parseInt(strPage);
	
	freeDAO dao=new freeDAO();
	List<freeVO> list=dao.boardListData(curpage);
	int totalpage=dao.boardTotalPage();
	int count=dao.boardRowCount();
	List<freeVO> list2=dao.likeBoard();
	
	int total=dao.boardTotalPage();
%>     	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$('#findBtn').click(function(){
			var ss = $('#ss').val();
			$('#print').html("");
			if(ss == ""){
				$('#print').html("<font color=red>검색어 입력</font>");
				$('#ss').focus();
				return;
			}
			$('#ff').submit();			
		});
	});
</script>
</head>
<body>
	<center>
		<div style="margin-top: 15px"></div>
	 	<img alt="커뮤니티" src="../image/board_image/po.png" width="1000" >
		<p>
		<table class="table table-hover" style="width: 70%" >
			
			<tr bgcolor="#f5f5f5">
				<th width="10%" style="text-align: center; font-size: 13px;" >번호</th>
				<th width="45%" style="text-align: center; font-size: 13px;">제목</th>
				<th width="15%" style="text-align: center; font-size: 13px;">이름</th>
				<th width="20%" style="text-align: center; font-size: 13px;">작성일</th>
				<th width="10%" style="text-align: center; font-size: 13px;">조회수</th>
			</tr>
			</table>
			
			<table class="popular table table-hover" style="width: 70%" >
				<c:forEach var="vo2" items="<%=list2 %>">
					<tr>
						<td width="10%" align="center"><img alt="인기글" src="../image/board_image/mini_star.png" width="20"></td>
						
						<td width="45%" align="left"><a href="main.jsp?mode=9&no=${vo2.no }">${vo2.subject }</a></td>
						<td width="15%" align="center">	
							<c:if test="${vo2.exp/1000 == 1 }">
								<img alt="초급" src="../image/user_image/b1.png" width="15">
							</c:if>
							<c:if test="${vo2.exp/1000 == 2 }">
								<img alt="중급" src="../image/user_image/b2.png" width="15">
							</c:if>
							
							<c:if test="${vo2.exp/1000 == 3 }">
								<img alt="고급" src="../image/user_image/b3.png" width="15">
							</c:if>
							
							<c:if test="${vo2.exp/1000 == 4 }">
								<img alt="대급" src="../image/user_image/b4.png" width="15">
							</c:if>
						${vo2.name }</td>
						<td width="20%" align="center">${vo2.regdate }</td>
						<td width="10%" align="center">${vo2.hit }</td>
					</tr>
				</c:forEach>
			</table>
			
			<table class="table table-hover" style="width: 70%" >
			<%
				int i=0;
				
				for(freeVO vo:list){
			%>
				<tr bgcolor="" height="27" id="dataTr">
					<td width="10%" align="center"><%=count-- %></td>
					<td width="45%" align="left">
						<%
							if(vo.getGroup_tab()!=0){
								for(int j=0;j<vo.getGroup_tab();j++){
									out.write("&nbsp;&nbsp;");
								}
						%>
								<img alt="다시" src="../image/board_image/icon_reply.gif">&nbsp;
						<%		
							}
							String msg="관리자에 의해 삭제된 게시물입니다.";
							if(msg.equals(vo.getSubject())){
						%>
							<span style="color: gray;cursor: default;"><%=vo.getSubject() %></span>
						<%		
							}else{
						%>
								<a href="main.jsp?mode=9&no=<%=vo.getNo()%>"><%=vo.getSubject() %></a>
						<%		
							}
							SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
							String today=sdf.format(new Date());
							String dbday=vo.getRegdate().toString();
							if(today.equals(dbday)){
						%>
								&nbsp;<sup><img alt="오늘" src="../image/board_image/ico_new.png"></sup>
						<%		
							}
						%>
					</td>
					<td width="15%" align="center">
					<% %>
					
					<%if((vo.getExp()/1000)==1){ %>
						<img alt="초급" src="../image/user_image/b1.png" width="15">
					<%} %>
					
					<%if((vo.getExp()/1000)==2){ %>
						<img alt="중급" src="../image/user_image/b2.png" width="15">
					<%} %>
					
					<%if((vo.getExp()/1000)==3){ %>
						<img alt="고급" src="../image/user_image/b3.png" width="15">
					<%} %>
					
					<%if((vo.getExp()/1000)==4){ %>
						<img alt="대급" src="../image/user_image/b4.png" width="15">
					<%} %>
					
					<%=vo.getName() %>
					</td>
					<td width="20%" align="center"><%=vo.getRegdate().toString() %></td>
					<td width="10%" align="center"><%=vo.getHit() %></td>
				</tr>
			
			<%	
				i++;
				}
			%>
		</table>
		
     <table  class="table" style="width: 70%" > 
         <tr align="center">
            <td>
               <form method="post" action="main.jsp?mode=8" id="ff" class="form-inline">      
               	<a href="main.jsp?mode=10">
                  <input type="button" value="글쓰기" id="WriteBtn" class="btn btn-primary">
               </a>
               <select name="fs" class="form-control" style="width:8%" >
                  <option value="name">이름</option>
                  <option value="subject">제목</option>
                  <option value="content">내용</option>
               </select>
               <input type="text" name="ss" id="ss" class="form-control" style="width:20%"> 
               <input type="button" value="찾기" id="findBtn" class="btn btn-primary" >
  
               
           		<div class="form-group" style="">
	               	<ul class="pagination">
					<li class="pagination"><a href="main.jsp?mode=5&page=<%=curpage>1?curpage-1:curpage%>"><
					</a></li>
				
				<%
					for(i=1; i<=totalpage; i++){
				%>
						<li><a href="main.jsp?mode=5&page=<%=i%>"><%=i %></a></li>
				<%						
					}
				%>
					<li class="pagination"><a href="main.jsp?mode=5&page=<%=curpage<totalpage?curpage+1:curpage%>">
					></a></li>
					</ul>
				</div>
				  <%=curpage %> page / <%=totalpage %> pages	
               </form>

            </td>
           </tr>
          </table>
		
	</center>
</body>
</html>