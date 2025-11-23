package com.ucp.backend.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VehicleDTO {
    private Long id;
    private Long ownerId;
    private String ownerName;
    private String model;
    private String color;
    private String plateNumber;
    private Long price;
    private Integer health;
    private Boolean impounded;
    private LocalDateTime purchasedAt;
}
