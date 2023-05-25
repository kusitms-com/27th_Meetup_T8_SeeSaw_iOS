//
//  ProjectTermView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/06.
//

import SwiftUI

struct ProjectTermView: View {
    @State private var showingDatePicker = false
    @Binding var startDate: Date
    @Binding var endDate: Date
    var body: some View {
        VStack(alignment: .leading) {
            Text("프로젝트 기간을 설정해주세요")
                .font(.ssBlackTitle2)
                .foregroundColor(.Gray900)
            HStack {
                Spacer()
                DatePicker("", selection: $startDate, in: ...Date(), displayedComponents: [.date])
                    .labelsHidden()
                Text("부터   ")
                    .font(.ssBlackBody1)
                DatePicker("", selection: $endDate, in: startDate..., displayedComponents: [.date])
                    .labelsHidden()
                Text("까지")
                    .font(.ssBlackBody1)
                Spacer()
            }
        }
    }
}
