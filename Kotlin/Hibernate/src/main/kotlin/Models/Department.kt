package Models

import jakarta.persistence.*

@Entity
@Table(name = "departments")
open class Department(
    @Column(nullable = false)
    open var name: String? = null
) {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    open var id: Long? = null

    override fun toString(): String = "{ Department: { Id: ${id}, Name: $name } }"
}
