//
//  ProvisioningView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/11.
//

import SwiftUI

struct ProvisioningView: View {
    @State private var allowActiveData: Bool = true
    var body: some View {
        VStack(spacing: 0) {
            allowActiveDataRow
                .padding(.top, 36)
            
            MyPageRow(isRowTop: false,
                      title: "개인정보 정책",
                      isChevronExist: true)
            
            Spacer()
        }
        .navigationTitle("권한 설정")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal, 20)
        .background(Color.Gray200)
    }
    
    var allowActiveDataRow: some View {
        ZStack {
            Rectangle()
                .frame(height: 40)
                .cornerRadius(10, corners: [.topLeft, .topRight])
                .foregroundColor(Color.Gray100)
                .padding(0)
            
            HStack {
                Text("활동량 데이터 접근 허용")
                Spacer()
                Toggle("", isOn: $allowActiveData)
                
            }
            .font(.ssBlackBody2)
            .foregroundColor(.black)
            .padding(.horizontal, 10)
        }
    }
}

struct ProvisioningView_Previews: PreviewProvider {
    static var previews: some View {
        ProvisioningView()
    }
}
