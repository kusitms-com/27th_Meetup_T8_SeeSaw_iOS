//
//  SeeSawApp.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/04/15.
//

import KakaoSDKAuth
import KakaoSDKCommon
import KeychainSwift
import SwiftUI

@main
struct SeeSawApp: App {
    init() {
        // Kakao SDK 초기화
        let kakaoNativeAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
        KakaoSDK.initSDK(appKey: kakaoNativeAppKey as! String)
    }
    
    @StateObject var authVM = AuthViewModel(isLoggedIn: false)
    @StateObject var dateHolder = DateHolder()
    
    var body: some Scene {
        WindowGroup {
            // onOpenURL을 사용해 커스텀 URL 스킴 처리
            ContentView()
                .onOpenURL { url in
                    if AuthApi.isKakaoTalkLoginUrl(url) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                }
                .environmentObject(authVM)
                .environmentObject(dateHolder)
        }
    }
}
