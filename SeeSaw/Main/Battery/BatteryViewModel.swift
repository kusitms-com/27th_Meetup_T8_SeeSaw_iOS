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
    
    func postFastCharge(valuId: Int, todayFastCharge chargeName: String) {
        let url = "\(baseUrl)/api/battery/charge"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        let formattedDate = dateFormatter.string(from: Date())
        
        let parameters: [String: Any] = [
            "valueId": valuId,
            "chargeName": chargeName,
            "createdAt": formattedDate // LocalDateTime
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
            .responseDecodable(of: PostFastChargeResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("fast charge \(response)")
                case .failure(let error):
                    print(error)
                }
            }
    }
}

struct PostFastChargeResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: FastChargeResult
}

struct FastChargeResult: Codable {
    let valueId: Int
    let chargeName: String
    let createdAt: String
}

struct PostEnergyResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Int
}
