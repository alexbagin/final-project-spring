package com.example.finalproject.controllers;

import com.example.finalproject.enumm.Status;
import com.example.finalproject.models.*;
import com.example.finalproject.repositories.CategoryRepository;
import com.example.finalproject.repositories.OrderPersonRepository;
import com.example.finalproject.repositories.OrderRepository;
import com.example.finalproject.repositories.PersonRepository;
import com.example.finalproject.services.OrderPersonService;
import com.example.finalproject.services.OrderService;
import com.example.finalproject.services.PersonService;
import com.example.finalproject.services.ProductService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;
import java.util.UUID;

@Controller
public class AdminController {

    private final ProductService productService;
    private final PersonService personService;
    private final OrderService orderService;

    private final OrderPersonService orderPersonService;

    @Value("${upload.path}")
    private String uploadPath;

    private final CategoryRepository categoryRepository;
    private final PersonRepository personRepository;
    private final OrderRepository orderRepository;
    private final OrderPersonRepository orderPersonRepository;

    List<Status> status = new ArrayList<>(EnumSet.allOf(Status.class));
    public AdminController(ProductService productService, PersonService personService, OrderService orderService, OrderPersonService orderPersonService, CategoryRepository categoryRepository, PersonRepository personRepository, OrderRepository orderRepository, OrderPersonRepository orderPersonRepository) {
        this.productService = productService;
        this.personService = personService;
        this.orderService = orderService;
        this.orderPersonService = orderPersonService;
        this.categoryRepository = categoryRepository;
        this.personRepository = personRepository;
        this.orderRepository = orderRepository;
        this.orderPersonRepository = orderPersonRepository;
    }

    @GetMapping("/admin")
    public String admin(Model model){
        model.addAttribute("users", personRepository.findAll());
        model.addAttribute("products", productService.getAllProduct());
        return "admin";
    }

    @GetMapping("/admin/view_orders/{id}")
    public String viewOrdersByPerson(@PathVariable("id") int id, Model model){
        model.addAttribute("users", personRepository.findAll());
        model.addAttribute("products", productService.getAllProduct());
        model.addAttribute("orders", orderPersonRepository.findOrdersByPersonId(id));
        model.addAttribute("status", status);
        return "admin";
    }
    @PostMapping("/admin/view_orders/{id}")
    public String editOrderPerson(@ModelAttribute("orderperson") @Valid OrderPerson orderPerson, @PathVariable("id") int id, @RequestParam("status") String status, @RequestParam("order_number") String orderNumber, @RequestParam("order_id") String idOrder){
        OrderPerson orderPerson1 = orderPersonRepository.findOrderById(Integer.parseInt(idOrder));
        orderPerson1.setStatus(Status.valueOf(status));
        orderPerson1.setNumber(orderNumber);
        orderPersonRepository.save(orderPerson1);
        return "redirect:/admin/view_orders/{id}";
    }
    @PostMapping("/admin/view_orders/search_order")
    public String searchOrderByLastChars(Model model, @RequestParam("search_order") String searchOrder){
        model.addAttribute("users", personRepository.findAll());
        model.addAttribute("products", productService.getAllProduct());
        model.addAttribute("orders_find",orderPersonService.findByNumberEndingWithIgnoreCase(searchOrder));
        return "admin";
    }
    @GetMapping("/admin/view_orders/admin/view_orders/admin/delete_order/{idOrder}")
    public String deletePersonOrderById(@PathVariable("idOrder") int idOrder, Model model){
        orderPersonRepository.deletePersonOrderById(idOrder);
        return "redirect:/admin";
    }
    @GetMapping("/admin/edit_person/{id}")
    public String changeRoleById(@PathVariable("id") int id, Model model){
        Person person = personService.getPersonId(id);
        String role_person = person.getRole();
        if (!person.getLogin().equals("admin")) {
            if (!role_person.equals("ROLE_USER")) {
                role_person = "ROLE_USER";
            } else {
                role_person = "ROLE_ADMIN";
            }
        }
        person.setRole(role_person);
        personRepository.save(person);
        model.addAttribute("person");
        return "redirect:/admin";
    }

    @GetMapping("admin/product/add")
    public String addProduct(Model model){
        model.addAttribute("product", new Product());
        model.addAttribute("category", categoryRepository.findAll());
        return "product/addProduct";
    }
    @PostMapping("/admin/product/add")
    public String addProduct(@ModelAttribute("product") @Valid Product product, BindingResult bindingResult, @RequestParam("file_one")MultipartFile file_one, @RequestParam("file_two")MultipartFile file_two, @RequestParam("file_three")MultipartFile file_three, @RequestParam("file_four")MultipartFile file_four, @RequestParam("file_five")MultipartFile file_five, @RequestParam("category") int category, Model model) throws IOException {
        Category category_db = (Category) categoryRepository.findById(category).orElseThrow();
        System.out.println(category_db.getName());
        if (bindingResult.hasErrors()){
            model.addAttribute("category",categoryRepository.findAll());
            return "product/addProduct";
        }
        if(file_one != null){
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file_one.getOriginalFilename();
            file_one.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);
        }
        if(file_two != null){
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file_two.getOriginalFilename();
            file_two.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);
        }
        if(file_three != null){
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file_three.getOriginalFilename();
            file_three.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);
        }
        if(file_four != null){
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file_four.getOriginalFilename();
            file_four.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);
        }
        if(file_five != null){
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file_five.getOriginalFilename();
            file_five.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);
        }

        productService.saveProduct(product, category_db);
        return "redirect:/admin";
    }

    @GetMapping("admin/product/delete/{id}")
    public String deleteProduct(@PathVariable("id") int id){
        productService.deleteProduct(id);
        return "redirect:/admin";
    }
    @GetMapping("admin/product/edit/{id}")
    public String editProduct(Model model,@PathVariable("id") int id){
        model.addAttribute("product",productService.getProductId(id));
        model.addAttribute("category",categoryRepository.findAll());
        return "product/editProduct";
    }
    @PostMapping("admin/product/edit/{id}")
    public String editProduct(@ModelAttribute("product") @Valid Product product, BindingResult bindingResult, @PathVariable("id") int id, Model model){
        if (bindingResult.hasErrors()){
            model.addAttribute("category",categoryRepository.findAll());
            return "product/editProduct";
        }
        productService.updateProduct(id, product);
        return "redirect:/admin";
    }


}