//
//  InvitingCollectionViewCell.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/26.
//

import UIKit

class InvitingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cardBackground: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var name:String? {
        didSet {
            nameLabel.text = name
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardBackground.layer.shadowColor = UIColor.black.cgColor
        cardBackground.layer.shadowRadius = 8.0
        cardBackground.layer.shadowOpacity = 0.1
        cardBackground.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        cardBackground.layer.cornerRadius = 6.0
        self.clipsToBounds = false
    }

}
