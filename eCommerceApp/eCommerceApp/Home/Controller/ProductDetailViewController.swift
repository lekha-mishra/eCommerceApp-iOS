//
//  ProductDetailViewController.swift
//  eCommerceApp
//
//  Created by IPH Technologies Pvt. Ltd. on 10/07/23.
//

import UIKit

class ProductDetailViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var productdetailTableView: UITableView!
    @IBOutlet weak var buyNowButton: UIButton!
    @IBOutlet weak var productDetailLabel: UILabel!
    //MARK: Varibales
    let screenRect = UIScreen.main.bounds
    let font = UIFont(name: "Helvetica", size: 20.0)
    var heightLabel = 852
    //array to store the image displayed in the colletionView cell inside tableView cell
    var storeImageArray = [UIImage]()
    var storeProductNameArray = [String]()
    var storeProductPriceArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productdetailTableView.delegate = self
        productdetailTableView.dataSource = self
        setupUI()
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
    
    func setupUI(){
        if screenRect.size.width <= 380{
            productDetailLabel.isHidden = true
            
        }
        let deviceType = UIDevice().name
        if deviceType.contains("iPad") {
            productDetailLabel.isHidden = true
        }
        productdetailTableView.showsHorizontalScrollIndicator = false
        productdetailTableView.showsVerticalScrollIndicator = false
    }
 
    @IBAction func buyProductAction(_ sender: UIButton) {
        if let vc = self.storyboard?.instantiateViewController(identifier: "PurchaseProductViewController") as? PurchaseProductViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productDetailCell", for: indexPath) as! ProductDetailTableViewCell
        cell.ratingBackgroundView.layer.borderWidth = 1
        cell.ratingBackgroundView.layer.borderColor = UIColor.opaqueSeparator.cgColor
        cell.productDetailTextView.text  = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Why do we use it?It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text."
            cell.productDetailTextView.sizeToFit()
            cell.productImageView.image = storeImageArray[0]
            cell.productNameLabel.text = storeProductNameArray[0]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return screenRect.size.height + screenRect.size.height/2
    }
}
