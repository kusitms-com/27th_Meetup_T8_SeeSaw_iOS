//
//  AddProjectViewModel.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/24.
//

import Alamofire
import Foundation
import KeychainSwift

class AddProjectViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"
    
    func postProject(valueId: Int?, projectName: String, startedAt: Date, endedAt: Date, intensity: String, goal: String) {
        let url = "\(baseUrl)/api/project"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        let formattedDate = dateFormatter.string(from: Date())
        let parameters: [String: Any] = [
            "valueId": valueId,
            "projectName": projectName,
            "startedAt": dateFormatter.string(from: startedAt),
            "endedAt": dateFormatter.string(from: endedAt),
            "intensity": intensity,
            "goal": goal
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
