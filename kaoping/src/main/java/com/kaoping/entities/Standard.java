package com.kaoping.entities;

import java.io.Serializable;
import java.util.Date;

public class Standard implements Serializable {
	private static final long serialVersionUID = -2920161255632665725L;
	private int standardId;
	private String name;
	private String teacherId;
	private Date createTime;
	private double schoolweight;
	private String academy;
	private double sameweight;
	private double sameacademyweight;
	private double excellent;
	private double eligibility;
	private double jeligibility;
	private double beligibility;

	public Standard() {
	}

//	public Standard(String name, String teacherId, String academy,
//			double excellent, double eligibility, double jeligibility,
//			double beligibility) {
//		this.name = name;
//		this.teacherId = teacherId;
//		this.createTime = new Date();
//		this.academy = academy;
//		this.excellent = excellent;
//		this.eligibility = eligibility;
//		this.jeligibility = jeligibility;
//		this.beligibility = beligibility;
//	}

	public Standard(String name, String teacherId, double schoolweight,
			String academy, double sameweight, double sameacademyweight,
			double excellent, double eligibility, double jeligibility,
			double beligibility) {
		super();
		this.name = name;
		this.teacherId = teacherId;
		this.schoolweight = schoolweight;
		this.academy = academy;
		this.sameweight = sameweight;
		this.sameacademyweight = sameacademyweight;
		this.excellent = excellent;
		this.eligibility = eligibility;
		this.jeligibility = jeligibility;
		this.beligibility = beligibility;
		this.createTime=new Date();
	}

	public double getExcellent() {
		return excellent;
	}

	public void setExcellent(double excellent) {
		this.excellent = excellent;
	}

	public double getEligibility() {
		return eligibility;
	}

	public void setEligibility(double eligibility) {
		this.eligibility = eligibility;
	}

	public double getJeligibility() {
		return jeligibility;
	}

	public void setJeligibility(double jeligibility) {
		this.jeligibility = jeligibility;
	}

	public double getBeligibility() {
		return beligibility;
	}

	public void setBeligibility(double beligibility) {
		this.beligibility = beligibility;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public int getStandardId() {
		return standardId;
	}

	public void setStandardId(int standardId) {
		this.standardId = standardId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public double getSchoolweight() {
		return schoolweight;
	}

	public void setSchoolweight(double schoolweight) {
		this.schoolweight = schoolweight;
	}

	public double getSameweight() {
		return sameweight;
	}

	public void setSameweight(double sameweight) {
		this.sameweight = sameweight;
	}

	public double getSameacademyweight() {
		return sameacademyweight;
	}

	public void setSameacademyweight(double sameacademyweight) {
		this.sameacademyweight = sameacademyweight;
	}

	public String getAcademy() {
		return academy;
	}

	public void setAcademy(String academy) {
		this.academy = academy;
	}

}
