//
//  ApiSettingViewController.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/27.
//

import UIKit

class ApiSettingViewController: UIViewController {

    var apiTypeViewModel = ApiTypeViewModel.shared
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTypeChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            apiTypeViewModel.type = .HasNoFriend
            break
        case 1:
            apiTypeViewModel.type = .OnlyFriendList
            break
        case 2:
            apiTypeViewModel.type = .WithFriendInviting
            break
        default:
            break
            
        }
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
