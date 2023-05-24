//
//  ProjectDetailViewModel.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/24.
//

import Alamofire
import Foundation
import KeychainSwift

class RegularReviewViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"
    
    func getRegularReview(projectId: Int, completion: @escaping ([RegularReview]) -> Void) {
        let url = "\(baseUrl)/api/project/\(projectId)"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetRegularReviewResponse.self) { response in
                switch response.result {
                case .success(let res):
                    let regularReview = res.result
                    completion(regularReview)
                case .failure(let error):
                    print("DEBUG Api-getValues: \(error)")
                }
            }
    }
}
