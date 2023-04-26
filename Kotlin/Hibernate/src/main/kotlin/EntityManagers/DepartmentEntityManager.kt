package EntityManagers

import Models.Department
import Utils.HibernateUtil
import org.hibernate.Session

class DepartmentEntityManager : EntityManager<Department> {
    private companion object {
        fun getSession(): Session {
            return HibernateUtil.getSession()
        }
    }

    override fun getById(id: Any): Department {
        val session = getSession()
        val department = session.get(Department::class.java, id)
        session.close()
        return department
    }

    override fun getAll(): List<Department> {
        val session = getSession()
        val builder = session.criteriaBuilder
        val criteria = builder.createQuery(Department::class.java)
        criteria.from(Department::class.java)
        val departments = session.createQuery(criteria).resultList
        session.close()
        return departments
    }
}
