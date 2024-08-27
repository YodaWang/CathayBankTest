//
//  FriendsListTableViewController.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/25.
//

import UIKit

class FriendsListTableViewController: UITableViewController {
    
    var list:[Friend] = [] {
        didSet {
            displatList = list
            refreshControl?.endRefreshing()
        }
    }
    var onRefresh:(()->Void)?
    
    let header = FriendListHeader()
    
    private var displatList:[Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "\(FriendTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(FriendTableViewCell.self)")
        tableView.register(UINib(nibName: "\(FriendListHeader.self)", bundle: nil), forHeaderFooterViewReuseIdentifier: "\(FriendListHeader.self)")
        
        //tableView.refreshControl = refreshControl
        self.refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action:
                                    #selector(handleRefreshControl),
                                    for: .valueChanged)
        header.onSearch = { searchText in
            if searchText.isEmpty {
                self.displatList = self.list
            }
            else {
                self.displatList = self.list.filter { friend  in
                    return friend.name.contains(searchText)
                }
            }
            self.tableView.reloadData()
        }
    }
    
    @objc func handleRefreshControl() {
        onRefresh?()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displatList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(FriendTableViewCell.self)") as? FriendTableViewCell else { return UITableViewCell()
        }
        let friend = displatList[indexPath.row]
        cell.setContent(with: friend)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return header
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
}
