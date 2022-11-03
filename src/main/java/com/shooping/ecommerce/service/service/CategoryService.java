package com.shooping.ecommerce.service.service;

import com.shooping.ecommerce.service.repository.CategoryRepository;
import com.shooping.ecommerce.service.utlis.GenericResponse;
import com.shooping.ecommerce.service.utlis.Global;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class CategoryService {
    private final CategoryRepository repository;

    public CategoryService(CategoryRepository repository) {
        this.repository = repository;
    }
    public GenericResponse listarCategoriasActivas(){
        return new GenericResponse<>(Global.TIPO_DATA, Global.RPTA_OK, Global.OPERACION_CORRECTA, this.repository.listarCategoriasActivas());
    }
}
