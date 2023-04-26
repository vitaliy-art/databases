package Utils

import Models.Department
import Models.Employee
import Models.Person
import org.hibernate.*
import org.hibernate.cfg.Configuration
import java.util.Properties

class HibernateUtil {
    companion object {
        private val sessionFactory: SessionFactory = getSessionFactory()

        private fun getSessionFactory(): SessionFactory {
            try {
                val prop = Properties()
                prop.setProperty("log4j.logger.org.hibernate.type", "warn")
                prop.setProperty("log4j.logger.org.hibernate.orm.jdbc.bind", "warn")
                prop.setProperty("log4j.logger.org.hibernate.orm.jdbc.extract", "warn")
                prop.setProperty("hibernate.dialect", "org.hibernate.community.dialect.SQLiteDialect")
                prop.setProperty("hibernate.connection.url", "jdbc:sqlite:bd.db")
                prop.setProperty("hibernate.connection.driver_class", "org.sqlite.JDBC")
                prop.setProperty("hibernate.connection.foreign_keys", "true")
                val config = Configuration()
                config.setProperties(prop)
                config.addAnnotatedClass(Department::class.java)
                config.addAnnotatedClass(Person::class.java)
                config.addAnnotatedClass(Employee::class.java)
                return config.buildSessionFactory()
            } catch (e: Throwable) {
                throw ExceptionInInitializerError(e)
            }
        }

        fun getSession(): Session {
            return sessionFactory.openSession()
        }
    }
}
