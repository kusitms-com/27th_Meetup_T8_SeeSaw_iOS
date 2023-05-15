//
//  SetGoalViewModel.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/15.
//

import Foundation

class SetGoalViewModel: ObservableObject {
    let baseUrl = Bundle.main.infoDictionary?["BASE_URL"] ?? ""
    func postSleepGoal() {
        print(baseUrl)
    }
}
