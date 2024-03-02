namespace Models;

public class Department
{
    public int Id { get; set; }
    public string? Name { get; set; }

    public override string ToString()
    {
        return $"Department {{ Id: {Id}, Name: {Name} }}";
    }
}