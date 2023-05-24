//
//  MyPageViewModel.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/21.
//

import Alamofire
import Foundation
import KeychainSwift

class MyPageViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"
    
    func putNickname(nickname: String) {
        let url = "\(baseUrl)/api/user"
        let parameters: [String: Any] = [
            "nickName": nickname
        ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url,
                   method: .put,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: PutNicknameResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func getUserHistory(completion: @escaping (Int, [String]) -> Void) {
        let url = "\(baseUrl)/api/user/history"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url,
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: GetUserHistoryResponse.self) { response in
                switch response.result {
                case .success(let response):
                    let usingDays = response.result.usingDays
                    let values = response.result.values
                    completion(usingDays, values)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func deleteUser() {
        let url = "\(baseUrl)/api/user"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url,
                   method: .delete,
                   encoding: JSONEncoding.default,
                   headers: headers)
        .responseDecodable(of: Int.self) { response in
                switch response.result {
                case .success(let response):
                    print("delete user: \(response)")
                case .failure(let error):
                    print("delete user: \(error)")
                }
            }
    }
}
