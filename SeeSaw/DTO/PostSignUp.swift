//
//  PostSignUp.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/17.
//

import Foundation

struct PostSignUpResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: PostSignUpResult
}

struct PostSignUpResult: Codable {
    let agreeMarketing: String
    let nickname: String
    
    private enum CodingKeys: String, CodingKey {
        case agreeMarketing = "agreeMarketing"
        case nickname = "nickName"
    }
}

/*
 {
     "isSuccess": true,
     "code": 1000,
     "message": "요청에 성공하였습니다.",
     "result": {
         "agreeMarketing": false,
         "nickName": "하노"
     }
 }
 */
