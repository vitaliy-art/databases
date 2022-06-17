namespace Models;

public class Person
{
    public Guid Id { get; set; }
    public string? Name { get; set; }
    public string? Address { get; set; }
    public DateTime BirthDate { get; set; }

    public override string ToString()
    {
        return $"Person {{ Id: {Id}, Name: {Name}, Address: {Address}, BirthDate: {BirthDate} }}";
    }
}