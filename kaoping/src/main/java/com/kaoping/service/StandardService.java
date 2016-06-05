package com.kaoping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaoping.dao.StandardDao;
import com.kaoping.entities.Standard;
import com.kaoping.entities.StandardContent;
import com.kaoping.tool.Page;
@Service("StandardService")
public class StandardService {
	@Autowired
	private StandardDao standardDao;

	public void setStandardDao(StandardDao standardDao) {
		this.standardDao = standardDao;
	}

	public int getStandardRow(String academy) {
		return standardDao.getStandardRow(academy);
	}

	public List<Standard> getStandardByPage(String academy, Page page) {
		return standardDao.getStandardByPage(academy, page);
	}

	public boolean checkStandardName(String standardName) {
		return standardDao.checkStandardName(standardName);
	}

	public void addStandard(Standard standard) {
		standardDao.addStandard(standard);
	}

	public void addStandardContent(StandardContent standardContent) {
		standardDao.addStandardContent(standardContent);
	}

	public void deleteStandard(String standardName) {
		standardDao.deleteStandard(standardName);
		standardDao.deleteStandardContent(standardName);
	}

	public List<StandardContent> getStandardDetail(int standardId) {
		return standardDao.getStandardDetail(standardId);
	}

	public List<Standard> getStandardDetailB(int standardId) {
		return standardDao.getStandardDetailB(standardId);
	}
}
