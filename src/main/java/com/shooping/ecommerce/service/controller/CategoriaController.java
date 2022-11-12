package com.shooping.ecommerce.service.controller;

import com.shooping.ecommerce.service.service.CategoriaService;
import com.shooping.ecommerce.service.utlis.GenericResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/categoria")
public class CategoriaController {
    private final CategoriaService service;

    public CategoriaController(CategoriaService service) {
        this.service = service;
    }

    @GetMapping
    public GenericResponse listarCategoriasActivas(){
        return this.service.listarCategoriasActivas();
    }
}
