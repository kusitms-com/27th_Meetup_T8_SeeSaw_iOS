//
//  ProjectReportVIew.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectReportView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedView = 1
    
    var body: some View {
        VStack {
            TabView(selection: $selectedView) {
                Group {
                    ProjectInfoView(projectColor: .SeeSawGreen)
                        .tag(1)
                    ProjectEmotionView()
                        .tag(2)
                    ProjectTodayAnswerTimeView()
                        .tag(3)
                    ProjectRegularAnswerTimeView()
                        .tag(4)
                    ProjectLearnView()
                        .tag(5)
                    ProjectSorryVIew()
                        .tag(6)
                }
                Group {
                    ProjectReachGoalView()
                        .tag(7)
                    ProjectPersonView()
                        .tag(8)
                    ProjectWantPersonView()
                        .tag(9)
                    ProjectEnergyView()
                        .tag(10)
                }
                Group {
                    ProjectFastChargeView()
                        .tag(11)
                    ProjectCalorieView()
                        .tag(12)
                    ProjectSleepView()
                        .tag(13)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(width: 300, height: 548)
            .cornerRadius(12)
            HStack {
                if selectedView > 1 {
                    Button {
                        selectedView  -= 1
                    } label: {
                        Image("ProjectReportPreviewButtonImage")
                    }
                } else {
                    Spacer()
                        .frame(width: 180)
                }
                if selectedView != 13 {
                    Button {
                        selectedView += 1
                    } label: {
                        Image("ProjectReportNextButtonImage")
                    }
                } else {
                    Button {
                        
                    } label: {
                        Image("ProjectReportFinishButtonImage")
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .padding(20)
        .navigationBarTitle("프로젝트 리포트", displayMode: .inline)
        .foregroundColor(.Gray500)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            }
        )
        .background(Color.Gray200)
    }
}

struct ProjectReportView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectReportView()
    }
}
