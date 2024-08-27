//
//  FriendsViewModel.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/24.
//

import Foundation
enum DemoType {
    case HasNoFriend
    case OnlyFriendList
    case WithFriendInviting
    
    var fetchApiCount:Int {
        get {
            switch self {
            case .OnlyFriendList : return 2
            default: return 1
            }
        }
    }
}

class FriendsViewModel {
    var allFriendsList:[Friend]?
    var didFetchCount:Int = 0
    var onDataFetch:(()->Void)?
    
    var getInvitingFriends:[Friend] {
        get {
            guard let getInvitingFriends = allFriendsList?.filter({ friend in
                return friend.status == .getInviting
            }) else { return [] }
            return getInvitingFriends
        }
    }
    
    var invitingAndFinshFriends:[Friend] {
        get {
            guard let invitingAndFinshFriends = allFriendsList?.filter({ friend in
                return friend.status == .inviting || friend.status == .finish
            }) else { return [] }
            return invitingAndFinshFriends
        }
    }
    
    var invitingFriends:[Friend] {
        get {
            guard let invitingAndFinshFriends = allFriendsList?.filter({ friend in
                return friend.status == .inviting
            }) else { return [] }
            return invitingAndFinshFriends
        }
    }
    
    func fetchFriendsList(demoType:DemoType = .OnlyFriendList) {
        
        allFriendsList = nil
        didFetchCount = 0
        
        switch demoType {
        case .HasNoFriend:
            URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://dimanyen.github.io/friend4.json")!)) { [weak self] data, response, error in
                if let data,
                   let content = ApiResponse<[Friend]>.response(from: data) {
                    
                    self?.allFriendsList = content.response
                    self?.didFetchCount += 1
                    if self?.didFetchCount == demoType.fetchApiCount {
                        DispatchQueue.main.async {
                            self?.onDataFetch?()
                        }
                        
                    }
                }
            }.resume()
            break
        case .OnlyFriendList:
            URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://dimanyen.github.io/friend1.json")!)) { [weak self] data, response, error in
                if let data,
                   let content = ApiResponse<[Friend]>.response(from: data) {
                    
                    if let currentList = self?.allFriendsList {
                        self?.allFriendsList = currentList.merge(friends: content.response ?? [])
                    }
                    else {
                        self?.allFriendsList = content.response
                    }
                    
                    self?.didFetchCount += 1
                    if self?.didFetchCount == demoType.fetchApiCount {
                        DispatchQueue.main.async {
                            self?.onDataFetch?()
                        }
                    }
                }
            }.resume()
            
            URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://dimanyen.github.io/friend2.json")!)) { [weak self] data, response, error in
                if let data,
                   let content = ApiResponse<[Friend]>.response(from: data) {
                    
                    if let currentList = self?.allFriendsList {
                        self?.allFriendsList = currentList.merge(friends: content.response ?? [])
                    }
                    else {
                        self?.allFriendsList = content.response
                    }
                    
                    self?.didFetchCount += 1
                    if self?.didFetchCount == demoType.fetchApiCount {
                        DispatchQueue.main.async {
                            self?.onDataFetch?()
                        }
                    }
                }
            }.resume()
            break
        case .WithFriendInviting:
            URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://dimanyen.github.io/friend3.json")!)) {[weak self] data, response, error in
                if let data,
                   let content = ApiResponse<[Friend]>.response(from: data) {
                    
                    self?.allFriendsList = content.response
                    self?.didFetchCount += 1
                    if self?.didFetchCount == demoType.fetchApiCount {
                        DispatchQueue.main.async {
                            self?.onDataFetch?()
                        }
                    }
                }
            }.resume()
            break
        }
        
    }
}
