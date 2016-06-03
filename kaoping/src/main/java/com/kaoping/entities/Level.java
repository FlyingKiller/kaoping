package com.kaoping.entities;

import java.io.Serializable;
public class Level implements Serializable {
	private static final long serialVersionUID = 5353273330292427953L;
	private int levelId;
     private String levelName;
     private String remark1;
     private String remark2;
	public int getLevelId() {
		return levelId;
	}
	public void setLevelId(int levelId) {
		this.levelId = levelId;
	}
	public String getLevelName() {
		return levelName;
	}
	public void setLevelName(String levelName) {
		this.levelName = levelName;
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
