package com.example.finalproject.repositories;
import com.example.finalproject.models.OrderPerson;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;


@Repository
@Transactional
public interface OrderPersonRepository extends JpaRepository<OrderPerson, Integer> {

    @Query(value = "select * from order_person where person_id = ?1", nativeQuery = true)
    List<OrderPerson> findOrdersByPersonId(int id);
    @Query(value = "select * from order_person where id = ?1", nativeQuery = true)
    OrderPerson findOrderById(int id);
    @Modifying
    @Query(value = "delete from order_person where id=?1", nativeQuery = true)
    void deletePersonOrderById(int id);

    List<OrderPerson> findByNumberEndingWithIgnoreCase(String endingWith);

}
