package com.kaoping.daoimply;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaoping.dao.TeacherDao;
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

	@Override
	public List<Teacher> getTeacherByName(String teacherName, String academy) {
		if ("超级管理员".equals(academy)) {
			Query query = this.getSession().createQuery("from Teacher where name like ? or name like ? or name like ?");
			query.setString(0, "%" + teacherName + "%");
			query.setString(1, teacherName + "%");
			query.setString(2, "%" + teacherName);
			if (query.list().size() == 0) {
				return null;
			} else {
				return query.list();
			}
		} else {
			Query query = this.getSession()
					.createQuery("from Teacher where name like ? or name like ? or name like ? and academy=?");
			query.setString(0, "%" + teacherName + "%");
			query.setString(1, teacherName + "%");
			query.setString(2, "%" + teacherName);
			query.setString(3, academy);
			if (query.list().size() == 0) {
				return null;
			} else {
				return query.list();
			}
		}
	}

	@Override
	public Teacher getTeacherById(int teacherId) {
		Query query = this.getSession().createQuery("from Teacher where teacherId=?");
		query.setInteger(0, teacherId);
		return (Teacher) query.list().get(0);
	}

	@Override
	public void updateTeacher(Teacher teacher) {
		Query query = this.getSession().createQuery(
				"update Teacher set teacherId=?,password=?,name=?,nation=?,sex=?,cardId=?,academy=?,level=?,status=? , degree=? ,dignity=? ,positional=? , positionalLevel=? , positionalSery=? where id=?");
		query.setInteger(0, teacher.getTeacherId());
		query.setString(1, teacher.getPassword());
		query.setString(2, teacher.getName());
		query.setString(3, teacher.getNation());
		query.setString(4, teacher.getSex());
		query.setString(5, teacher.getCardId());
		query.setString(6, teacher.getAcademy());
		query.setString(7, teacher.getLevel());
		query.setString(8, teacher.getStatus());
		query.setString(9, teacher.getDegree());
		query.setString(10, teacher.getDignity());
		query.setString(11, teacher.getPositional());
		query.setString(12, teacher.getPositionalLevel());
		query.setString(13, teacher.getPositionalSery());
		query.setInteger(14, teacher.getId());
		query.executeUpdate();
	}

	@Override
	public void deleteTeacher(int teacherId) {
		Query query = this.getSession().createQuery("delete Teacher as a where a.teacherId=?");
		query.setInteger(0, teacherId);
		query.executeUpdate();
	}

	@Override
	public int checkAdminName(int teacherId) {
		Query query = this.getSession().createQuery("from Teacher where teacherId=?");
		query.setInteger(0, teacherId);
		if (query.list().size() == 0) {
			return 2;
		} else {
			Teacher teacher = (Teacher) query.list().get(0);
			if (teacher.getType() == 2) {
				return 3;
			} else {
				return 1;
			}
		}
	}

	@Override
	public void addAdmin(int teacherId) {
		Query query = this.getSession().createQuery("update Teacher set type=1 where teacherId=?");
		query.setInteger(0, teacherId);
		query.executeUpdate();
	}

	@Override
	public List<Teacher> getAdmin() {
		Query query = this.getSession().createQuery("from Teacher where type=1");
		if (query.list().size() == 0) {
			return null;
		} else {
			return query.list();
		}
	}

	@Override
	public void deleteAdmin(int teacherId) {
		Query query = this.getSession().createQuery("update Teacher set type=2 where teacherId=?");
		query.setInteger(0, teacherId);
		query.executeUpdate();
	}
}
