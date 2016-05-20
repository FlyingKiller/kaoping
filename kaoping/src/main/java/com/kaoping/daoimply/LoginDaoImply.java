package com.kaoping.daoimply;

import org.hibernate.Query;

import com.kaoping.dao.LoginDao;
import com.kaoping.entities.Teacher;

public class LoginDaoImply extends FatherDaoImply implements LoginDao {

	@Override
	public Teacher loginDao(int type, int teacherId) {
		Query query = this.getSession().createQuery("from Teacher where type=? and teacherId=?");
		query.setInteger(0, type);
		query.setInteger(1, teacherId);
		if (query.list().size() == 0) {
			return null;
		} else {
			return (Teacher) query.list().get(0);
		}
	}
}
