//
//  SignOutView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/15.
//

import SwiftUI

struct SignOutView: View {
    var body: some View {
        GeometryReader { proxy in
            TabView {
                ShowValuesView()
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .rotationEffect(.degrees(-90))
                
                SelectDeleteAccountView()
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .rotationEffect(.degrees(-90))
            }
            .frame(width: proxy.size.height, height: proxy.size.width)
            .rotationEffect(.degrees(90), anchor: .topLeading)
            .offset(x: proxy.size.width)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct SignOutView_Previews: PreviewProvider {
    static var previews: some View {
        SignOutView()
    }
}
