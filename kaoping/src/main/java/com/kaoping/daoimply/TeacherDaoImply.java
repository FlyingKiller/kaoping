package com.kaoping.daoimply;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaoping.dao.TeacherDao;
import com.kaoping.entities.Academy;
import com.kaoping.entities.Teacher;
import com.kaoping.tool.Page;

@Repository
public class TeacherDaoImply extends FatherDaoImply implements TeacherDao {

	@Override
	public List<Teacher> getTeacher(String departmentName, String levelName, Page page) {
		String sql = "from Teacher where 1=1";
		if (!"".equals(departmentName)) {
			sql += " and " + "academy like :departmentName";
		}
		if (!"".equals(levelName)) {
			sql += " and " + "level like :levelName";
		}
		Query query = this.getSession().createQuery(sql);
		if (!"".equals(departmentName)) {
			query.setString("departmentName", departmentName);
		}
		if (!"".equals(levelName)) {
			query.setString("levelName", levelName);
		}
		query.setFirstResult((page.getNowPage() - 1) * page.getRowPerPage());
		query.setMaxResults(page.getRowPerPage());
		if (query.list() != null) {
			return query.list();
		} else {
			return null;
		}
	}

	public int getTeacherPage(String departmentName, String levelName) {
		String sql = "from Teacher where 1=1";
		if (!"".equals(departmentName)) {
			sql += " and " + "academy like :departmentName";
		}
		if (!"".equals(levelName)) {
			sql += " and " + "level like :levelName";
		}
		Query query = this.getSession().createQuery(sql);
		if (!"".equals(departmentName)) {
			query.setString("departmentName", departmentName);
		}
		if (!"".equals(levelName)) {
			query.setString("levelName", levelName);
		}
		if (query.list() != null) {
			return query.list().size();
		} else {
			return 0;
		}
	}

	@Override
	public List<String> getAcademy() {
		Query query = this.getSession().createQuery("select academyName from Academy");
		return query.list();
	}

	@Override
	public int addTeacherAdd(Teacher teacher) {
		Query query = this.getSession().createQuery("select teacherId from Teacher where teacherId=?");
		query.setInteger(0, teacher.getTeacherId());
		if (query.list().size() == 0) {
			this.getSession().save(teacher);
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public List<com.kaoping.entities.Level> Level() {
		Query query = this.getSession().createQuery("from Level");
		return query.list();
	}
}
