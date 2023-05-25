//
//  ProjectReportViewModel.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/25.
//

import Alamofire
import Foundation
import KeychainSwift

struct GetProjectReportFirstResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ProjectReportResult
}

struct ProjectReportResult: Codable {
    let projectReportInfoDto: ProjectReportInfo
    let emotion1: String
    let emotion2: String
    let projectMiddleFinalQnaDto: ProjectMiddleFinalQna
    let todayAnswerCount: Int
    let recordAnswerCount: Int
    let simpleRecordInfo: [SimpleRecordInfo]
    let answerContentList: [AnswerContentList]
}

struct ProjectReportInfo: Codable {
    let value: String
    let projectName: String
    let startedAt: String
    let endedAt: String
    let projectIntensity: String
    let projectGoal: String
    let jointProject: [String]
}

struct ProjectMiddleFinalQna: Codable {
    let middleAnswer: String
    let finalAnswer: String
}

struct SimpleRecordInfo: Codable {
    let createdAt: String
    let content: String
}

struct AnswerContentList: Codable {
    let remembranceType: String
    let choice: Int?
    let content: String
}

class ProjectReportViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"
    
    func getProjectReportFirst(projectId: Int, completion: @escaping (ProjectReportResult) -> Void) {
        let url = "\(baseUrl)/api/project/\(projectId)/report"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetProjectReportFirstResponse.self) { response in
                switch response.result {
                case .success(let res):
                    completion(res.result)
                case .failure(let error):
                    print("DEBUG get project report 1: \(error)")
                }
            }
    }
}
