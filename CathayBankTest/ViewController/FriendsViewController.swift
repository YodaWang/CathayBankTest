//
//  FriendsViewController.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/22.
//

import UIKit

enum TabType {
    case Friend
    case Chat
}

class FriendsViewController: UIViewController {

    var userViewModel:UserViewModel!
    var friendsViewModel:FriendsViewModel!
    
    @IBOutlet weak var hidingConstrainy: NSLayoutConstraint!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var idButton: UIButton!
    
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var invitingListView: InvitingListView!
    
    @IBOutlet weak var friendTabButton: TabButton!
    
    @IBOutlet weak var chatTabButton: TabButton!
    
    
    let emptyViewController = EmptyFriendListViewController()
    
    let friensListTableViewController = FriendsListTableViewController()
    
    var tabType: TabType = .Friend {
        didSet {
            friendTabButton.isTabSelected = tabType == .Friend
            chatTabButton.isTabSelected = tabType == .Chat
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabType = .Friend
        chatTabButton.badgeCount = 100
        
        initNavigationItem()
        initSubViewControllers()
        
        userViewModel = UserViewModel()
        friendsViewModel = FriendsViewModel()
        
        userViewModel.onDataFetch = {[weak self] in
            self?.nameLabel.text = self?.userViewModel.user?.name
            self?.idButton.setTitle("KOKO ID:\(self?.userViewModel.user?.kokoid ?? "")", for: .normal)
        }
        friendsViewModel.onDataFetch = {[weak self] in
            self?.layountCotainer()
            self?.friensListTableViewController.list = self?.friendsViewModel.invitingAndFinshFriends ?? []
            self?.friensListTableViewController.tableView.reloadData()
            self?.friendTabButton.badgeCount = self?.friendsViewModel.invitingFriends.count ?? 0
            self?.invitingListView.list = self?.friendsViewModel.getInvitingFriends ?? []
        }
        
        userViewModel.fetchUser()
        friendsViewModel.fetchFriendsList(demoType: ApiTypeViewModel.shared.type)
        
        friensListTableViewController.header.onSearchEditingStateChang = {
            isEditing in
            self.hidingConstrainy.isActive = isEditing
        }
        friensListTableViewController.onRefresh = {
            self.friendsViewModel.fetchFriendsList(demoType: ApiTypeViewModel.shared.type)
        }
        emptyViewController.onRefresh = {
            self.friendsViewModel.fetchFriendsList(demoType: ApiTypeViewModel.shared.type)
        }
    }
    
    
    private func initNavigationItem() {
        let atmBarButtonItem = UIBarButtonItem(image: UIImage(named: "icNavPinkWithdraw"), style: .done, target: nil, action: nil)
        atmBarButtonItem.tintColor = UIColor.hotPink
        
        let transferBarButtonItem = UIBarButtonItem(image: UIImage(named: "icNavPinkTransfer"), style: .done, target: nil, action: nil)
        transferBarButtonItem.tintColor = UIColor.hotPink
        
        let scanBarButtonItem = UIBarButtonItem(image: UIImage(named: "icNavPinkScan"), style: .done, target: nil, action: nil)
        scanBarButtonItem.tintColor = UIColor.hotPink
        
        self.navigationItem.leftBarButtonItems = [atmBarButtonItem,transferBarButtonItem]
        self.navigationItem.rightBarButtonItems = [scanBarButtonItem]
        self.navigationController?.navigationBar.backgroundColor = UIColor.whiteTwo
    }
    private func initSubViewControllers() {
        addChild(emptyViewController)
        addChild(friensListTableViewController)
        
        let emptyView = emptyViewController.view!
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(emptyView)
        containerView.topAnchor.constraint(equalTo: emptyView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: emptyView.bottomAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: emptyView.rightAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: emptyView.leftAnchor).isActive = true
        
        let listView = friensListTableViewController.view!
        listView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(listView)
        containerView.topAnchor.constraint(equalTo: listView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: listView.bottomAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: listView.rightAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: listView.leftAnchor).isActive = true
        
        friensListTableViewController.view.isHidden = true
        emptyViewController.view.isHidden = true
    }
    private func layountCotainer() {
        if friendsViewModel.invitingAndFinshFriends.isEmpty {
            friensListTableViewController.view.isHidden = true
            emptyViewController.view.isHidden = false
        }
        else {
            emptyViewController.view.isHidden = true
            friensListTableViewController.view.isHidden = false
        }
    }

}
