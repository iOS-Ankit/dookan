//
//  DashboardViewController.swift
//  DookanAssignment
//
//  Created by Ankit Bansal on 10/02/21.
//

import UIKit

class DashboardViewController: UIViewController {
    
    // MARK: Interface Builder Outlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var marketLbl: UILabel!
    @IBOutlet weak var shareMoreLbl: UILabel!
    @IBOutlet weak var shareNoteLbl: UILabel!
    @IBOutlet weak var mailLbl: UILabel!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var overviewLbl: UILabel!
    @IBOutlet weak var lastWeekLbl: UILabel!
    @IBOutlet weak var ordersTitleLbl: UILabel!
    @IBOutlet weak var ordersValueLbl: UILabel!
    @IBOutlet weak var revenueTitleLbl: UILabel!
    @IBOutlet weak var revenueValueLbl: UILabel!
    @IBOutlet weak var storeViewsTitleLbl: UILabel!
    @IBOutlet weak var storeViewsValueLbl: UILabel!
    @IBOutlet weak var productViewsTitleLbl: UILabel!
    @IBOutlet weak var productViewsValueLbl: UILabel!
    
    @IBOutlet weak var tblHeaderView: UIView!
    
    @IBOutlet weak var activeOrdersLbl: UILabel!
    @IBOutlet weak var viewAllLbl: UILabel!
    @IBOutlet weak var tblHeaderCollectionVw: UICollectionView!
    
    @IBOutlet weak var ordersTableVw: UITableView!
    @IBOutlet weak var ordersTableVwHeightConstraint: NSLayoutConstraint!
    
    // MARK: Interface Builder Properties
    
    var ordersList = [OrderInfo]()
    var statusList = [DeliveryStatus]()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        //self.scrollView.contentInsetAdjustmentBehavior = false
        self.scrollView.contentInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        super.viewDidLoad()
        addObservers()
        setupTextAndUI()
        setupData()
    }
    
    // MARK: Setup UI
    
    func setupTextAndUI() {
        headerView.addShadow(UIColor.black.withAlphaComponent(0.06))
        marketLbl.setValue("Mano Super Market", AppColors.whiteColor, 18, AppFont.mediumFont)
        shareMoreLbl.setValue("Share More to Earn More", AppColors.darkColor, 14, AppFont.mediumFont)
        shareNoteLbl.setValue("Your customers can visit your online store and place the orders from this link.", AppColors.warmGreyColor, 13, AppFont.regularFont)
        let attributedStr = NSAttributedString(string: "mydukaan.io/mano", attributes: [NSAttributedString.Key.font: UIFont(name: AppFont.mediumFont, size: 14)!, NSAttributedString.Key.foregroundColor: AppColors.dustyOrangeColor, NSAttributedString.Key.underlineStyle: 1, NSAttributedString.Key.underlineColor: AppColors.dustyOrangeColor])
        mailLbl.attributedText = attributedStr
        overviewLbl.setValue("Overview", AppColors.darkColor, 16, AppFont.mediumFont)
        lastWeekLbl.setValue("Last Week", AppColors.warmGreyColor, 14, AppFont.regularFont)
        ordersTitleLbl.superview?.addShadow(UIColor.black.withAlphaComponent(0.06))
        ordersTitleLbl.setValue("ORDERS", AppColors.warmGreyColor, 12, AppFont.regularFont)
        ordersValueLbl.setValue("33", AppColors.darkColor, 24, AppFont.mediumFont)
        revenueTitleLbl.superview?.addShadow(UIColor.black.withAlphaComponent(0.06))
        revenueTitleLbl.setValue("REVENUE", AppColors.warmGreyColor, 12, AppFont.regularFont)
        revenueValueLbl.setValue("₹2,918", AppColors.darkColor, 24, AppFont.mediumFont)
        storeViewsTitleLbl.superview?.addShadow(UIColor.black.withAlphaComponent(0.06))
        storeViewsTitleLbl.setValue("STORE VIEWS", AppColors.warmGreyColor, 12, AppFont.regularFont)
        storeViewsValueLbl.setValue("301", AppColors.darkColor, 24, AppFont.mediumFont)
        productViewsTitleLbl.superview?.addShadow(UIColor.black.withAlphaComponent(0.06))
        productViewsTitleLbl.setValue("PRODUCT VIEWS", AppColors.warmGreyColor, 12, AppFont.regularFont)
        productViewsValueLbl.setValue("19,121", AppColors.darkColor, 24, AppFont.mediumFont)
        activeOrdersLbl.setValue("Active Orders", AppColors.darkColor, 16, AppFont.mediumFont)
        viewAllLbl.setValue("View All", AppColors.warmGreyColor, 14, AppFont.regularFont)
        ordersTableVw.tableHeaderView = self.tblHeaderView
        ordersTableVw.tableFooterView = UIView()
    }
    
    // MARK: Setup Data
    
    func setupData() {
        let vm = DashboardViewModel()
        vm.fetchOrders { (orders, deliveryStatus) in
            DispatchQueue.main.async {
                self.ordersList = orders
                self.statusList = deliveryStatus
                self.ordersTableVw.reloadData()
                self.tblHeaderCollectionVw.reloadData()
            }
        }
    }
    
    // MARK: KVO Methods
    
    func addObservers() {
        ordersTableVw.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if let obj = object as? UITableView {
            if obj == ordersTableVw && keyPath == "contentSize" {
                if (change?[NSKeyValueChangeKey.newKey] as? CGSize) != nil {
                    ordersTableVwHeightConstraint.constant =  ((change?[NSKeyValueChangeKey.newKey] as? CGSize)?.height)!
                }
            }
        }
    }
}

extension DashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersTableViewCell", for: indexPath) as! OrdersTableViewCell
        cell.setupCellData(ordersList[indexPath.row])
        return cell
    }
}

extension DashboardViewController: UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statusList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DeliveryStatusCollectionViewCell", for: indexPath) as! DeliveryStatusCollectionViewCell
        cell.setupCellData(statusList[indexPath.item])
        return cell
    }
}


extension DashboardViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for (index, _) in statusList.enumerated() {
            statusList[index].isSelected = false
        }
        statusList[indexPath.item].isSelected = true
        collectionView.reloadData()
    }
}

extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: 123, height: 32)
        return cellSize
    }
}
