//
//  ApiResponseData.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/24.
//

import Foundation

struct ApiResponse<T:Codable> :Codable {
    var response:T?
    
    static func response(from data:Data) -> ApiResponse<T>?{
        do {
            let dataContent = try JSONDecoder().decode(self, from: data)
            return dataContent
        }
        catch {
            return nil
        }
    }
}
