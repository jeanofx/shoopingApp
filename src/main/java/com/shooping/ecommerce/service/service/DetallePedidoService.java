package com.shooping.ecommerce.service.service;

import com.shooping.ecommerce.service.entity.DetallePedido;
import com.shooping.ecommerce.service.repository.OrderDetailRepository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class DetallePedidoService {
    private final OrderDetailRepository repository;

    public DetallePedidoService(OrderDetailRepository repository) {
        this.repository = repository;
    }
    //Método para guardar detalles del pedido
    public void guardarDetalles(Iterable<DetallePedido> detalle){
        this.repository.saveAll(detalle);
    }
}
