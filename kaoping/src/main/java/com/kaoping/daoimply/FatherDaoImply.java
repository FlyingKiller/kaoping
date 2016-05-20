package com.kaoping.daoimply;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class FatherDaoImply {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}
}
