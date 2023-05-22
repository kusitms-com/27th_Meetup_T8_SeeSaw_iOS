//
//  ArrowUpRightView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ArrowUpRightView: View {
    var body: some View {
        Image(systemName: "arrow.up.right")
            .resizable()
            .frame(width: 12, height: 12)
            .foregroundColor(.SeeSawYellow)
            .padding(12)
            .background(Color.white)
            .cornerRadius(30)
    }
}

struct ArrowUpRightView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowUpRightView()
    }
}
