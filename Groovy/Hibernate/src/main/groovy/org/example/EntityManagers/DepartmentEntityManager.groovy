package EntityManagers

import Models.Department
import Utils.HibernateUtil
import org.hibernate.Session

class DepartmentEntityManager implements EntityManager<Department>{
    static Session getSession() {
        return HibernateUtil.getSession()
    }

    Department getById(id) {
        def session = getSession()
        def department = session.get(Department.class, id)
        session.close()
        return department
    }

    List<Department> getAll() {
        def session = getSession()
        def builder = session.getCriteriaBuilder()
        def criteria = builder.createQuery(Department.class)
        criteria.from(Department.class)
        def departments = session.createQuery(criteria).getResultList()
        return departments
    }

    void addNew(Department department) {
        def session = getSession()
        def transaction = session.beginTransaction()
        session.persist(department)
        transaction.commit()
        session.close()
    }

    void saveChanges(Department department) {
        def session = getSession()
        def transaction = session.beginTransaction()
        session.merge(department)
        transaction.commit()
        session.close()
    }

    void delete(Department department) {
        def session = getSession()
        def transaction = session.beginTransaction()
        session.remove(department)
        transaction.commit()
        session.close()
    }
}
