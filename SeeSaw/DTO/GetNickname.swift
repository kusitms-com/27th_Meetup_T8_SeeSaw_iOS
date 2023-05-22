//
//  GetNickname.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/22.
//

import Foundation

struct GetNicknameResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: String
}
