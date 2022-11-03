package com.shooping.ecommerce.service.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Setter
@Getter
@Entity
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(length = 100)
    private String name;
    @Column
    private boolean vigency;
    @OneToOne
    private StorageDocument picture;


    public StorageDocument getPicture() {
        return picture;
    }

    public void setPicture(StorageDocument foto) {
        this.picture = picture;
    }
}
