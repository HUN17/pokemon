package com.sist.user;
import java.util.*;
/*
  	id          VARCHAR2(10),
    pwd         VARCHAR2(8) CONSTRAINT  U_table_pwd_nn NOT NULL,
    nickname    VARCHAR2(34) CONSTRAINT U_table_name_nn NOT NULL,
    gender      CHAR(4),
    phone       VARCHAR2(13),
    email       VARCHAR2(100),
    ban         VARCHAR2(10),
    lev         number,
    point       number
 */
public class MemberVO {
	private String id;
	private String pwd;
	private String nickname;
	private String gender;
	private String phone;
	private String phone1;
	private String email;
	private String email1;
	private String ban;
	private int point;
	private Date regdate;
	private int exp;
	
	
	public int getExp() {
		return exp;
	}
	public void setExp(int exp) {
		this.exp = exp;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getBan() {
		return ban;
	}
	public void setBan(String ban) {
		this.ban = ban;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	
}