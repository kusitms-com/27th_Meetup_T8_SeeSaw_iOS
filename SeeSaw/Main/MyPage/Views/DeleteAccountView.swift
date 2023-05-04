//
//  DeleteAccountView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/04.
//

import SwiftUI

struct DeleteAccountView: View {
    @State var isDeleteAccountViewOn = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("에몽님은")
            
            usedDateRow
                .offset(y: isDeleteAccountViewOn ? 0 : 50)
                .animation(.easeIn(duration: 1.5), value: isDeleteAccountViewOn)
            DeleteAccountRow(color: Color.SeeSawYellow, text: "도전")
                .opacity(isDeleteAccountViewOn ? 1 : 0)
                .offset(y: isDeleteAccountViewOn ? 0 : 50)
                .animation(.easeIn(duration: 1).delay(1.5), value: isDeleteAccountViewOn)
            DeleteAccountRow(color: Color.SeeSawBlue, text: "여유")
                .opacity(isDeleteAccountViewOn ? 1 : 0)
                .offset(y: isDeleteAccountViewOn ? 0 : 50)
                .animation(.easeIn(duration: 1).delay(2.5), value: isDeleteAccountViewOn)
            DeleteAccountRow(color: Color.SeeSawRed, text: "사랑")
                .opacity(isDeleteAccountViewOn ? 1 : 0)
                .offset(y: isDeleteAccountViewOn ? 0 : 50)
                .animation(.easeIn(duration: 1).delay(3.5), value: isDeleteAccountViewOn)
            
            Text("를 지키기 위해 달려왔어요")
                .opacity(isDeleteAccountViewOn ? 1 : 0)
                .offset(y: isDeleteAccountViewOn ? 0 : 50)
                .animation(.easeIn(duration: 1).delay(4.5), value: isDeleteAccountViewOn)
            
            Spacer()
            
            NavigationLink {
                SelectDeleteAccountView()
            } label: {
                CapsuleButtonView(isActive: true, text: "다음", size: .large)
                    .opacity(isDeleteAccountViewOn ? 1 : 0)
                    .animation(.easeIn(duration: 1).delay(5), value: isDeleteAccountViewOn)
                    .padding(.bottom, 20)
            }
        }
        .font(.ssHeading1)
        .padding(.horizontal, 20)
        .background(Color.Gray200)
        .onAppear {
            isDeleteAccountViewOn = true
        }
        .navigationTitle("회원탈퇴")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    var usedDateRow: some View {
        HStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 200, height: 54)
                    .cornerRadius(100, corners: [.topRight, .bottomRight])
                    .foregroundColor(Color.SeeSawGreen)
                Text("365일")
                    .foregroundColor(Color.Gray100)
                    .padding(.horizontal, 8)
            }
            
            Text("동안")
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

struct DeleteAccountRow: View {
    let color: Color
    let text: String
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 200, height: 54)
                    .cornerRadius(100, corners: [.topRight, .bottomRight])
                    .foregroundColor(color)
                Text(text)
                    .foregroundColor(Color.Gray100)
                    .padding(.horizontal, 8)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

struct DeleteAccountView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteAccountView()
    }
}
