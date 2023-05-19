//
//  ProgressView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/05.
//

import SwiftUI

struct MyModel: Identifiable {
    let id = UUID()
    let value: String
    let title: String
    let content: String
    let strength: String
    let progress: Float
}

extension MyModel {
    static var DataArray: [MyModel] {
        (1...6).map { (number: Int) in
            MyModel(value: "\(number)", title: "타이틀: \(number)", content: "컨텐트: \(number)", strength: "high", progress: Float(number) / 10)
        }
    }
}

struct ProgressProjectView: View {
    @State private var showModal = false
    @State private var isEdit = false
    @State private var isDetail = false
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.fixed(180)),
                    GridItem(.fixed(180))
                ], spacing: 10, content: {
                    NavigationLink(destination: AddProjectView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: UIScreen.main.bounds.size.width / 2 - 20, height: 200)
                                .foregroundColor(.Gray300)
                            VStack(alignment: .leading) {
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 28, height: 28)
                                Spacer()
                                    .frame(width: 120, height: 61)
                                Text("새로운")
                                    .font(.ssWhiteBody1)
                                    .foregroundColor(.white)
                                Text("프로젝트를")
                                    .font(.ssWhiteBody1)
                                    .foregroundColor(.white)
                                Text("추가해보세요")
                                    .font(.ssWhiteBody1)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    ForEach(MyModel.DataArray, content: { (dataItem: MyModel) in
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: UIScreen.main.bounds.size.width / 2 - 20, height: 200)
                                .foregroundColor(.Gray300)
                            ProjectRectangleVIew(dataItem: dataItem)
                        }
                    })
                })
            }
        }
    }
}

struct ProgressProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressProjectView()
    }
}
