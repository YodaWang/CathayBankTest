//
//  ApiTypeViewModel.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/27.
//

import Foundation

class ApiTypeViewModel {
    private static var viewModel:ApiTypeViewModel?
    static var shared:ApiTypeViewModel {
        get {
            
            guard let viewModel else {
                self.viewModel = ApiTypeViewModel()
                return self.viewModel!
            }
            return viewModel
        }
    }
    var type:DemoType = .HasNoFriend
}
