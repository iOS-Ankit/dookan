//
//  DashboardViewModel.swift
//  DookanAssignment
//
//  Created by Ankit Bansal on 10/02/21.
//

import Foundation

class DashboardViewModel {
    
    func fetchOrders(_ completion: @escaping ([OrderInfo], [DeliveryStatus]) -> ()){
        let data = setupData()
        completion(data.0, data.1)
    }
    
    private func setupData() -> ([OrderInfo], [DeliveryStatus] ) {
        
        // ORDERS Tableview Data
        
        var ordersList = [OrderInfo]()
        
        ordersList.append(OrderInfo(orderId: "Order #291211", orderDate: "Today, 09:00 AM", orderItem: "1 ITEM", orderCost: "₹10", orderPaymentStatus: "COD"))
        ordersList.append(OrderInfo(orderId: "Order #291212", orderDate: "Today, 09:30 AM", orderItem: "2 ITEMS", orderCost: "₹20", orderPaymentStatus: "PAID"))
        ordersList.append(OrderInfo(orderId: "Order #291213", orderDate: "Today, 10:00 AM", orderItem: "3 ITEMS", orderCost: "₹30", orderPaymentStatus: "COD"))
        ordersList.append(OrderInfo(orderId: "Order #291214", orderDate: "Today, 10:30 AM", orderItem: "4 ITEMS", orderCost: "₹40", orderPaymentStatus: "PAID"))
        ordersList.append(OrderInfo(orderId: "Order #291215", orderDate: "Today, 11:00 AM", orderItem: "5 ITEMS", orderCost: "₹50", orderPaymentStatus: "COD"))
        ordersList.append(OrderInfo(orderId: "Order #291216", orderDate: "Today, 11:30 AM", orderItem: "6 ITEMS", orderCost: "₹60", orderPaymentStatus: "PAID"))
        ordersList.append(OrderInfo(orderId: "Order #291217", orderDate: "Today, 12:00 PM", orderItem: "7 ITEMS", orderCost: "₹70", orderPaymentStatus: "COD"))
        
        // DELIVERY STATUS Collectionview Data
        
        var deliveryStatusList = [DeliveryStatus]()
        
        deliveryStatusList.append(DeliveryStatus(orderStatus: "Pending", orderCount: 110, isSelected: false))
        deliveryStatusList.append(DeliveryStatus(orderStatus: "Accepted", orderCount: 120, isSelected: false))
        deliveryStatusList.append(DeliveryStatus(orderStatus: "Shipped", orderCount: 130, isSelected: false))
        
        return(ordersList, deliveryStatusList)
    }
}
