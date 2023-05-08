//
//  AppleAuthViewModel.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/08.
//

import Alamofire
import Foundation

struct PostLoginRequest: Codable {
    let provider: String
    let idToken: String
    let accessToken: String
    let refreshToken: String
}

struct PostLoginResponse: Codable {
    let accessToken: String
    let refreshToken: String
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}

class AppleAuthViewModel: ObservableObject {
    func login(req: PostLoginRequest) {
        let url = "http://ec2-3-36-172-10.ap-northeast-2.compute.amazonaws.com/auth/login"
        let parameters: [String: Any] = [
            "id_token": req.idToken,
            "access_token": req.accessToken,
            "refresh_token": req.refreshToken,
            "provider": req.provider
        ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: PostLoginResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("accessToken", response.accessToken)
                    print("refreshToken", response.refreshToken)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
