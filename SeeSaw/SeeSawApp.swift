//
//  SeeSawApp.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/04/15.
//

import KakaoSDKAuth
import KakaoSDKCommon
import SwiftUI

@main
struct SeeSawApp: App {
    init() {
        // Kakao SDK 초기화
        let kakaoNativeAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
        KakaoSDK.initSDK(appKey: kakaoNativeAppKey as! String)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


/*
 import SwiftUI
 import KakaoSDKCommon
 import KakaoSDKAuth
 ...

 @main
 struct SwiftUI_testApp: App {

     ...
     init() {
         // Kakao SDK 초기화
         KakaoSDK.initSDK(appKey: "NATIVE_APP_KEY")
     }
     ...

 }
 */
