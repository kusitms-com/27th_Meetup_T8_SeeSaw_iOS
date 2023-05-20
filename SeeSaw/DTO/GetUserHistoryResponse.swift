//
//  GetUserHistoryResponse.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/21.
//

import Foundation

struct GetUserHistoryResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: UserHistory
}

struct UserHistory: Codable {
    let usingDays: Int
    let values: [String]
    
    private enum CodingKeys: String, CodingKey {
        case usingDays = "dayCount"
        case values = "valueNames"
    }
}
