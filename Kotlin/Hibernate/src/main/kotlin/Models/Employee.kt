package Models

import Enums.Position
import jakarta.persistence.*

@Entity
@Table(name = "employees")
class Employee(
    @ManyToOne
    @JoinColumn(name = "person_id")
    open var person: Person? = null,

    @OneToOne
    @JoinColumn(name = "department_id")
    open var department: Department? = null,

    @Enumerated(EnumType.ORDINAL)
    open var position: Position? = null
) {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    open var id: String? = null

    override fun toString(): String = "{ Employee: { Id: ${id}, Person: $person, Department: $department, Position: $position } }"
}
