package com.shooping.ecommerce.service.service;

import com.shooping.ecommerce.service.repository.ItemRepository;
import com.shooping.ecommerce.service.utlis.GenericResponse;
import com.shooping.ecommerce.service.utlis.Global;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class ItemService {
    private final ItemRepository repository;

    public ItemService(ItemRepository repository) {
        this.repository = repository;
    }
    public GenericResponse listarItemsRecomendados(){
        return new GenericResponse(Global.TIPO_DATA, Global.RPTA_OK, Global.OPERACION_CORRECTA, this.repository.listarItemsRecomendados());
    }
    public GenericResponse listarItemsPorCategoria(int idC){
        return new GenericResponse(Global.TIPO_DATA, Global.RPTA_OK, Global.OPERACION_CORRECTA, this.repository.listarItemsPorCategoria(idC));
    }
}
