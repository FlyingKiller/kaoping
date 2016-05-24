package com.kaoping.daoimply;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaoping.dao.LoginDao;
import com.kaoping.entities.Teacher;
/**
 * @author ASUS
 * 登录的dao的实现类
 */
@Repository
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
