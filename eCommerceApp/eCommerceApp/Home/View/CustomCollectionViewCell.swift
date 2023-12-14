//
//  CustomCollectionViewCell.swift
//  eCommerceApp
//
//  Created by IPH Technologies Pvt. Ltd. on 10/07/23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var bgView: UIView!    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var nameOfProductLabel: UILabel!
    @IBOutlet weak var priceOfProductLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
}
