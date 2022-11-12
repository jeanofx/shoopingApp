package com.shooping.ecommerce.service.service;

import com.shooping.ecommerce.service.entity.Usuario;
import com.shooping.ecommerce.service.repository.UsuarioRepository;
import com.shooping.ecommerce.service.utlis.GenericResponse;
import com.shooping.ecommerce.service.utlis.Global;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Optional;

@Service
@Transactional
public class UsuarioService {
    private final UsuarioRepository repository;

    public UsuarioService(UsuarioRepository repository) {
        this.repository = repository;
    }
    //Método para iniciar sesión
    public GenericResponse<Usuario> login(String email, String pass){
        Optional<Usuario> optU = this.repository.login(email, pass);
        if(optU.isPresent()){
            return new GenericResponse<Usuario>(Global.TIPO_AUTH, Global.RPTA_OK, "Credenciales correctas", optU.get());
        }else{
            return new GenericResponse<Usuario>(Global.TIPO_AUTH, Global.RPTA_WARNING, "Lo sentimos, ese usuario no existe", new Usuario());
        }
    }
    //Método para guardar credenciales del usuario
    public GenericResponse guardarUsuario(Usuario u){
        Optional<Usuario> optU = this.repository.findById(u.getId());
        int idf = optU.isPresent() ? optU.get().getId() : 0;
        if(idf == 0){
            return new GenericResponse(Global.TIPO_DATA, Global.RPTA_OK, "Usuario Registrado Correctamente", this.repository.save(u));
        }else{
            return new GenericResponse(Global.TIPO_DATA, Global.RPTA_OK, "Datos del usuario actualizados", this.repository.save(u));
        }
    }
}
