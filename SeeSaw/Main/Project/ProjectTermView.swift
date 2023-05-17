//
//  ProjectTermView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/06.
//

import SwiftUI

struct ProjectTermView: View {
    @State private var showingDatePicker = false
    @State var startDate = Date()
    @State var endDate = Date()
    var body: some View {
        VStack(alignment: .leading) {
            Text("프로젝트 기간을 설정해주세요")
                .font(.ssBlackTitle2)
                .foregroundColor(.Gray900)
            HStack {
                Spacer()
                DatePicker("", selection: $startDate, displayedComponents: [.date])
                    .labelsHidden()
                Text("-")
                    .font(.ssBlackBody1)
                DatePicker("", selection: $endDate, displayedComponents: [.date])
                    .labelsHidden()
                Spacer()
            }
        }
    }
}
struct ProjectTermView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectTermView()
    }
}
