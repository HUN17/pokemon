package com.sist.user;
import java.util.*;
/*
  cno       NUMBER,
  id        VARCHAR2(15),
  nick      VARCHAR2(15),
  content   CLOB,
  regdate   DATE,
 */
public class chatVO {
   private int cno;
   private String id;
   private String nick;
   private String content;
   private Date regdate;
   
   public int getCno() {
      return cno;
   }
   public void setCno(int cno) {
      this.cno = cno;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getNick() {
      return nick;
   }
   public void setNick(String nick) {
      this.nick = nick;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public Date getRegdate() {
      return regdate;
   }
   public void setRegdate(Date regdate) {
      this.regdate = regdate;
   }
}