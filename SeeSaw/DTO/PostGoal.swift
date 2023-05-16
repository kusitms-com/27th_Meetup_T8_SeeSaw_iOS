//
//  PostGoal.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/15.
//

import Foundation

struct PostGoalResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Int
}
