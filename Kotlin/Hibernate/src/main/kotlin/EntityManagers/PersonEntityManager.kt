package EntityManagers

import Models.Person
import Utils.HibernateUtil
import org.hibernate.Session

class PersonEntityManager : EntityManager<Person> {
    private companion object {
        fun getSession(): Session {
            return HibernateUtil.getSession()
        }
    }

    override fun getById(id: Any): Person {
        val session = getSession()
        val person = session.get(Person::class.java, id)
        session.close()
        return person
    }

    override fun getAll(): List<Person> {
        val session = getSession()
        val builder = session.criteriaBuilder
        val criteria = builder.createQuery(Person::class.java)
        criteria.from(Person::class.java)
        val people = session.createQuery(criteria).resultList
        session.close()
        return people
    }
}
