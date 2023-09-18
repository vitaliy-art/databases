using LinqToDB;
using LinqToDB.Mapping;

namespace Models;

[Table("people")]
public class Person
{
    [PrimaryKey, Column("id"), DataType(dataType: DataType.Text)]
    public Guid Id { get; set; }

    [Column("name"), NotNull]
    public string Name { get; set; } = "";

    [Column("address"), NotNull]
    public string Address { get; set; } = "";

    [Column("birth_date"), NotNull]
    public DateOnly BirthDate { get; set; }

    public Person()
    {
        Id = Guid.NewGuid();
    }

    public override string ToString() => $"{{ Person: {{ Id: {Id}, Name: {Name}, Address: {Address}, BirthDate: {BirthDate:yyyy-MM-dd} }} }}";
}
