//
//  MainToolBar.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/22.
//

import SwiftUI

struct MainToolBar: View {
    let feature: Feature
    enum Feature {
        case lifeLog
        case valueLog
        case projectLog
    }
    
    var body: some View {
        HStack {
            Image(switchFeature(feature: feature))
                .resizable()
                .scaledToFit()
                .frame(height: 24)
            Spacer()
            NavigationLink {
                MyPageView()
            } label: {
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 28))
                    .foregroundColor(.Gray400)
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 8)
        .background(Color.Gray200)
    }
    
    func switchFeature(feature: Feature) -> String {
        switch feature {
        case .lifeLog:
            return "LifeLog"
        case .valueLog:
            return "ValueLog"
        case .projectLog:
            return "ProjectLog"
        }
    }
}
