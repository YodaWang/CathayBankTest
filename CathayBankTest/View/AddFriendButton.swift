//
//  AddFriendButton.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/25.
//

import UIKit

class AddFriendButton: UIButton {
    
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    private func initView() {
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let leftColor = UIColor.frogGreen.cgColor
        let rightColor = UIColor.booger.cgColor
        gradientLayer.colors = [leftColor,rightColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = self.bounds
        gradientLayer.opacity = 1.0
        gradientLayer.cornerRadius = self.bounds.height / 2
        self.layer.insertSublayer(gradientLayer, at: 1)
        self.layer.shadowColor = UIColor.appleGreen.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 4.0
        self.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
