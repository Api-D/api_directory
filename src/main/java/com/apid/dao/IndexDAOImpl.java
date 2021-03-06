package com.apid.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IndexDAOImpl implements IndexDAO {
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List totalApiList() {
		
		Session session = this.sessionFactory.openSession();
		Query q= session.createQuery("SELECT COUNT(*) FROM ManageApiVO WHERE api_status=true");
		List totalApiList=q.list();
		return totalApiList;
	}

	@Override
	public List totalCategories() {
		Session session = this.sessionFactory.openSession();
		Query q= session.createQuery("SELECT COUNT(*) FROM ManageCategoryVO WHERE category_status=true");
		List totalCategoryList=q.list();
		return totalCategoryList;
	}
	

	@Override
	public List totalUsers() {
		Session session = this.sessionFactory.openSession();
		Query q= session.createQuery("SELECT COUNT(*) FROM LoginVO");
		List totalCategoryList=q.list();
		return totalCategoryList;
	}

	@Override
	public List totalFeedbacks() {
		Session session = this.sessionFactory.openSession();
		Query q= session.createQuery("SELECT COUNT(*) FROM ManageFeedbacksVO");
		List totalCategoryList=q.list();
		return totalCategoryList;
	}

}
