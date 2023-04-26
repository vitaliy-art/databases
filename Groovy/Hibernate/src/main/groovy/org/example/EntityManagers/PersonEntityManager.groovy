package EntityManagers

import Models.Person
import Utils.HibernateUtil
import org.hibernate.Session

class PersonEntityManager implements EntityManager<Person> {
    static Session getSession() {
        return HibernateUtil.getSession()
    }

    Person getById(id) {
        def session = getSession()
        def person = session.get(Person.class, id)
        session.close()
        return person
    }

    List<Person> getAll() {
        def session = getSession()
        def builder = session.getCriteriaBuilder()
        def criteria = builder.createQuery(Person.class)
        criteria.from(Person.class)
        def people = session.createQuery(criteria).getResultList()
        return people
    }

    void addNew(Person person) {
        def session = getSession()
        def transaction = session.beginTransaction()
        session.persist(person)
        transaction.commit()
        session.close()
    }

    void saveChanges(Person person) {
        def session = getSession()
        def transaction = session.beginTransaction()
        session.merge(person)
        transaction.commit()
        session.close()
    }

    void delete(Person person) {
        def session = getSession()
        def transaction = session.beginTransaction()
        session.remove(person)
        transaction.commit()
        session.close()
    }
}
