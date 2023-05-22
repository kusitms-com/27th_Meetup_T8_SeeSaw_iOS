//
//  BatteryViewModel.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/23.
//

import Alamofire
import Foundation
import KeychainSwift

class BatteryViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"
    
    func postEnergy(todayEnergy: Int) {
        let url = "\(baseUrl)/api/battery/activity"
        let parameters: [String: Any] = [
            "value": todayEnergy
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
            .responseDecodable(of: PostEnergyResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                case .failure(let error):
                    print(error)
                }
            }
    }
}

struct PostEnergyResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Int
}
