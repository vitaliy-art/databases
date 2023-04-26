package EntityManagers

import Utils.HibernateUtil
import org.hibernate.Session
import java.util.Objects

interface EntityManager <T> {
    private companion object {
        fun getSession(): Session {
            return HibernateUtil.getSession()
        }
    }

    fun addNew(entity: T) {
        val session = getSession()
        val transaction = session.beginTransaction()
        session.persist(entity)
        transaction.commit()
        session.close()
    }

    fun saveChanges(entity: T) {
        val session = getSession()
        val transaction = session.beginTransaction()
        session.merge(entity)
        transaction.commit()
        session.close()
    }

    fun delete(entity: T) {
        val session = getSession()
        val transaction = session.beginTransaction()
        session.remove(entity)
        transaction.commit()
        session.close()
    }

    fun getAll(): List<T>
    fun getById(id: Any): T
}
