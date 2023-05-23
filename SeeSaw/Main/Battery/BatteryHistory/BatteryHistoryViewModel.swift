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

    /*
    func getValues(year: Int, completion: @escaping ([String]) -> Void) {
        let url = "\(baseUrl)/api/battery/history"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetValuesResponse.self) { response in
                switch response.result {
                case .success(let res):
                    var values: [String] = []
                    for value in res.result {
                        values.append(value.valueName)
                    }
                    completion(values)
                case .failure(let error):
                    print("DEBUG Api-getValues: \(error)")
                }
            }
    }
     */
}
