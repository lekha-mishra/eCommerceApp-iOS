//
//  PaymentViewController.swift
//  eCommerceApp
//
//  Created by IPH Technologies Pvt. Ltd. on 13/07/23.
//

import UIKit

class PaymentViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var paymentTableView: UITableView!
    //MARK: Variables
    var paymentTypeListArray = [PaymentOption]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paymentTableView.delegate = self
        paymentTableView.dataSource = self
        paymentTypeListArray = PaymentOption.defaultPaymentType()        
    }
    
    //MARK: Hide Tab Bar Icon
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}

extension PaymentViewController: UITableViewDelegate, UITableViewDataSource{
    //for making custom header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        header.backgroundColor = .white
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentTypeListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paymentTableViewCell", for: indexPath) as! PaymentTableViewCell
        cell.paymentOptionLabel.text = paymentTypeListArray[indexPath.row].paymentType
    return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("you tapped in section \(indexPath.section) at row \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150
    }
}
