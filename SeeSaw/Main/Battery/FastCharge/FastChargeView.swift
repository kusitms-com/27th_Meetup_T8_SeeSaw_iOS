//
//  FastChargeView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/13.
//

import SwiftUI

enum FastChargeDescription {
    static let titleFirst = "가치의 균형으로 나아가는"
    static let titleSecond = "님을 위한 오늘의 고속충전"
    static let question = "오늘은 어떤 실천을 하셨나요?"
    static let placeholder = "사소한 것도 좋아요!"
    static let exampleLabel = "예시로는 이런 것들이 있어요!"
    static let example = "운동하기, 책 읽기, 가족과 시간 보내기"
}

struct FastChargeView: View {
    @AppStorage("nickname") var nickname: String = "이오링"
    @State private var todayFastCharge = ""
    
    @StateObject var api = ApiClient()
    @StateObject var batteryVM = BatteryViewModel()
    @State private var values: [String: Int] = [:]
    
    @State var selectedFastChargeValue = ""
    var isFastChargeButtonAvailable: Bool {
        return todayFastCharge.isEmpty == false && selectedFastChargeValue.isEmpty == false
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    title
                    
                    Divider()
                        .padding(.vertical, 28)
                    
                    askFastCharge
                    
                    Text("어떤 가치를 위한 실천이었나요?")
                        .padding(.bottom, 16)
                    
                    HStack(spacing: 8) {
                        ForEach(Array(values.keys), id: \.self) { value in
                            Button {
                                selectedFastChargeValue = value
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .cornerRadius(12, corners: .allCorners)
                                        .frame(height: 48)
                                        .foregroundColor(selectedFastChargeValue == value ? .SeeSawGreen : .Gray300)
                                    Text(value)
                                        .font(selectedFastChargeValue == value ? .ssWhiteBody1 : .ssBlackBody1)
                                        .foregroundColor(selectedFastChargeValue == value ? .GrayWhite : .Gray700)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 20)
                }
                
                NavigationLink {
                    FastChargeCompletionView(selectedFastChargeValue: $selectedFastChargeValue)
                        .navigationBarBackButtonHidden(true)
                } label: {
                    CapsuleButtonView(color: isFastChargeButtonAvailable ? .Gray900 : .Gray400,
                                      text: "고속충전 완료",
                                      size: .large)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    guard let valueId = values[selectedFastChargeValue] else { return }
                    batteryVM.postFastCharge(valuId: valueId, todayFastCharge: todayFastCharge)
                })
                .disabled(!isFastChargeButtonAvailable)
            }
        }
        .onAppear {
            let currentDate = Date()
            let calendar = Calendar.current
            let year = calendar.component(.year, from: currentDate)
            api.getValuesWithValueId(year: year) { thisYearValues in
                values = thisYearValues
            }
        }
        .navigationTitle("고속충전")
        .navigationBarTitleDisplayMode(.inline)
        .padding(20)
        .background(Color.Gray200)
    }
    
    var title: some View {
        VStack(alignment: .leading) {
            Text("\(FastChargeDescription.titleFirst)")
            Text("\(nickname)\(FastChargeDescription.titleSecond)")
        }
        .font(.ssHeading2)
    }
    
    var askFastCharge: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(FastChargeDescription.question)
                .font(.ssBlackSubTitle)
                .padding(.bottom, 12)
            
            HStack {
                TextField("fastChargeTextField",
                          text: $todayFastCharge,
                          prompt: Text(FastChargeDescription.placeholder))
                .font(.ssBlackBody1)
                .onChange(of: todayFastCharge, perform: {
                          todayFastCharge = String($0.prefix(20))
                        })
                
                Text("\(todayFastCharge.count)/20")
                    .font(.ssBlackBody3)
                    .foregroundColor(.Gray600)
            }
            .padding(.bottom, 8)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.Gray900)
                .padding(.bottom, 16)
            
            Text(FastChargeDescription.exampleLabel)
                .font(.ssBlackBody2)
                .foregroundColor(.Gray600)
            Text(FastChargeDescription.example)
                .font(.ssBlackBody2)
                .foregroundColor(.Gray400)
                .padding(.bottom, 48)
        }
    }
}

struct FastChargeView_Previews: PreviewProvider {
    static var previews: some View {
        FastChargeView()
    }
}

extension Dictionary where Value: Equatable {
    func getKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}
