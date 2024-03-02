namespace Models;

public class Employee
{
    public Guid Id { get; set; }

    public Guid PersonId { get; set; }
    public Person? Person { get; set; }

    public int DepartmentId { get; set; }
    public Department? Department { get; set; }

    public Position Position { get; set; }

    public override string ToString()
    {
        return $"Employee: {{ Id: {Id}, Person: {Person}, Department: {Department}, Position: {Position} }}";
    }
}

public enum Position { Boss, Manager, Staffer }
