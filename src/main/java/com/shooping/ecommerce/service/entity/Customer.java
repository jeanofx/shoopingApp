package com.shooping.ecommerce.service.entity;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Setter
@Getter
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(length = 100)
    private String name;
    @Column(length = 100)
    private String lastName;
    @Column(length = 100)
    private String secondLastName;
    @Column(length = 20)
    private String idType;
    @Column(length = 11)
    private String idNumber;
    @Column(length = 500)
    private String address;
    @Column(length = 100)
    private String state;
    @Column(length = 100)
    private String neighborhood;
    @Column(length = 100)
    private String locality;
    @Column(length = 9)
    private String phone;
    @OneToOne
    private StorageDocument picture;


    public String FullName(){
        return this.name != null && this.lastName != null && this.secondLastName != null ?
                this.name + " " + this.lastName + " " + this.secondLastName: "-----";
    }
}
