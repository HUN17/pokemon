<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.sist.board.*"%>
<%
	String strPage=request.getParameter("page");
	if(strPage==null)
		strPage="1";
	int curpage=Integer.parseInt(strPage);
	
	freeDAO dao=new freeDAO();
	List<freeVO> list=dao.boardListData(curpage);
	int totalpage=dao.boardTotalPage();
	int count=dao.boardRowCount();
	//��ü 18�� ���ñ� ==>18��
	//ù��° ��ñ� ��ȣ 
	count=count-((curpage*15)-15);		//18-((1*10)-10)=18��
	
	int total=dao.boardTotalPage();
%>     	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- BootStrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript">
	$(function(){
		$('#findBtn').click(function(){
			var ss = $('#ss').val();
			$('#print').html("");
			if(ss == ""){
				$('#print').html("<font color=red>�˻��� �Է�</font>");
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
	 	<img alt="Ŀ�´�Ƽ" src="../image/board_image/po.png" width="1000" >
		<p>
		<table class="table table-hover" style="width: 70%" >
			<tr bgcolor="#f5f5f5">
				<th width="10%" style="font-size: 13px;">��ȣ</th>
				<th width="45%" style="font-size: 13px;">����</th>
				<th width="15%" style="font-size: 13px;">�̸�</th>
				<th width="20%" style="font-size: 13px;">�ۼ���</th>
				<th width="10%" style="font-size: 13px;">��ȸ��</th>
			</tr>
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
								<img alt="�ٽ�" src="image/icon_reply.gif">&nbsp;
						<%		
							}
							String msg="�����ڿ� ���� ������ �Խù��Դϴ�.";
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
								&nbsp;<sup><img alt="����" src="../image/board_image/ico_new.png"></sup>
						<%		
							}
						%>
					</td>
					<td width="15%" align="center"><%=vo.getName() %></td>
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
                  <input type="button" value="�۾���" id="WriteBtn" class="btn btn-primary">
               </a>
               <select name="fs" class="form-control" style="width:8%" >
                  <option value="name">�̸�</option>
                  <option value="subject">����</option>
                  <option value="content">����</option>
               </select>
               <input type="text" name="ss" id="ss" class="form-control" style="width:20%">      
               <input type="button" value="ã��" id="findBtn" class="btn btn-primary" >
  
               
           		<div class="form-group" style="">
	               	<ul class="pagination">
					<li class="pagination"><a href="main.jsp?mode=5&page=<%=curpage>1?curpage-1:curpage%>">
					< </a></li>
				
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