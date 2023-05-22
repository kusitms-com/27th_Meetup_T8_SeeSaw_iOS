//
//  SeeSawTabView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/04/26.
//

import SwiftUI

enum TabIndex {
    case battery, value, project
}

struct SeeSawTabView: View {
    @State var tabIndex: TabIndex = .battery
    private let tabButtonRate: CGFloat = 2 / 9
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                if tabIndex == .battery {
                    BatteryDashboardView()
                } else if tabIndex == .value {
                    ValueView()
                } else {
                    ProjectView()
                }
                
                HStack(spacing: 0) {
                    Button {
                        tabIndex = .battery
                    } label: {
                        Image(tabIndex == .battery ? "SelectedBattery" : "UnselectedBattery")
                            .frame(width: geometry.size.width * tabButtonRate, height: 60)
                    }
                    
                    Button {
                        tabIndex = .value
                    } label: {
                        Image(tabIndex == .value ? "SelectedValue" : "UnselectedValue")
                            .frame(width: geometry.size.width * tabButtonRate)
                    }
                    
                    Button {
                        tabIndex = .project
                    } label: {
                        Image(tabIndex == .project ? "SelectedProject" : "UnselectedProject")
                            .frame(width: geometry.size.width * tabButtonRate)
                    }
                }
                .background(
                    Rectangle().cornerRadius(60, corners: .allCorners)
                        .frame(width: geometry.size.width * (2 / 3), height: 60)
                        .foregroundColor(.Gray100)
                        .shadow(radius: 60))
            }
        }
    }
}

struct SeeSawTabView_Previews: PreviewProvider {
    static var previews: some View {
        SeeSawTabView()
    }
}
