package com.example.finalproject.repositories;

import com.example.finalproject.models.Order;
import com.example.finalproject.models.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
@Transactional
public interface OrderRepository extends JpaRepository<Order, Integer> {
    List<Order> findByPerson(Person person);
    Optional<Order> findById(int id);
    List<Order> findByNumberEndingWithIgnoreCase(String endingWith);

    @Modifying
    @Query(value = "delete from orders where person_id=?1", nativeQuery = true)
    void deleteOrdersByPersonId(int id);

    @Query(value = "select * from orders where person_id = ?1", nativeQuery = true)
    List<Order> findOrdersByPersonId(int id);
}
