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
    
    func getActivityEnergyBurned(completion: @escaping (Double) -> Void) {
        guard let activeEnergyType = HKSampleType.quantityType(forIdentifier: .activeEnergyBurned) else { return }
        
        let now = Date()
        let startDate = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: activeEnergyType, quantitySamplePredicate: predicate) { _, result, error in
            var cal: Double = 0
            
            guard let result = result, let sum = result.sumQuantity() else {
                print("result fail")
                return
            }
            
            cal = sum.doubleValue(for: HKUnit.kilocalorie())
            DispatchQueue.main.async {
                completion(cal)
            }
        }
        
        healthStore?.execute(query)
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        guard let healthStore = self.healthStore else { return completion(false) }
        guard let activeEnergyType = HKSampleType.quantityType(forIdentifier: .activeEnergyBurned) else { return completion(false) }
        
        healthStore.requestAuthorization(toShare: [], read: [activeEnergyType]) { (success, _) in
            completion(success)
        }
    }
}
