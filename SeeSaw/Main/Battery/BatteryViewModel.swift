//
//  BatteryViewModel.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/23.
//

import Alamofire
import Foundation
import KeychainSwift

struct BatteryInfo: Codable {
    let battery: Int
    let fastChargeTitle: String?
    let fastChargeValue: String?
    let todayActivity: Int?
    let activityGoal: Int?
    let todaySleep: Int?
    let sleepGoal: Int?
    
    private enum CodingKeys: String, CodingKey {
        case battery = "curBattery"
        case fastChargeTitle = "chargeName"
        case fastChargeValue = "valueName"
        case todayActivity = "curActivity"
        case activityGoal = "activityGoal"
        case todaySleep = "curSleep"
        case sleepGoal = "sleepGoal"
    }
}

struct GetBatteryResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: BatteryInfo
}

class BatteryViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"
    
    func getBattery(completion: @escaping (BatteryInfo) -> Void) {
        let url = "\(baseUrl)/api/battery"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetBatteryResponse.self) { response in
                switch response.result {
                case .success(let res):
                    let batteryInfo = res.result
                    completion(batteryInfo)
                case .failure(let error):
                    print("DEBUG get battery: \(error)")
                }
            }
    }
    
    func postEnergy(todayEnergy: Int) {
        let url = "\(baseUrl)/api/battery/activity"
        let parameters: [String: Any] = [
            "value": todayEnergy
        ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: PostEnergyResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func postSleep(todaySleep: Int) {
        let url = "\(baseUrl)/api/battery/sleep"
        let parameters: [String: Any] = [
            "value": todaySleep
        ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: PostSleepResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func postFastCharge(valuId: Int, todayFastCharge chargeName: String) {
        let url = "\(baseUrl)/api/battery/charge"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        let formattedDate = dateFormatter.string(from: Date())
        
        let parameters: [String: Any] = [
            "valueId": valuId,
            "chargeName": chargeName,
            "createdAt": formattedDate // LocalDateTime
        ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: PostFastChargeResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("fast charge \(response)")
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func getMonthActivityHistory(year: Int, month: Int, completion: @escaping ([ActivityDayInfo]) -> Void) {
        let url = "\(baseUrl)/api/battery/history/activity?year=\(year)&month=\(month)"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetMonthActivityHistory.self) { response in
                switch response.result {
                case .success(let res):
                    var histories: [ActivityDayInfo] = []
                    for data in res.result {
                        let day = data.day
                        let activity = data.activity
                        let color = data.color
                        histories.append(ActivityDayInfo(day: day, activity: activity, color: color))
                    }
                    completion(histories)
                case .failure(let error):
                    print("DEBUG get month activity: \(error)")
                }
            }
    }
    
    func getMonthSleepHistory(year: Int, month: Int, completion: @escaping ([SleepDayInfo]) -> Void) {
        let url = "\(baseUrl)/api/battery/history/sleep?year=\(year)&month=\(month)"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetMonthSleepHistory.self) { response in
                switch response.result {
                case .success(let res):
                    var histories: [SleepDayInfo] = []
                    for data in res.result {
                        let day = data.day
                        let sleep = data.sleep
                        let color = data.color
                        histories.append(SleepDayInfo(day: day, sleep: sleep, color: color))
                    }
                    completion(histories)
                case .failure(let error):
                    print("DEBUG get month sleep: \(error)")
                }
            }
    }
}

struct PostFastChargeResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: FastChargeResult
}

struct FastChargeResult: Codable {
    let valueId: Int
    let chargeName: String
    let createdAt: String
}

struct PostEnergyResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Int
}

struct PostSleepResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Int
}

struct GetMonthActivityHistory: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [ActivityDayInfo]
}

struct ActivityDayInfo: Codable {
    let day: Int
    let activity: Int?
    let color: Int?
}

struct GetMonthSleepHistory: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [SleepDayInfo]
}

struct SleepDayInfo: Codable {
    let day: Int
    let sleep: Int?
    let color: Int?
}
