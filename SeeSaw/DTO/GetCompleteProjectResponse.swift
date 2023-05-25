//
//  GetCompleteProjectResponse.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/24.
//

import Foundation

struct GetCompleteProjectResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [ProgressCompleteProject]
}

struct ProgressCompleteProject: Codable, Hashable {
    var projectId: Int
    var projectName: String
    var startedAt: String
    var endedAt: String
    var progressRate: Double
    var intensity: String
    var valueName: String
}
