package com.shooping.ecommerce.service.controller;

import com.shooping.ecommerce.service.service.CategoryService;
import com.shooping.ecommerce.service.utlis.GenericResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/category")
public class CategoryController {
    private final CategoryService service;

    public CategoryController(CategoryService service) {
        this.service = service;
    }

    @GetMapping
    public GenericResponse listarCategoriasActivas(){
        return this.service.listarCategoriasActivas();
    }
}
