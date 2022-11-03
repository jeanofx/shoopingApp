package com.shooping.ecommerce.service.service;

import com.shooping.ecommerce.service.repository.MenuRepository;
import com.shooping.ecommerce.service.utlis.GenericResponse;
import com.shooping.ecommerce.service.utlis.Global;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class MenuService {
    private final MenuRepository repository;

    public MenuService(MenuRepository repository) {
        this.repository = repository;
    }
    public GenericResponse listarPlatillosRecomendados(){
        return new GenericResponse(Global.TIPO_DATA, Global.RPTA_OK, Global.OPERACION_CORRECTA, this.repository.listarPlatillosRecomendados());
    }
    public GenericResponse listarPlatillosPorCategoria(int idC){
        return new GenericResponse(Global.TIPO_DATA, Global.RPTA_OK, Global.OPERACION_CORRECTA, this.repository.listarPlatillosPorCategoria(idC));
    }
}
