package com.ucp.backend.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlayerProfileDTO {
    private Long id;
    private Long userId;
    private String username;
    private String characterName;
    private Integer level;
    private Long money;
    private Integer playedHours;
    private LocalDateTime lastLogin;
    private Integer housesCount;
    private Integer vehiclesCount;
}
