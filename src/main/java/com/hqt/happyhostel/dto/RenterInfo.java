package com.hqt.happyhostel.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RenterInfo {
    private Information information;
    private String parentName;
    private String parentPhone;
}