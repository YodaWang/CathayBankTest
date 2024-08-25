//
//  UserViewModel.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/25.
//

import Foundation

class UserViewModel {
    var user:User?
    var onDataFetch:(()->Void)?
    
    func fetchUser() {
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://dimanyen.github.io/man.json")!)) { [weak self] data, response, error in
            if let data,
               let content = ApiResponse<[User]>.response(from: data) {
                
                self?.user = content.response?.first
                
                self?.onDataFetch?()
                
            }
        }.resume()
    }
}
