package com.kaoping.entities;

import java.io.Serializable;
public class Academy implements Serializable {
	
	private static final long serialVersionUID = -3306233243560741531L;
	private int academyId;
	private  String academyName;
	private  String academyPhone;
	private  String academyAbstract;
	private String remark1;
	private String remark2;
	public int getAcademyId() {
		return academyId;
	}
	public void setAcademyId(int academyId) {
		this.academyId = academyId;
	}
	public String getAcademyName() {
		return academyName;
	}
	public void setAcademyName(String academyName) {
		this.academyName = academyName;
	}
	public String getAcademyPhone() {
		return academyPhone;
	}
	public void setAcademyPhone(String academyPhone) {
		this.academyPhone = academyPhone;
	}
	public String getAcademyAbstract() {
		return academyAbstract;
	}
	public void setAcademyAbstract(String academyAbstract) {
		this.academyAbstract = academyAbstract;
	}
	public String getRemark1() {
		return remark1;
	}
	public void setRemark1(String remark1) {
		this.remark1 = remark1;
	}
	public String getRemark2() {
		return remark2;
	}
	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}
}
