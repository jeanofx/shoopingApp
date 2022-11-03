package com.shooping.ecommerce.service.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Getter
@Setter
public class OrderT {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    @JsonFormat(pattern = "dd-MM-yyyy", timezone = "America/Lima")
    private Date datePurchase;
    @ManyToOne
    private Customer customer;
    @Column
    private Double amount;
    @Column
    private boolean cancelOrder;
}
