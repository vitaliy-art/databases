package EntityManagers

import Models.Employee
import Utils.HibernateUtil
import org.hibernate.Session

class EmployeeEntityManager : EntityManager<Employee> {
    private companion object {
        fun getSession(): Session {
            return HibernateUtil.getSession()
        }
    }

    override fun getById(id: Any): Employee {
        val session = getSession()
        val employee = session.get(Employee::class.java, id)
        session.close()
        return employee
    }

    override fun getAll(): List<Employee> {
        val session = getSession()
        val builder = session.criteriaBuilder
        val criteria = builder.createQuery(Employee::class.java)
        criteria.from(Employee::class.java)
        val employees = session.createQuery(criteria).resultList
        session.close()
        return employees
    }
}
