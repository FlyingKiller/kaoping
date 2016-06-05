package com.kaoping.entities;

import java.io.Serializable;

public class StandardContent implements Serializable {
	private static final long serialVersionUID = -8829654906901856621L;
	private int contentId;
	private String contentName;
	private double percent;
	private int standardId;
	private String standardName;
	private String remark2;

	public StandardContent() {
	}

	public StandardContent(String contentName, double percent,
			String standardName) {
		this.contentName = contentName;
		this.percent = percent;
		this.standardId = 0;
		this.standardName = standardName;
		this.remark2 = "0";
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public String getContentName() {
		return contentName;
	}

	public void setContentName(String contentName) {
		this.contentName = contentName;
	}

	public double getPercent() {
		return percent;
	}

	public void setPercent(double percent) {
		this.percent = percent;
	}

	public int getStandardId() {
		return standardId;
	}

	public void setStandardId(int standardId) {
		this.standardId = standardId;
	}

	public String getStandardName() {
		return standardName;
	}

	public void setStandardName(String standardName) {
		this.standardName = standardName;
	}

	public String getRemark2() {
		return remark2;
	}

	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}

}
