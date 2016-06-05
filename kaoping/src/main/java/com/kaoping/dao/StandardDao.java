package com.kaoping.dao;

import java.util.List;

import com.kaoping.entities.Standard;
import com.kaoping.entities.StandardContent;
import com.kaoping.tool.Page;

public interface StandardDao {
	public int getStandardRow(String academy);

	public List<Standard> getStandardByPage(String academy, Page page);

	public boolean checkStandardName(String standardName);

	public void addStandard(Standard standard);

	public void addStandardContent(StandardContent standardContent);

	public void deleteStandard(String standardName);

	public void deleteStandardContent(String standardName);

	public List<StandardContent> getStandardDetail(int standardId);

	public List<Standard> getStandardDetailB(int standardId);
}
