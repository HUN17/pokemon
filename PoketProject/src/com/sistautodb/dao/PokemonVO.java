package com.sistautodb.dao;
/**
 * 
 * 1. 추가된 vo및 getter setter 생성, 
 * 2. inputstream.java 
 * 		- vo.set 추가 temp[추가열] 
 * 3. pokemonDAO 
 */
public class PokemonVO {
	//no, name,  s_type1, s_type2, l_type1, l_type2 
	private String no;
	private String name;
	private String type1;
	private String type2;
	private String rev1;
	private String rev2;
	private String rev3;
	private String s_type1;
	private String s_type2;
	private String l_type1;
	private String l_type2;
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType1() {
		return type1;
	}
	public void setType1(String type1) {
		this.type1 = type1;
	}
	public String getType2() {
		return type2;
	}
	public void setType2(String type2) {
		this.type2 = type2;
	}
	public String getRev1() {
		return rev1;
	}
	public void setRev1(String rev1) {
		this.rev1 = rev1;
	}
	public String getRev2() {
		return rev2;
	}
	public void setRev2(String rev2) {
		this.rev2 = rev2;
	}
	public String getRev3() {
		return rev3;
	}
	public void setRev3(String rev3) {
		this.rev3 = rev3;
	}
	public String getS_type1() {
		return s_type1;
	}
	public void setS_type1(String s_type1) {
		this.s_type1 = s_type1;
	}
	public String getS_type2() {
		return s_type2;
	}
	public void setS_type2(String s_type2) {
		this.s_type2 = s_type2;
	}
	public String getL_type1() {
		return l_type1;
	}
	public void setL_type1(String l_type1) {
		this.l_type1 = l_type1;
	}
	public String getL_type2() {
		return l_type2;
	}
	public void setL_type2(String l_type2) {
		this.l_type2 = l_type2;
	}
	
	
}
