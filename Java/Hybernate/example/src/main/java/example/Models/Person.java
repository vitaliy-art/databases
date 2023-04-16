package example.Models;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "people")
public class Person {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String address;

    @Column(name = "birth_date", nullable = false)
    private String birthDate;

    public Person() {}

    public Person(String name, String address, Date birthDate) {
        this.name = name;
        this.address = address;
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(birthDate);
        this.birthDate = String.format(
            "%s-%s-%s",
            calendar.get(Calendar.YEAR),
            calendar.get(Calendar.MONTH) + 1,
            calendar.get(Calendar.DAY_OF_MONTH)
        );
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    @Override
    public String toString() {
        return String.format(
            "Person { Id: %s, Name: %s, Address: %s, BirthDate: %s }",
            id,
            name,
            address,
            birthDate
        );
    }
}
