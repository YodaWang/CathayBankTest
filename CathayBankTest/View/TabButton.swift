//
//  TabButton.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/26.
//

import UIKit

class TabButton: UIButton {

    var isTabSelected:Bool = false {
        didSet {
            bar.isHidden = !isTabSelected
        }
    }
    var badgeCount:Int = 0 {
        didSet {
            badgeView.isHidden = badgeCount <= 0
            if badgeCount > 99 {
                badgeView.content = "99+"
            }
            else {
                badgeView.content = "\(badgeCount)"
            }
            
        }
    }
    let bar = UIView()
    private let badgeView = BadgeView(frame: CGRect.zero)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initBar()
        initBadge()
    }
    
    func initBar() {
        self.addSubview(bar)
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.backgroundColor = UIColor.hotPink
        self.bottomAnchor.constraint(equalTo: bar.bottomAnchor).isActive = true
        self.centerXAnchor.constraint(equalTo: bar.centerXAnchor).isActive = true
        bar.heightAnchor.constraint(equalToConstant: 4.0).isActive = true
        bar.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        bar.layer.cornerRadius = 2.0
    }
    
    func initBadge() {
        self.addSubview(badgeView)

        badgeView.translatesAutoresizingMaskIntoConstraints = false
        badgeView.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 16.0).isActive = true
        badgeView.leftAnchor.constraint(equalTo: self.rightAnchor, constant: -8.0).isActive = true
        badgeView.isHidden = true
        
    }

}

class BadgeView: UIView {

    var content:String = "" {
        didSet {
            self.label.text = content
        }
    }
    private let label:UILabel = UILabel(frame: CGRect.zero)
    override init(frame: CGRect) {
        super.init(frame: frame)
        initBackground()
        initLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initBackground()
        initLabel()
    }
    private func initBackground() {
        self.backgroundColor = UIColor.softPink
        self.layer.cornerRadius = 9.0
    }
    private func initLabel() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12.0, weight: .medium)
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 3.0).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3.0).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4.0).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4.0).isActive = true
        label.widthAnchor.constraint(greaterThanOrEqualToConstant: 10 ).isActive = true
    }

}
