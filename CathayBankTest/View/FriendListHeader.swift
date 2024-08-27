//
//  FriendListHeader.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/26.
//

import UIKit

class FriendListHeader: UIView {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var onSearch:((_ searchText:String)->Void)?
    var onSearchEditingStateChang:((_ isEditing:Bool)->Void)?
    
    init() {
        super.init(frame: .zero)
        fromNib()
        searchBar.delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fromNib()
        searchBar.delegate = self
    }
}

extension FriendListHeader : UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.onSearchEditingStateChang?(true)
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.onSearchEditingStateChang?(false)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.onSearch?(searchText)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
