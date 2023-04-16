package example.Utils;

import java.util.Properties;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import example.Models.Department;
import example.Models.Employee;
import example.Models.Person;

public class HibernateUtil {
    private static final SessionFactory concreteSessionFactory;
    static {
        try {
            Properties prop = new Properties();
            prop.setProperty("hibernate.dialect", "org.hibernate.community.dialect.SQLiteDialect");
            prop.setProperty("hibernate.connection.url", "jdbc:sqlite:bd.db");
            prop.setProperty("hibernate.connection.driver_class", "org.sqlite.JDBC");
            Configuration config = new Configuration()
                .setProperties(prop)
                .addAnnotatedClass(Department.class)
                .addAnnotatedClass(Person.class)
                .addAnnotatedClass(Employee.class);

            concreteSessionFactory = config.buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static Session getSession() throws HibernateException {
        return concreteSessionFactory.openSession();
    }
}
