//
//  PostLogin.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/14.
//

import Foundation

struct PostLoginRequest: Codable {
    let provider: String
    let idToken: String
    let accessToken: String
    let refreshToken: String
}

struct PostLoginResponse: Codable {
    let accessToken: String
    let refreshToken: String
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}

struct PostLogin409Response: Codable {
    let timestamp: String
    let status: Int
    let error: String
    let message: String
    let path: String
}
