package example.EntityManager;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import example.Models.Employee;
import example.Utils.HibernateUtil;
import jakarta.persistence.RollbackException;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;

public class EmployeeEntityManager implements EntityManager<Employee> {

    private static Session getSession() throws HibernateException {
        return HibernateUtil.getSession();
    }

    public Employee getById(Object id) throws HibernateException {
        Session session = getSession();
        Employee employee = session.get(Employee.class, id);
        session.close();
        return employee;
    }

    public List<Employee> getAll() throws HibernateException, IllegalStateException {
        Session session = getSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Employee> criteria = builder.createQuery(Employee.class);
        criteria.from(Employee.class);
        List<Employee> employees = session.createQuery(criteria).getResultList();
        session.close();
        return employees;
    }

    public void addNew(Employee employee) throws HibernateException, IllegalStateException, RollbackException {
        Session session = getSession();
        Transaction transaction = session.beginTransaction();
        if (employee.getPerson() != null)
            session.merge(employee.getPerson());

        if (employee.getDepartment() != null)
            session.merge(employee.getDepartment());

        session.merge(employee);
        transaction.commit();
        session.close();
    }

    public void saveChanges(Employee employee) throws HibernateException, IllegalStateException, RollbackException {
        Session session = getSession();
        Transaction transaction = session.beginTransaction();
        session.merge(employee);
        transaction.commit();
        session.close();
    }

    public void delete(Employee employee) throws HibernateException, IllegalStateException, RollbackException {
        Session session = getSession();
        Transaction transaction = session.beginTransaction();
        session.remove(employee);
        transaction.commit();
        session.close();
    }
}
