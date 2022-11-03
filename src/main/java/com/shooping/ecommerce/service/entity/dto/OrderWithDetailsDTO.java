package com.shooping.ecommerce.service.entity.dto;

import com.shooping.ecommerce.service.entity.OrderT;
import com.shooping.ecommerce.service.entity.OrderDetail;

import java.util.ArrayList;

public class OrderWithDetailsDTO {

    private OrderT orderT;
    private Iterable<OrderDetail> orderDetails;

    public OrderWithDetailsDTO() {
        this.orderT = new OrderT();
        this.orderDetails = new ArrayList<>();
    }

    public OrderWithDetailsDTO(OrderT orderT, Iterable<OrderDetail> orderDetails) {
        this.orderT = orderT;
        this.orderDetails = orderDetails;
    }
}
