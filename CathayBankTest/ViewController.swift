//
//  ViewController.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/20.
//

import UIKit

class ViewController: UITabBarController {

    let kokoButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Default
        let appearance = UITabBarAppearance()
        
        // normal
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor:UIColor.lightGray]
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.lightGray
        
        // selected
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor:UIColor.hotPink]
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.hotPink
        
        tabBar.standardAppearance = appearance
        
        kokoButton.setImage(UIImage.icTabbarHomeOff, for: .normal)
        kokoButton.configuration = .plain()
        self.view.addSubview(kokoButton)
        tabBar.layer.borderColor = UIColor.veryLightPink.cgColor
        tabBar.layer.borderWidth = 1.0
        kokoButton.translatesAutoresizingMaskIntoConstraints = false
        kokoButton.widthAnchor.constraint(equalToConstant: 85.0).isActive = true
        kokoButton.heightAnchor.constraint(equalToConstant: 68.0).isActive = true
        kokoButton.bottomAnchor.constraint(equalTo: tabBar.safeAreaLayoutGuide.bottomAnchor,constant: 6.0).isActive = true
        kokoButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor).isActive = true
    }


}

