//
//  CustomTableViewCell.swift
//  eCommerceApp
//
//  Created by IPH Technologies Pvt. Ltd. on 07/07/23.
//

import UIKit
//typealias works as a nickname for enhancing readability as now instaed of RHS we can simply use the new name given to it.
typealias DidSelectClosure = ((_ tableViewIndex: Int?, _ collectionViewIndex: Int?) -> Void)
class CustomTableViewCell: UITableViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var customCollectionView: UICollectionView!
    @IBOutlet weak var categoryLabel: UILabel!
    //MARK: Variables
    var mobileListArray = [Mobile]()
    var didSelectClosure: DidSelectClosure?
    var index: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        customCollectionView.dataSource = self
        customCollectionView.delegate = self
        customCollectionView.showsHorizontalScrollIndicator = false
        customCollectionView.showsVerticalScrollIndicator = false
        mobileListArray = Mobile.defaultMobileList()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mobileListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = customCollectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CustomCollectionViewCell
        cell.bgView.layer.cornerRadius = 10
        cell.detailView.layer.cornerRadius = 10
        cell.productImageView.image = UIImage(named: mobileListArray[indexPath.row].mobileName)
        cell.nameOfProductLabel.text = mobileListArray[indexPath.row].mobileName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("selected section \(indexPath.section) and row \(indexPath.row)")
        didSelectClosure?(index, indexPath.row)
    }
}

extension CustomTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.size.width*0.48, height:collectionView.frame.size.width*0.55)
    }
}
