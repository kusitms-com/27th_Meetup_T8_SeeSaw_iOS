//
//  HealthStore.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/23.
//

import Foundation
import HealthKit

class HealthStore {
    var healthStore: HKHealthStore?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        guard let healthStore = self.healthStore else { return completion(false) }
        guard let activeEnergyType = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned) else { return completion(false) }
        
        healthStore.requestAuthorization(toShare: [], read: [activeEnergyType]) { (success, error) in
            completion(success)
        }
    }
}
