package Models

import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.Table
import jakarta.persistence.Column

@Entity
@Table(name = "departments")
public class Department {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id

    @Column(nullable = false)
    String name

    public Department() {}

    Department(String name) {
        this.name = name
    }

    @Override
    String toString() {
        return "{ Department: { Id: ${id}, Name: ${name} } }"
    }
}
