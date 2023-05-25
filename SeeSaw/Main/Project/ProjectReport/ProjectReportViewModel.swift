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
    let result: ProjectReportFirstResult
}

struct ProjectReportFirstResult: Codable {
    var projectReportInfoDto: ProjectReportInfo
    var emotion1: String
    var emotion2: String
    var projectMiddleFinalQnaDto: ProjectMiddleFinalQna
    var todayAnswerCount: Int
    var recordAnswerCount: Int
    var simpleRecordInfo: [SimpleRecordInfo]
    var answerContentList: [AnswerContentList]
}

struct ProjectReportInfo: Codable, Hashable {
    var value: String = ""
    var projectName: String = ""
    var startedAt: String = ""
    var endedAt: String = ""
    var projectIntensity: String = ""
    var projectGoal: String = ""
    var jointProject: [String] = []
}

struct ProjectMiddleFinalQna: Codable, Hashable {
    var middleAnswer: String = ""
    var finalAnswer: String = ""
}

struct SimpleRecordInfo: Codable {
    var createdAt: String
    var content: String
}

struct AnswerContentList: Codable {
    var remembranceType: String
    var choice: Int?
    var content: String
}


class ProjectReportViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"
    
    func getProjectReportFirst(projectId: Int, completion: @escaping (ProjectReportFirstResult) -> Void) {
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
    
    func getProjectReportSecond(projectId: Int, completion: @escaping (ProjectReportSecondResult) -> Void) {
        let url = "\(baseUrl)/api/project/\(projectId)/report/battery"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetProjectReportSecondResponse.self) { response in
                switch response.result {
                case .success(let res):
                    completion(res.result)
                case .failure(let error):
                    print("DEBUG get project report 2: \(error)")
                }
            }
    }
}
struct GetProjectReportSecondResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ProjectReportSecondResult
}

struct ProjectReportSecondResult: Codable {
    var energyReport: EnergyReport
    var chargeReport: ChargeReport
    var healthReport: HealthReport
}

struct EnergyReport: Codable {
    var avg: Int
    var max: Int
    var min: Int
}

struct ChargeReport: Codable {
    var valueCountList: [ValueCount]
}

struct ValueCount: Codable {
    var name: String
    var count: Int
}

struct HealthReport: Codable {
    var activityAvg: Int
    var sleepAvg: Int
}
