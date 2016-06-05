package com.kaoping.daoimply;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaoping.dao.StandardDao;
import com.kaoping.entities.Standard;
import com.kaoping.entities.StandardContent;
import com.kaoping.tool.Page;

@Repository
public class StandardDaoImply extends FatherDaoImply implements StandardDao {

	@Override
	public int getStandardRow(String academy) {
		Query query = null;
		if ("超级管理员".equals(academy)) {
			query = this.getSession().createQuery("from Standard");
		} else {
			query = this.getSession().createQuery("from Standard where academy=:academy");
			query.setString("academy", academy);
		}
		return query.list().size();
	}

	@Override
	public List<Standard> getStandardByPage(String academy, Page page) {
		Query query = null;
		if ("超级管理员".equals(academy)) {
			query = this.getSession().createQuery("from Standard");
		} else {
			query = this.getSession().createQuery("from Standard where academy=:academy");
			query.setString("academy", academy);
		}
		query.setFirstResult((page.getNowPage() - 1) * page.getRowPerPage());
		query.setMaxResults(page.getRowPerPage());
		return query.list();
	}

	public boolean checkStandardName(String standardName) {
		Query query = this.getSession().createQuery("from Standard where name=?");
		query.setString(0, standardName);
		if (query.list().size() == 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void addStandard(Standard standard) {
		Query query = this.getSession().createQuery("select name from Standard where name=?");
		query.setString(0, standard.getName());
		if (query.list().size() == 0) {
			this.getSession().save(standard);
		} else {

		}
	}

	@Override
	public void addStandardContent(StandardContent standardContent) {
		Query query = this.getSession().createQuery("from StandardContent where standardName=? and contentName=?");
		query.setString(0, standardContent.getStandardName());
		query.setString(1, standardContent.getContentName());
		if (query.list().size() == 0) {
			this.getSession().save(standardContent);
			this.getSession().flush();
			this.getSession().clear();
		} else {

		}
	}

	@Override
	public void deleteStandard(String standardName) {
		Query query = this.getSession().createQuery("delete Standard as s where s.name=:standardName");
		query.setString("standardName", standardName);
		query.executeUpdate();
	}

	@Override
	public void deleteStandardContent(String standardName) {
		Query query = this.getSession().createQuery("delete StandardContent as sc where sc.standardName=:standardName");
		query.setString("standardName", standardName);
		query.executeUpdate();
	}

	@Override
	public List<StandardContent> getStandardDetail(int standardId) {
		Query query = this.getSession().createQuery("from StandardContent where standardId=?");
		query.setInteger(0, standardId);
		return query.list();
	}

	@Override
	public List<Standard> getStandardDetailB(int standardId) {
		Query query = this.getSession().createQuery("from Standard where standardId=?");
		query.setInteger(0, standardId);
		return query.list();
	}
}
