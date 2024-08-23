//
//  FriendsViewController.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/22.
//

import UIKit

class FriendsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let atmBarButtonItem = UIBarButtonItem(image: UIImage(named: "icNavPinkWithdraw"), style: .done, target: nil, action: nil)
        atmBarButtonItem.tintColor = UIColor.hotPink
        
        let transferBarButtonItem = UIBarButtonItem(image: UIImage(named: "icNavPinkTransfer"), style: .done, target: nil, action: nil)
        transferBarButtonItem.tintColor = UIColor.hotPink
        
        let scanBarButtonItem = UIBarButtonItem(image: UIImage(named: "icNavPinkScan"), style: .done, target: nil, action: nil)
        scanBarButtonItem.tintColor = UIColor.hotPink
        
        self.navigationItem.leftBarButtonItems = [atmBarButtonItem,transferBarButtonItem]
        self.navigationItem.rightBarButtonItems = [scanBarButtonItem]
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
