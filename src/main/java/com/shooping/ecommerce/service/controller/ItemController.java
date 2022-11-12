package com.shooping.ecommerce.service.controller;

import com.shooping.ecommerce.service.service.ItemService;
import com.shooping.ecommerce.service.utlis.GenericResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/item")
public class ItemController {
    private final ItemService service;

    public ItemController(ItemService service) {
        this.service = service;
    }

    @GetMapping
    public GenericResponse listarItemsRecomendados(){
        return this.service.listarItemsRecomendados();
    }
    @GetMapping("/{idC}")
    public GenericResponse listarItemsPorCategoria(@PathVariable int idC){
        return this.service.listarItemsPorCategoria(idC);
    }
}
