//
//  ContentView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/04/15.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        if authVM.isLoggedIn ?? false {
            SeeSawTabView()
        } else {
            LoginView()
        }
    }
}
