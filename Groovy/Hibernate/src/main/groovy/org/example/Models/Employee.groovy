package Models

import Enums.Position
import jakarta.persistence.Entity
import jakarta.persistence.EnumType
import jakarta.persistence.Enumerated
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.JoinColumn
import jakarta.persistence.ManyToOne
import jakarta.persistence.OneToOne
import jakarta.persistence.Table

@Entity
@Table(name = "employees")
class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id

    @ManyToOne
    @JoinColumn(name = "person_id")
    Person person

    @OneToOne
    @JoinColumn(name = "department_id")
    Department department

    @Enumerated(EnumType.ORDINAL)
    Position position

    Employee() {}

    Employee(Person person, Department department, Position position) {
        this.person = person
        this.department = department
        this.position = position
    }

    @Override
    String toString() {
        return "{ Employee: { Id: ${id}, Person: ${person}, Department: ${department}, Position: ${position} } }"
    }
}
