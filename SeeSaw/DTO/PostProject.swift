//
//  PostProject.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/25.
//

import Foundation

struct PostProjectResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: PostProject
}

struct PostProject: Codable {
    let valueId: Int
    let projectName: String
    let startedAt: String
    let endedAt: String
    let intensity: String
    let goal: String
    let isFinished: Bool
}
