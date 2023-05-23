//
//  BatteryHistoryViewModel.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/23.
//

import Alamofire
import Foundation
import KeychainSwift

class BatteryHistoryViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"

    func getSevenDaysBatteryHistory(completion: @escaping ([BatteryHistory]) -> Void) {
        let url = "\(baseUrl)/api/battery/history"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetSevenDaysBatteryHistoryResponse.self) { response in
                switch response.result {
                case .success(let res):
                    completion(res.result)
                    print(res.result)
                case .failure(let error):
                    print("DEBUG Api-getValues: \(error)")
                }
            }
    }
}

struct GetSevenDaysBatteryHistoryResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [BatteryHistory]
}

struct BatteryHistory: Codable {
    let date: String
    let batteryPercentage: Int
}
