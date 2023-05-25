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
    @StateObject var projectReportVM = ProjectReportViewModel()
    var projectId: Int
    @State var emotion1: String = ""
    @State var emotion2: String = ""
    @State var todayAnswerCount: Int = 0
    @State var recordAnswerCount: Int = 0
    @State var projectReportInfo: ProjectReportInfo
    @State var projectMiddleFinalQna = ProjectMiddleFinalQna()
    @State var simpleRecordeInfo: [SimpleRecordInfo] = []
    @State var answerContentList: [AnswerContentList] = []
    @State var average: Int = 0
    @State var max: Int = 0
    @State var min: Int = 0
    @State var value1: String = ""
    @State var count1: Int = 0
    @State var value2: String = ""
    @State var count2: Int = 0
    @State var value3: String = ""
    @State var count3: Int = 0
    @State var activityAvg: Int = 0
    @State var sleepAvg: Int = 0
    var body: some View {
        VStack {
            TabView(selection: $selectedView) {
                Group {
                    ProjectInfoView(projectReportInfo: projectReportInfo)
                        .tag(1)
                    ProjectEmotionView(middleReview: projectMiddleFinalQna.middleAnswer, finalReview: projectMiddleFinalQna.finalAnswer, firstEmoji: emotion1, secondEmoji: emotion2)
                        .tag(2)
                    ProjectTodayAnswerTimeView(answerTime: todayAnswerCount)
                        .tag(3)
                    if simpleRecordeInfo.count > 2 {
                        ProjectRegularAnswerTimeView(regularAnswerTime: recordAnswerCount, date1: simpleRecordeInfo[0].createdAt, answer1: simpleRecordeInfo[0].content, date2: simpleRecordeInfo[1].createdAt, answer2: simpleRecordeInfo[1].content, date3: simpleRecordeInfo[2].createdAt, answer3: simpleRecordeInfo[2].content)
                            .tag(4)
                    }
                }
                if answerContentList.count > 9 {
                    Group {
                        ProjectLearnView(middleReview: answerContentList[0].content, finalReview: answerContentList[1].content)
                            .tag(5)
                        ProjectSorryVIew(middleReview: answerContentList[2].content, finalReview: answerContentList[3].content)
                            .tag(6)
                    }
                    Group {
                        ProjectReachGoalView(middleReview: answerContentList[4].content, finalReview: answerContentList[5].content)
                            .tag(7)
                        ProjectPersonView(middleReview: answerContentList[6].content, finalReview: answerContentList[7].content)
                            .tag(8)
                        ProjectWantPersonView(middleReview: answerContentList[8].content, finalReview: answerContentList[9].content)
                            .tag(9)
                    }
                }
                Group {
                    ProjectEnergyView(averageProgress: average, maxProgress: max, minProgress: min)
                        .tag(10)
                    ProjectFastChargeView(value: [value1, value2, value3], valueNum: [count1, count2, count3])
                        .tag(11)
                    ProjectCalorieView(calori: activityAvg)
                        .tag(12)
                    ProjectSleepView(sleep: sleepAvg)
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
                        presentationMode.wrappedValue.dismiss()
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
        .onAppear {
            projectReportVM.getProjectReportFirst(projectId: projectId) { response in
                projectReportInfo = response.projectReportInfoDto
                emotion1 = response.emotion1
                emotion2 = response.emotion2
                projectMiddleFinalQna = response.projectMiddleFinalQnaDto
                todayAnswerCount = response.todayAnswerCount
                recordAnswerCount = response.recordAnswerCount
                simpleRecordeInfo = response.simpleRecordInfo
                answerContentList = response.answerContentList
            }
            projectReportVM.getProjectReportSecond(projectId: projectId) { response in
                average = response.energyReport.avg
                max = response.energyReport.max
                min = response.energyReport.min
                value1 = response.chargeReport.valueCountList[0].name
                count1 = response.chargeReport.valueCountList[0].count
                value2 = response.chargeReport.valueCountList[1].name
                count2 = response.chargeReport.valueCountList[1].count
                value3 = response.chargeReport.valueCountList[2].name
                count3 = response.chargeReport.valueCountList[2].count
                activityAvg = response.healthReport.activityAvg
                sleepAvg = response.healthReport.sleepAvg
            }
            print(projectId)
        }
    }
}
