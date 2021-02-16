//
//  OrdersTableViewCell.swift
//  DookanAssignment
//
//  Created by Ankit Bansal on 10/02/21.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {
    
    // MARK: Cell Interface Builder Outlets
    
    @IBOutlet weak var orderIdLbl: UILabel!
    @IBOutlet weak var orderDateLbl: UILabel!
    @IBOutlet weak var ordersItemLbl: UILabel!
    @IBOutlet weak var orderCostLbl: UILabel!
    @IBOutlet weak var paymentStatusLbl: UILabel!
    
    @IBOutlet weak var cancelOrderBtn: UIButton!
    @IBOutlet weak var shipOrderBtn: UIButton!
    
    // MARK: Display Cell Data
    
    override func awakeFromNib() {
        cancelOrderBtn.layer.borderColor = AppColors.cherryRedColor.cgColor
        cancelOrderBtn.setValue("Cancel order", AppColors.cherryRedColor, 14, AppFont.regularFont)
        shipOrderBtn.setValue("Ship order", AppColors.whiteColor2, 14, AppFont.regularFont)
        shipOrderBtn.backgroundColor = AppColors.dustyOrangeColor
    }
    
    func setupCellData(_ orderInfo: OrderInfo) {
        orderIdLbl.setValue(orderInfo.orderId, AppColors.darkColor, 14, AppFont.mediumFont)
        orderDateLbl.setValue(orderInfo.orderDate, AppColors.warmGreyColor, 13, AppFont.regularFont)
        ordersItemLbl.setValue(orderInfo.orderItem, AppColors.warmGreyColor, 13, AppFont.regularFont)
        orderCostLbl.setValue(orderInfo.orderCost, AppColors.niceBlueColor, 15, AppFont.mediumFont)
        
        if orderInfo.orderPaymentStatus == "COD" {
            paymentStatusLbl.textColor = AppColors.dustyOrangeColor
            paymentStatusLbl.backgroundColor = AppColors.dustyOrangeColor2
        } else {
            paymentStatusLbl.textColor = AppColors.cherryRedColor
            paymentStatusLbl.backgroundColor = AppColors.cherryRedColor2
        }
        
        paymentStatusLbl.setValue(orderInfo.orderPaymentStatus, nil, 14, AppFont.mediumFont)
    }
    
}
