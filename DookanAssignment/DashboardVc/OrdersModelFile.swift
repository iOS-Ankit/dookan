//
//  OrdersModelFile.swift
//  DookanAssignment
//
//  Created by Ankit Bansal on 10/02/21.
//

import Foundation


struct OrderInfo {
    var orderId: String
    var orderDate: String
    var orderItem: String
    var orderCost: String
    var orderPaymentStatus: String
}

struct DeliveryStatus {
    var orderStatus: String
    var orderCount: Int
    var isSelected: Bool
}
