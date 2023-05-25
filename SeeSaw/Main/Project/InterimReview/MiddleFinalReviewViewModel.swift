//
//  ValueViewModel.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/23.
//

import Alamofire
import Foundation
import KeychainSwift

class MiddleFinalReviewViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"

}

