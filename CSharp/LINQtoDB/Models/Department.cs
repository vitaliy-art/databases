using LinqToDB.Mapping;

namespace Models;

[Table("departments")]
public class Department
{
    [PrimaryKey, Identity, Column("id")]
    public int Id { get; set; }

    [Column("name"), NotNull]
    public string? Name { get; set; }

    public override string ToString() => $"{{ Department: {{ Id: {Id}, Name: {Name} }} }}";
}
