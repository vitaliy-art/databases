package EntityManagers

interface EntityManager<T> {
    void addNew(T entity)
    void saveChanges(T entity)
    List<T> getAll()
    T getById(id)
    void delete(T entity)
}
