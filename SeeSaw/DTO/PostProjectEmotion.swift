//
//  PostEmotion.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/25.
//

import Foundation

struct PostProjectEmotionResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: EmotionCount
}

struct EmotionCount: Codable {
    let likeCnt: Int
    let niceCnt: Int
    let idkCnt: Int
    let angryCnt: Int
    let sadCnt: Int
}
