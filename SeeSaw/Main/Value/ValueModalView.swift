//
//  ValueModalView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/03.
//

import SwiftUI

struct ValueModalView: View {
    var valueTitle: String
    var valueColor: Color
    var chargeNum: Int = 0
    @State var isProject: Bool = true
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .top) {
                if valueColor == .SeeSawYellow {
                        Image("ValueModalTopYellow")
                } else if valueColor == .SeeSawBlue {
                    Image("ValueModalTopBlue")
                } else {
                    Image("ValueModalTopRed")
                }
                VStack {
                    Spacer()
                        .frame(height: 20)
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 75, height: 6)
                        .foregroundColor((valueColor == .SeeSawRed ? Color.SeeSawDarkRed: (valueColor == .SeeSawBlue ? Color.SeeSawDarkBlue : Color.SeeSawDarkYellow)))
                    Spacer()
                        .frame(height: 20)
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text(valueTitle)
                                .font(.ssHeading3)
                                .foregroundColor(valueColor == .SeeSawYellow ? .GrayBlack : .Gray100)
                            Text(valueTitle + "과 관련된 프로젝트와 루틴들이에요")
                                .font(.system(size: 12))
                                .foregroundColor(valueColor == .SeeSawYellow ? .Gray700 : .Gray300)
                        }
                        Spacer()
                            .frame(height: 24)
                        HStack(spacing: 40) {
                            Button {
                                isProject.toggle()
                            } label: {
                                Text("프로젝트")
                                    .font(.ssWhiteBody1)
                                    .foregroundColor(isProject ? .Gray900 : .white)
                            }
                            Button {
                                isProject.toggle()
                            } label: {
                                Text("고속충전")
                                    .font(.ssWhiteBody1)
                                    .foregroundColor(isProject ? .white : .Gray900)
                            }
                            Spacer()
                        }
                    }
                    .padding(.leading, 20)
                    ZStack {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.size.width, height: 1)
                            .foregroundColor((valueColor == .SeeSawRed ? Color.SeeSawDarkRed: (valueColor == .SeeSawBlue ? Color.SeeSawDarkBlue : Color.SeeSawDarkYellow)))
                        HStack {
                            Rectangle()
                                .frame(width: 68, height: 2)
                                .foregroundColor(.GrayBlack)
                            Spacer()
                                .frame(width: isProject ? 300 : 105)
                        }
                    }
                    .padding(.bottom, 12)
                    if isProject {
                        ValueProjectView()
                    } else {
                        ValueQuickChargeView(valueTitle: self.valueTitle, valueColor: self.valueColor, chargeNum: self.chargeNum)
                    }
                }
            }]
        }
    }
}

struct ValueModalView_Previews: PreviewProvider {
    static var previews: some View {
        ValueModalView(valueTitle: "여유", valueColor: .SeeSawYellow)
    }
}
