package com.kaoping.entities;

import java.io.Serializable;

public class Teacher implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3216989047906646613L;
	private int teacherId;// 工号
	private String password;// 密码
	private String name;// 姓名
	private String nation;// 民族
	private String sex;// 性别
	private String cardId;// 身份证
	private String academy;// 部门
	private String level;// 级别
	private String status;// 党政级别
	private String degree;// 岗位类型
	private String dignity;// 专业
	private String positional;// 研究方向
	private String positionalLevel;
	private String positionalSery;
	private int loginNum;
	private int id;// 主键
	private int type;// 类型

	public int getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getAcademy() {
		return academy;
	}

	public void setAcademy(String academy) {
		this.academy = academy;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getDignity() {
		return dignity;
	}

	public void setDignity(String dignity) {
		this.dignity = dignity;
	}

	public String getPositional() {
		return positional;
	}

	public void setPositional(String positional) {
		this.positional = positional;
	}

	public String getPositionalLevel() {
		return positionalLevel;
	}

	public void setPositionalLevel(String positionalLevel) {
		this.positionalLevel = positionalLevel;
	}

	public String getPositionalSery() {
		return positionalSery;
	}

	public void setPositionalSery(String positionalSery) {
		this.positionalSery = positionalSery;
	}

	public int getLoginNum() {
		return loginNum;
	}

	public void setLoginNum(int loginNum) {
		this.loginNum = loginNum;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Teacher() {
		super();
	}

	public Teacher(int teacherId, String password, String name, String nation, String sex, String cardId,
			String academy, String level, String status, String degree, String dignity, String positional,
			String positionalLevel, String positionalSery) {
		super();
		this.teacherId = teacherId;
		this.password = password;
		this.name = name;
		this.nation = nation;
		this.sex = sex;
		this.cardId = cardId;
		this.academy = academy;
		this.level = level;
		this.status = status;
		this.degree = degree;
		this.dignity = dignity;
		this.positional = positional;
		this.positionalLevel = positionalLevel;
		this.positionalSery = positionalSery;
		this.loginNum = 0;
		this.type = 2;// 2代表教职工
	}

}
