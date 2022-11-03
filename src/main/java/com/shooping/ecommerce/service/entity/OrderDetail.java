package com.shooping.ecommerce.service.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Setter
@Getter
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column
    private int cant;
    @Column
    private Double price;
    @ManyToOne
    private Platillo menu;
    @ManyToOne
    private Pedido order;
}
