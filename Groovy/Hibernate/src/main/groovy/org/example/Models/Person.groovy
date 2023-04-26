package Models

import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.Table
import jakarta.persistence.Column

@Entity
@Table(name = "people")
class Person {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id

    @Column(nullable = false)
    String name

    @Column(nullable = false)
    String address

    @Column(name = "birth_date", nullable = false)
    String birthDate

    Person() {}

    Person(String name, String address, Date birthDate) {
        this.name = name
        this.address = address
        def calendar = new GregorianCalendar()
        calendar.setTime(birthDate)
        def year = calendar.get(Calendar.YEAR)
        def month = calendar.get(Calendar.MONTH) + 1
        def day = calendar.get(Calendar.DAY_OF_MONTH)
        this.birthDate = "${year}-${month}-${day}"
    }

    @Override
    String toString() {
        return "{ Person: { Id: ${id}, Name: ${name}, Address: ${address}, BirthDate: ${birthDate} } }"
    }
}
