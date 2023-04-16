package example.Models;

import example.Enums.Position;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "employees")
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @ManyToOne
    @JoinColumn(name = "person_id")
    // @Cascade(value = { CascadeType.ALL })
    private Person person;

    @OneToOne
    @JoinColumn(name = "department_id")
    // @Cascade(value = { CascadeType.ALL })
    private Department department;

    @Enumerated(EnumType.ORDINAL)
    private Position position;

    public Employee() {}

    public Employee(Person person, Department department, Position position) {
        this.person = person;
        this.department = department;
        this.position = position;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    @Override
    public String toString() {
        return String.format(
            "Employee: { Id: %s, Person: %s, Department: %s, Position: %s }",
            id,
            person.toString(),
            department.toString(),
            position.toString()
        );
    }
}
