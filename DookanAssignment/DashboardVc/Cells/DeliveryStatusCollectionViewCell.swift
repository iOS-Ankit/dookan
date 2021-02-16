//
//  DeliveryStatusCollectionViewCell.swift
//  DookanAssignment
//
//  Created by Ankit Bansal on 10/02/21.
//

import UIKit

class DeliveryStatusCollectionViewCell: UICollectionViewCell {
    
    // MARK: Cell Interface Builder Outlets
    
    @IBOutlet weak var orderInfoLbl: UILabel!
    
    // MARK: Display Cell Data
    
    func setupCellData(_ deliveryInfo: DeliveryStatus) {
        if deliveryInfo.isSelected {
            self.backgroundColor = AppColors.niceBlueColor
            self.orderInfoLbl.textColor = AppColors.whiteColor
        } else {
            self.backgroundColor = AppColors.whiteTwoColor
            self.orderInfoLbl.textColor = AppColors.warmGreyColor
        }
        
        let completeText = "\(deliveryInfo.orderStatus) \(deliveryInfo.orderCount)"
        orderInfoLbl.setValue(completeText, nil, 14, AppFont.mediumFont)
    }
}
