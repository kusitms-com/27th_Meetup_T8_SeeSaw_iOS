//
//  PutNicknameResponse.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/21.
//

import Foundation

struct PutNicknameResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: String
}
