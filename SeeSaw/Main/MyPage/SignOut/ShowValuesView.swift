//
//  ShowValuesView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/15.
//

import SwiftUI

struct ShowValuesView: View {
    @State private var nickname = "에몽"
    @State private var usedSeeSawDays = 365
    @State private var showSignOutView = false
    
    @StateObject var api = ApiClient()
    @StateObject var myPageVM = MyPageViewModel()
    
    @State var values: [String] = []
    private let colors: [Color] = [.SeeSawYellow, .SeeSawBlue, .SeeSawRed]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("\(nickname)님은")
                        .font(.ssHeading1)
                    HStack {
                        ValueBlockView(backgroundColor: .SeeSawGreen,
                                       text: "\(usedSeeSawDays)일",
                                       showArrow: false)
                        Text("동안")
                            .font(.ssHeading1)
                        
                        Spacer()
                    }
                    
                    ForEach(values.indices, id: \.self) { index in
                        ValueBlockView(backgroundColor: colors[index % 3],
                                       text: values[index],
                                       showArrow: false)
                    }
                    
                    Text("의 가치를 발견하는\n하루하루를 보내왔어요")
                        .lineSpacing(12)
                        .font(.ssHeading1)
                }
            }
            Spacer()
            
            threeChevronDown
                .opacity(showSignOutView ? 1 : 0)
                .animation(.easeInOut(duration: 1.0).delay(1.0), value: showSignOutView)
        }
        .padding(20)
        .onAppear {
            myPageVM.getUserHistory { usingDays, usedValues in
                usedSeeSawDays = usingDays
                values = usedValues
            }
            showSignOutView = true
        }
    }
    
    var threeChevronDown: some View {
        VStack(alignment: .center, spacing: 16) {
            HStack {
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.system(size: 44))
                    .foregroundColor(.SeeSawGreen).opacity(0.3)
                Spacer()
            }
            HStack {
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.system(size: 44))
                    .foregroundColor(.SeeSawGreen).opacity(0.5)
                Spacer()
            }
            HStack {
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.system(size: 44))
                    .foregroundColor(.SeeSawGreen).opacity(0.7)
                Spacer()
            }
        }
    }
}

struct ShowValuesView_Previews: PreviewProvider {
    static var previews: some View {
        ShowValuesView()
    }
}
