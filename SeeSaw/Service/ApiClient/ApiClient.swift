////
////  ApiClient.swift
////  SeeSaw
////
////  Created by 이안진 on 2023/05/07.
////
//
//import Alamofire
//import Foundation
//
//struct PostLoginRequest: Codable {
//    let provider: String
//    let idToken: String
//    let accessToken: String
//    let refreshToken: String
//}
//
//struct PostLoginResponse: Codable {
//    let accessToken: String
//    let refreshToken: String
//
//    private enum CodingKeys: String, CodingKey {
//        case accessToken = "access_token"
//        case refreshToken = "refresh_token"
//    }
//}
//
//class ApiClient: ObservableObject {
//    let baseUrl = "http://ec2-3-36-172-10.ap-northeast-2.compute.amazonaws.com"
//
//    func postLogin(req: PostLoginRequest) {
//        let url = baseUrl + "/auth/login"
//        let parameters: [String: Any] = [
//            "id_token": req.idToken,
//            "access_token": req.accessToken,
//            "refresh_token": req.refreshToken,
//            "provider": req.provider
//        ]
//        let headers: HTTPHeaders = [
//            "Content-Type": "application/json"
//        ]
//
//        AF.request(url,
//                   method: .post,
//                   parameters: parameters,
//                   encoding: JSONEncoding.default,
//                   headers: headers)
//            .responseDecodable(of: PostLoginResponse.self) { response in
//                switch response.result {
//                case .success(let response):
//                    print(response)
//                case .failure(let error):
//                    print(error)
//                }
//            }
//    }
//}
