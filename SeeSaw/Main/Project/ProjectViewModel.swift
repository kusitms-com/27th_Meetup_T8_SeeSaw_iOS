//
//  ValueViewModel.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/23.
//

import Alamofire
import Foundation
import KeychainSwift

class ProjectViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"

    func getProgressProject(completion: @escaping ([ProgressCompleteProject]) -> Void) {
        let url = "\(baseUrl)/api/project/progress"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetProgressProjectResponse.self) { response in
                switch response.result {
                case .success(let res):
                    let progressProject = res.result
                    completion(progressProject)
                case .failure(let error):
                    print("DEBUG Api-getValues: \(error)")
                }
            }
    }
    func getCompleteProject(completion: @escaping ([ProgressCompleteProject]) -> Void) {
        let url = "\(baseUrl)/api/project/complete"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetCompleteProjectResponse.self) { response in
                switch response.result {
                case .success(let res):
                    let completeProject = res.result
                    completion(completeProject)
                case .failure(let error):
                    print("DEBUG Api-getValues: \(error)")
                }
            }
    }
    func getTodayReviewQuestion(completion: @escaping(Int, String) -> Void) {
        let url = "\(baseUrl)/api/project/question"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetTodayReviewQuestionResponse.self) { response in
                switch response.result {
                case .success(let res):
                    let contents = res.contents
                    let questionId = res.id
                    completion(questionId, contents)
                case .failure(let error):
                    print("DEBUG Api-getValues: \(error)")
                }
            }
    }
    func getProgressCompleteCount(completion: @escaping(Int, Int) -> Void) {
        let url = "\(baseUrl)/api/project/count"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetProgressCompleteCountResponse.self) { response in
                switch response.result {
                case .success(let res):
                    let progress = res.result.progressCount
                    let complete = res.result.completeCount
                    completion(progress, complete)
                case .failure(let error):
                    print("DEBUG Api-getValues: \(error)")
                }
            }
    }
}

struct GetProgressProjectResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [ProgressCompleteProject]
}

struct GetTodayReviewQuestionResponse: Codable {
    let id: Int
    let contents: String
}

struct GetProgressCompleteCountResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ProgressCompleteCount
}

struct ProgressCompleteCount: Codable {
    let progressCount: Int
    let completeCount: Int
}
