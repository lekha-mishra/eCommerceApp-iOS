//
//  ViewController.swift
//  eCommerceApp
//
//  Created by IPH Technologies Pvt. Ltd. on 07/07/23.
//

import UIKit

class MobileViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var textFieldAsSearchBar: UITextField!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var exploreButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bannerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bannerImageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackViewTopConstraint: NSLayoutConstraint!
    
    //MARK: Variables
    var categoryListArray = [Category]()
    var collectionViewCellIndex: Int?
    var tableViewCellIndex: Int?
    var mobileListArray = [Mobile]()
    let screenRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(screenRect.size.height) //667 //852 //1180
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
        categoryListArray = Category.defaultCategoryList()
        mobileListArray = Mobile.defaultMobileList()
    }

    @IBAction func menuBarButtonAction(_ sender: UIBarButtonItem) {
        print("Tapped the menu button")
    }
    
    @IBAction func notificationBarButtonAction(_ sender: UIBarButtonItem) {
        print("Tapped the bell icon")
    }
    
    func setupUI(){
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .clear
        if screenRect.size.height <= 700 {
            self.headerView.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height/2.0)
        }
        else if screenRect.size.height >= 1100{
            stackViewTopConstraint.constant = 130
            bannerViewHeightConstraint.constant = screenRect.size.height*0.20
            bannerImageViewTopConstraint.constant = bannerViewHeightConstraint.constant*0.001
        }
        filterButton.layer.cornerRadius = 0.5 * filterButton.bounds.size.width
        filterButton.clipsToBounds = true
        textFieldAsSearchBar.layer.cornerRadius = 15.0
        textFieldAsSearchBar.clipsToBounds = true
        bannerView.layer.cornerRadius = 15.0
        bannerView.clipsToBounds = true
        exploreButton.layer.cornerRadius = 10.0
        exploreButton.clipsToBounds = true
    }
}

extension MobileViewController: UITableViewDelegate, UITableViewDataSource{
    //for making custom header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        header.backgroundColor = .white
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.categoryLabel.text = categoryListArray[indexPath.section].categoryName
        cell.index = indexPath.section
        //for navigation to next vc used closure to access the collection view cell index and tableview cell/section index.
        cell.didSelectClosure = {tableIndex, collectionIndex in
            if let tIndex = tableIndex, let cIndex = collectionIndex {
                if let vc = self.storyboard?.instantiateViewController(identifier: "ProductDetailViewController") as? ProductDetailViewController {
                    vc.storeImageArray.append(UIImage(named: self.mobileListArray[cIndex].mobileName)! )
                    vc.storeProductNameArray.append(self.mobileListArray[cIndex].mobileName)
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("you tapped in section \(indexPath.section) at row \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 280
    }
}
