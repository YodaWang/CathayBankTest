//
//  EmptyFriendListViewController.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/25.
//

import UIKit

class EmptyFriendListViewController: UIViewController {

    var onRefresh:(()->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Bundle.main.loadNibNamed("EmptyFriendListViewController", owner: self, options: nil)
    }
    
    
    @IBAction func onButtonClick(_ sender: Any) {
        onRefresh?()
    }
    
}
