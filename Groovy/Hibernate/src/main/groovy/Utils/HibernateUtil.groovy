package Utils

import Models.Department
import Models.Employee
import Models.Person
import org.hibernate.Session
import org.hibernate.SessionFactory
import org.hibernate.cfg.Configuration

class HibernateUtil {
    private static final SessionFactory concreteSessionFactory

    static {
        try {
            def prop = new Properties()
            prop.setProperty("log4j.logger.org.hibernate.type", "warn")
            prop.setProperty("log4j.logger.org.hibernate.orm.jdbc.bind", "warn")
            prop.setProperty("log4j.logger.org.hibernate.orm.jdbc.extract", "warn")
            prop.setProperty("hibernate.dialect", "org.hibernate.community.dialect.SQLiteDialect")
            prop.setProperty("hibernate.connection.url", "jdbc:sqlite:bd.db")
            prop.setProperty("hibernate.connection.driver_class", "org.sqlite.JDBC")
            prop.setProperty("hibernate.connection.foreign_keys", "true")
            def config = new Configuration()
                .setProperty(prop)
                .addAnnotatedClass(Department.class)
                .addAnnotatedClass(Person.class)
                .addAnnotatedClass(Employee.class)
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex)
        }
    }

    static Session getSession() {
        return concreteSessionFactory.openSession()
    }
}
