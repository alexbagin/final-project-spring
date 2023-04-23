package com.example.finalproject.services;
import com.example.finalproject.models.OrderPerson;
import com.example.finalproject.repositories.OrderPersonRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class OrderPersonService {
    private final OrderPersonRepository orderPersonRepository;

    public OrderPersonService(OrderPersonRepository orderPersonRepository) {
        this.orderPersonRepository = orderPersonRepository;
    }
    public List<OrderPerson> getAllOrders(){
        return orderPersonRepository.findAll();
    }
    public void updateOrderPerson(int id, OrderPerson orderPerson){
        orderPerson.setId(id);
        orderPersonRepository.save(orderPerson);
    }
    public List<OrderPerson> findByNumberEndingWithIgnoreCase(String endingWith){
        return orderPersonRepository.findByNumberEndingWithIgnoreCase(endingWith);
    }

}
