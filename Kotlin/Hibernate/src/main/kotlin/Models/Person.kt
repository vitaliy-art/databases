package Models

import jakarta.persistence.*

@Entity
@Table(name = "people")
open class Person(
    @Column(nullable = false)
    open var name: String? = null,

    @Column(nullable = false)
    open var address: String? = null,

    @Column(nullable = false, name = "birth_date")
    open var birthDate: String? = null
) {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    open var id: String? = null

    override fun toString(): String = "{ Person: { Id: ${id}, Name: $name, Address: $address, BirthDate: $birthDate } }"
}
