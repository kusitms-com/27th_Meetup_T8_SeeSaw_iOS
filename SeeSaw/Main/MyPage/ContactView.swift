//
//  ContactView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/26.
//

import SwiftUI

struct ContactView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Spacer()
                Text("seesaw.8attery@gmail.com 로 문의 주시기 바랍니다")
                    .font(.ssBlackBody1)
                    .foregroundColor(.Gray900)
                Spacer()
            }
            Spacer()
            Spacer()
        }
        .background(Color.Gray200)
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
