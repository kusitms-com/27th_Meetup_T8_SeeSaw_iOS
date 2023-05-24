//
//  GetProjectDetailInfoResponse.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/24.
//

import Foundation

struct GetProjectDetailInfoResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ProjectDetailInfo
}

struct ProjectDetailInfo: Codable, Hashable {
    var projectId: Int = 0
    var projectName: String = ""
    var intensity: String = ""
    var goal: String = ""
    var startedAt: String = ""
    var endedAt: String = ""
    var progressRate: Double = 0.0
    var isHalfProgressed: Bool = false
    var middleRemembranceId: Int = 0
    var isFinished: Bool = false
    var finalRemembranceId: Int = 0
    var valueId: Int = 0
    var valueName: String = ""
    var likeCnt: Int = 0
    var niceCnt: Int = 0
    var idkCnt: Int = 0
    var angryCnt: Int = 0
    var sadCnt: Int = 0
}
