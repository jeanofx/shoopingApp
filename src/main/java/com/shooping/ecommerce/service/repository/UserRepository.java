package com.shooping.ecommerce.service.repository;

import com.shooping.ecommerce.service.entity.Usuario;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface UserRepository extends CrudRepository<Usuario, Integer> {
    @Query("SELECT U FROM Usuario U WHERE U.email=:correo AND U.clave=:password")
    Optional<Usuario> login(String correo, String password);
}
