package com.kaoping.tool;

import java.io.Serializable;

public class Page implements Serializable {
	private int rowNum;
	private int nowPage;
	private int rowPerPage;
	private int pageNum;

	public Page() {
	}

	// public Page(int rowNum,int nowPage){
	// this.rowNum = rowNum;
	// this.nowPage = nowPage;
	// this.rowPerPage = 5;
	// if(rowNum%5==0){
	// this.pageNum = rowNum/5;
	// }else{
	// this.pageNum = rowNum/5+1;
	// }
	// }
	public Page(int rowNum, int nowPage) {
		super();
		this.rowNum = rowNum;
		this.nowPage = nowPage;
		this.rowPerPage = 10;
		if (rowNum % 10 == 0) {
			this.pageNum = rowNum / 10;
		} else {
			this.pageNum = rowNum / 10 + 1;
		}
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getRowPerPage() {
		return rowPerPage;
	}

	public void setRowPerPage(int rowPerPage) {
		this.rowPerPage = rowPerPage;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

}
