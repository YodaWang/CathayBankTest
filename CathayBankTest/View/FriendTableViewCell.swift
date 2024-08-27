//
//  FriendTableViewCell.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/25.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var isTopIcon: UIImageView!
    
    @IBOutlet weak var transferButton: CellRightButton!
    
    @IBOutlet weak var invitingButton: CellRightButton!
    
    @IBOutlet weak var moreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension FriendTableViewCell {
    func setContent(with friend:Friend){
        self.nameLabel.text = friend.name
        self.isTopIcon.isHidden = (friend.isTop != "1")
        switch friend.status {
        case .finish :
            self.invitingButton.isHidden = true
            self.moreButton.isHidden = false
            break
        case .inviting :
            self.invitingButton.isHidden = false
            self.moreButton.isHidden = true
            break
        default :
            self.invitingButton.isHidden = false
            self.moreButton.isHidden = false
            break
        }
        
    }
}
