package com.shooping.ecommerce.service.entity.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.shooping.ecommerce.service.entity.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderCreateDTO {
    private OrderT orderT;
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private Iterable<OrderDetail> orderDetails;
    private Customer customer;

    public OrderCreateDTO() {
    }

}
