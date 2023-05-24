//
//  GetRegularReviewResponse.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/24.
//

import Foundation

struct GetRegularReviewResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [RegularReview]
}

struct RegularReview: Codable, Hashable {
    var recordId: Int
    var createdAt: String
    var question: String?
    var contents: String
}
