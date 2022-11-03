package com.shooping.ecommerce.service.controller;

import com.shooping.ecommerce.service.service.MenuService;
import com.shooping.ecommerce.service.utlis.GenericResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/platillo")
public class PlatilloController {
    private final MenuService service;

    public PlatilloController(MenuService service) {
        this.service = service;
    }

    @GetMapping
    public GenericResponse listarPlatillosRecomendados(){
        return this.service.listarPlatillosRecomendados();
    }
    @GetMapping("/{idC}")
    public GenericResponse listarPlatillosPorCategoria(@PathVariable int idC){
        return this.service.listarPlatillosPorCategoria(idC);
    }
}
