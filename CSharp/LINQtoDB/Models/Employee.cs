using LinqToDB;
using LinqToDB.Mapping;

namespace Models;

[Table("employees")]
public class Employee
{
    [PrimaryKey, Column("id"), DataType(dataType: DataType.Text)]
    public Guid Id { get; set; }

    [Column("position"), DataType(dataType: DataType.Text), NotNull]
    public Position Position { get; set; }

    [Column("department_id"), NotNull]
    public int DepartmentId { get; set; }
    public Department? Department { get; set; }

    [Column("person_id"), DataType(dataType: DataType.Text), NotNull]
    public Guid PersonId { get; set; }
    public Person? Person { get; set; }

    public Employee()
    {
        Id = Guid.NewGuid();
    }

    public override string ToString() => $"{{ Employee: {{ Id: {Id}, Person: {Person}, Department: {Department}, Position: {Position} }} }}";
}

public enum Position
{
    Staffer,
    Manager,
    Boss,
}
