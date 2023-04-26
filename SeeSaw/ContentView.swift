//
//  ContentView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/04/15.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var kakaoAuthVM: KakaoAuthViewModel
    
    var body: some View {
        if kakaoAuthVM.isLoggedIn ?? false {
            SeeSawTabView()
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
