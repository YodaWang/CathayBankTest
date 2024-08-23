//
//  ViewController.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/20.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Default
        let appearance = UITabBarAppearance()
        
        // normal
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor:UIColor.lightGray]
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.lightGray
        
        // selected
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor:UIColor.hotPink]
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.hotPink
        
        tabBar.standardAppearance = appearance
    }


}

