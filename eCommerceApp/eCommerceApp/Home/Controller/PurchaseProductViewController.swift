//
//  PurchaseProductViewController.swift
//  eCommerceApp
//
//  Created by IPH Technologies Pvt. Ltd. on 18/07/23.
//

import UIKit

class PurchaseProductViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var productDetailView: UIView!
    @IBOutlet weak var totalPaymentView: UIView!
    @IBOutlet weak var userDetailBackgroundShadowView: UIView!
    @IBOutlet weak var userDetailView: UIView!
    @IBOutlet weak var productDetailBackgroundShadowView: UIView!
    @IBOutlet weak var totalPaymentBackgroundShadowView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func setupUI(){
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        // set the corner radius
        userDetailView.layer.cornerRadius = 10.0
        userDetailView.layer.masksToBounds = true
        productDetailView.layer.cornerRadius = 10.0
        productDetailView.layer.masksToBounds = true
        totalPaymentView.layer.cornerRadius = 10.0
        totalPaymentView.layer.masksToBounds = true
        // set the shadow properties
        userDetailBackgroundShadowView.layer.shadowColor = UIColor.black.cgColor
        userDetailBackgroundShadowView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        userDetailBackgroundShadowView.layer.shadowOpacity = 0.5
        userDetailBackgroundShadowView.layer.shadowRadius = 5.0
        productDetailBackgroundShadowView.layer.shadowColor = UIColor.black.cgColor
        productDetailBackgroundShadowView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        productDetailBackgroundShadowView.layer.shadowOpacity = 0.5
        productDetailBackgroundShadowView.layer.shadowRadius = 5.0
        totalPaymentBackgroundShadowView.layer.shadowColor = UIColor.black.cgColor
        totalPaymentBackgroundShadowView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        totalPaymentBackgroundShadowView.layer.shadowOpacity = 0.5
        totalPaymentBackgroundShadowView.layer.shadowRadius = 5.0
    }
}
