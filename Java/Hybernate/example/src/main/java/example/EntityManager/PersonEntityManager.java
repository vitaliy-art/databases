package example.EntityManager;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import example.Models.Person;
import example.Utils.HibernateUtil;
import jakarta.persistence.RollbackException;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;

public class PersonEntityManager implements EntityManager<Person> {

    private static Session getSession() throws HibernateException {
        return HibernateUtil.getSession();
    }

    public Person getById(Object id) throws HibernateException {
        Session session = getSession();
        Person person = session.get(Person.class, id);
        session.close();
        return person;
    }

    public List<Person> getAll() throws HibernateException, IllegalStateException {
        Session session = getSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Person> criteria = builder.createQuery(Person.class);
        criteria.from(Person.class);
        List<Person> people = session.createQuery(criteria).getResultList();
        session.close();
        return people;
    }

    public void addNew(Person person) throws HibernateException, IllegalStateException, RollbackException {
        Session session = getSession();
        Transaction transaction = session.beginTransaction();
        session.persist(person);
        transaction.commit();
        session.close();
    }

    public void saveChanges(Person person) throws HibernateException, IllegalStateException, RollbackException {
        Session session = getSession();
        Transaction transaction = session.beginTransaction();
        session.merge(person);
        transaction.commit();
        session.close();
    }

    public void delete(Person person) throws HibernateException, IllegalStateException, RollbackException {
        Session session = getSession();
        Transaction transaction = session.beginTransaction();
        session.remove(person);
        transaction.commit();
        session.close();
    }
}
