//
//  SetGoalViewModel.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/15.
//

import Alamofire
import Foundation
import KeychainSwift

class SetGoalViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"
    
    func postSleepGoal(sleepGoal: Int) {
        let url = "\(baseUrl)/api/battery/goal/sleep"
        let parameters: [String: Any] = [
            "value": sleepGoal
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
            .responseDecodable(of: PostGoalResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func postActivityGoal(activityGoal: Int) {
        let url = "\(baseUrl)/api/battery/goal/activity"
        let parameters: [String: Any] = [
            "value": activityGoal
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
            .responseDecodable(of: PostGoalResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
