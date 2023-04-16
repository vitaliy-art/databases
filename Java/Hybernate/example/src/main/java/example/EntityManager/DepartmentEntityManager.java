package example.EntityManager;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import example.Models.Department;
import example.Utils.HibernateUtil;
import jakarta.persistence.RollbackException;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;

public class DepartmentEntityManager implements EntityManager<Department> {

    private static Session getSession() throws HibernateException {
        return HibernateUtil.getSession();
    }

    public Department getById(Object id) throws HibernateException {
        Session session = getSession();
        Department department = session.get(Department.class, id);
        session.close();
        return department;
    }

    public List<Department> getAll() throws HibernateException, IllegalStateException {
        Session session = getSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Department> criteria = builder.createQuery(Department.class);
        criteria.from(Department.class);
        List<Department> departments = session.createQuery(criteria).getResultList();
        session.close();
        return departments;
    }

    public void addNew(Department department) throws HibernateException, IllegalStateException, RollbackException {
        Session session = getSession();
        Transaction transaction = session.beginTransaction();
        session.persist(department);
        transaction.commit();
        session.close();
    }

    public void saveChanges(Department department) throws HibernateException, IllegalStateException, RollbackException {
        Session session = getSession();
        Transaction transaction = session.beginTransaction();
        session.merge(department);
        transaction.commit();
        session.close();
    }

    public void delete(Department department) throws HibernateException, IllegalStateException, RollbackException {
        Session session = getSession();
        Transaction transaction = session.beginTransaction();
        session.remove(department);
        transaction.commit();
        session.close();
    }
}
