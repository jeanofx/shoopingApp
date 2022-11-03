package com.shooping.ecommerce.service.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Setter
@Getter
public class Menu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(length = 100)
    private String name;
    @OneToOne
    private StorageDocument picture;
    @Column
    private Double price;
    @Column
    private int stock;
    @Column(length = 500)
    private String menuDescription;
    @OneToOne
    private Category category;
    @Column
    private boolean vigency;
    @Column
    private boolean suggest;
}
