package EntityManagers

import Models.Employee
import Utils.HibernateUtil
import org.hibernate.Session

class EmployeeEntityManager implements EntityManager<Employee>{
    static Session getSession() {
        return HibernateUtil.getSession()
    }

    Employee getById(id) {
        def session = getSession()
        def employee = session.get(Employee.class, id)
        session.close()
        return employee
    }

    List<Employee> getAll() {
        def session = getSession()
        def builder = session.getCriteriaBuilder()
        def criteria = builder.createQuery(Employee.class)
        criteria.from(Employee.class)
        def employees = session.createQuery(criteria).getResultList()
        return employees
    }

    void addNew(Employee employee) {
        def session = getSession()
        def transaction = session.beginTransaction()
        session.persist(employee)
        transaction.commit()
        session.close()
    }

    void saveChanges(Employee employee) {
        def session = getSession()
        def transaction = session.beginTransaction()
        session.merge(employee)
        transaction.commit()
        session.close()
    }

    void delete(Employee employee) {
        def session = getSession()
        def transaction = session.beginTransaction()
        session.remove(employee)
        transaction.commit()
        session.close()
    }
}
