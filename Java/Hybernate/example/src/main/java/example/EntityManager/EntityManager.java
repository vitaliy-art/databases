package example.EntityManager;

import java.util.List;

public interface EntityManager<T> {
    void addNew(T entity);
    void saveChanges(T entity);
    List<T> getAll();
    T getById(Object id);
    void delete(T entity);
}
