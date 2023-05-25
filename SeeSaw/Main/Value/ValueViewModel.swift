//
//  ValueViewModel.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/23.
//

import Alamofire
import Foundation
import KeychainSwift

class ValueViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"

    func getValueYear(completion: @escaping ([Int]) -> Void) {
        let url = "\(baseUrl)/api/value/year"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetYearResponse.self) { response in
                switch response.result {
                case .success(let res):
                    let years = res.result.yearList
                    completion(years)
                case .failure(let error):
                    print("DEBUG Api-getValues: \(error)")
                }
            }
    }
    func getFast(valueId: Int, completion: @escaping (Int) -> Void) {
        let url = "\(baseUrl)/api/value/\(valueId)"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetFastProejctResponse.self) { response in
                switch response.result {
                case .success(let res):
                    let fastCount = res.result.count
                    completion(fastCount)
                case .failure(let error):
                    print("DEBUG Api-getValues: \(error)")
                }
            }
    }
    func getProject(valueId: Int, completion: @escaping ([ProjectNameRate]) -> Void) {
        let url = "\(baseUrl)/api/value/\(valueId)"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetFastProejctResponse.self) { response in
                switch response.result {
                case .success(let res):
                    let projectList = res.result.projectList
                    completion(projectList)
                case .failure(let error):
                    print("DEBUG Api-getValues: \(error)")
                }
            }
    }
}

struct GetFastProejctResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: FastProject
}

struct FastProject: Codable {
    let projectList: [ProjectNameRate]
    let count: Int
}
        
struct ProjectNameRate: Codable, Hashable {
    let projectName: String
    let progressRate: Double
}

struct GetYearResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Year
}

struct Year: Codable {
    let yearList: [Int]
}
