//
//  CellRightButton.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/26.
//

import UIKit

class CellRightButton: UIButton {

    override  func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 2.0
        self.layer.borderColor = self.configuration?.baseForegroundColor?.cgColor
        self.configuration?.titlePadding = 0
        self.configuration?.contentInsets = NSDirectionalEdgeInsets(top: -4, leading: 0, bottom: -4, trailing: 0)
    }

}
