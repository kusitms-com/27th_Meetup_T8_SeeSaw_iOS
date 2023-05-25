//
//  ValueViewModel.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/23.
//

import Alamofire
import Foundation
import KeychainSwift

class MiddleFinalReviewViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"
    func postRemembranceId(type: String, projectId: Int) {
        let url = "\(baseUrl)/api/project/remembrance"
        let parameters: [String: Any] = [
            "type": type,
            "projectId": projectId
        ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: PostMiddleFinalReviewResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                case .failure(let error):
                    print("hello: \(error)")
                }
            }
    }
    func getRemeberanceQuestion(remembranceId: Int, completion: @escaping([QnaQuestion]) -> Void) {
        let url = "\(baseUrl)/api/project/remembrance/\(remembranceId)"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        AF.request(url,
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: PostMiddleFinalReviewResponse.self) { response in
                switch response.result {
                case .success(let res):
                    let completeProject = res.result.qnaList
                    completion(completeProject)
                case .failure(let error):
                    print(error)
                }
            }
    }
    func postRemeberanceAnswer(projectQnaId: Int, answerContent: String, completion: @escaping(ProjectQnA) -> Void) {
        let url = "\(baseUrl)/api/project/remembrance/qna"
        let parameters: [String: Any] = [
            "projectQnaId": projectQnaId,
            "answerChoice": 0,
            "answerContent": answerContent
        ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: PostRememberancceAnswerResponse.self) { response in
                switch response.result {
                case .success(let res):
                    let completeProject = res.result
                    completion(completeProject)
                case .failure(let error):
                    print(error)
                }
            }
    }
}

struct PostMiddleFinalReviewResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: MiddleFinalReview
}

struct MiddleFinalReview: Codable {
    let remembranceId: Int
    let type: String
    let qnaList: [QnaQuestion]
}

struct QnaQuestion: Codable, Hashable {
    let qnaId: Int
    let question: String
    let answerChoice: Int?
    let answerContent: String?
}

struct PostRememberancceAnswerResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ProjectQnA
}
struct ProjectQnA: Codable {
    let projectQnaId: Int
    let projectQuestionId: Int
    let questionContent: String
    let answerChoice: Int
    let answerContent: String
}
