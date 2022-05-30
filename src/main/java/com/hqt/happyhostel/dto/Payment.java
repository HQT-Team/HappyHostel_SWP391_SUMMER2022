package com.hqt.happyhostel.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
    int paymentID;
    String paymentDate;
    String paymentMethod;
    int invoiceID;
}