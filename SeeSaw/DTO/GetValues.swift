//
//  GetValues.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/15.
//

import Foundation

struct GetValuesResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [Value]
}

struct Value: Codable {
    let valueId: Int
    let valueName: String
}

/*
 "isSuccess": true,
     "code": 1000,
     "message": "요청에 성공하였습니다.",
     "result": [
         {
             "valueId": 6,
             "valueName": "도전"
         },
         {
             "valueId": 7,
             "valueName": "여유"
         },
         {
             "valueId": 8,
             "valueName": "사랑"
         }
     ]
 */
