//
//  ProductDetailTableViewCell.swift
//  eCommerceApp
//
//  Created by IPH Technologies Pvt. Ltd. on 11/07/23.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgProductDetailView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDetailTextView: UITextView!
    @IBOutlet weak var ratingBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productDetailTextView.showsHorizontalScrollIndicator = false
        productDetailTextView.showsVerticalScrollIndicator = false
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
