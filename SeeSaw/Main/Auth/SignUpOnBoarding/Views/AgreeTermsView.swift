//
//  AgreeTermsView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/04.
//

import SwiftUI

struct AgreeTermsView: View {
    @State private var progress = 0.5
    @State var isFirstTermAgree: Bool = false
    @State var isSecondTermAgree: Bool = false
    @State var isThirdTermAgree: Bool = false
    @State var isFourthTermAgree: Bool = false
    var isAllTermsAgree: Bool {
        return isFirstTermAgree && isSecondTermAgree && isThirdTermAgree
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                ProgressView(value: progress)
                    .padding(.top, 68)
                    .padding(.bottom, 28)
                
                Text("안녕하세요 :)\n약관에 동의해주세요")
                    .font(.ssHeading2)
                    .foregroundColor(.GrayBlack)
                Text("여러분의 개인정보와 서비스 이용 권리 잘 지켜드릴게요")
                    .font(.ssWhiteBody2)
                    .foregroundColor(.Gray600)
                    .padding(.vertical, 20)
                
                Divider()
                    .padding(.bottom, 24)
                
                VStack {
                    TermView(isNecessary: true,
                             title: "개인정보처리방침",
                             isTermAgree: $isFirstTermAgree)
                    TermView(isNecessary: true,
                             title: "개인정보 수집 이용 동의",
                             isTermAgree: $isSecondTermAgree)
                    TermView(isNecessary: true,
                             title: "이용약관",
                             isTermAgree: $isThirdTermAgree)
                    TermView(isNecessary: false,
                             title: "마케팅 수신 동의",
                             isTermAgree: $isFourthTermAgree)
                }
                
                Divider()
                
                allTermsAgreeView
                
                Spacer()
                
                NavigationLink {
                    UserInfoView()
                } label: {
                    CapsuleButtonView(color: isAllTermsAgree ? Color.Gray900 : Color.Gray400,
                                      text: "다음",
                                      size: .large)
                }
                .disabled(!isAllTermsAgree)
            }
            .padding(20)
        }
    }
    
    var allTermsAgreeView: some View {
        Button {
            isFirstTermAgree = true
            isSecondTermAgree = true
            isThirdTermAgree = true
            isFourthTermAgree = true
        } label: {
            HStack(alignment: .center) {
                Image(systemName: "checkmark.square")
                    .font(.system(size: 28))
                    .foregroundColor(isAllTermsAgree ? .black : .Gray600)
                Text("모두 동의할게요")
                    .font(.ssBlackTitle2)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}

struct TermView: View {
    let isNecessary: Bool
    let title: String
    @Binding var isTermAgree: Bool
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                isTermAgree.toggle()
            } label: {
                Image(systemName: "checkmark.square")
                    .font(.system(size: 28))
                    .foregroundColor(isTermAgree ? .black : .Gray600)
            }
            Text("(\(isNecessary ? "필수" : "선택"))")
                .font(.ssBlackBody1)
                .foregroundColor(Color.Gray900)
            Text(title)
                .font(.ssBlackBody2)
                .foregroundColor(Color.Gray900)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.Gray500)
        }
        .padding(.bottom, 20)
    }
}

struct AgreeTermsView_Previews: PreviewProvider {
    static var previews: some View {
        AgreeTermsView()
    }
}
