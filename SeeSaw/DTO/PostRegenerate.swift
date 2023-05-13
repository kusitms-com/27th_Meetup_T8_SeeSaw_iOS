//
//  PostRegenerate.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/14.
//

import Foundation

struct PostRegenerateTokenRequest: Codable {
    let refreshToken: String
}

struct PostRegenerateTokenResponse: Codable {
    let accessToken: String
    let refreshToken: String
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}
