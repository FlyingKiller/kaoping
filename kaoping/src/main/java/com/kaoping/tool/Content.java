package com.kaoping.tool;

import java.io.Serializable;

public class Content implements Serializable{
	private String name;
	private int percent;

	public int getPercent() {
		return percent;
	}

	public void setPercent(int percent) {
		this.percent = percent;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Content(String name) {
		super();
		this.name = name;
	}

	public Content() {
		super();
	}
}
