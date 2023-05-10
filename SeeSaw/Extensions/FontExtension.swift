//
//  FontExtension.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/02.
//

import Foundation
import SwiftUI

extension Font {
    static var ssHeading1: Font { Font.system(size: 32, weight: .heavy) }
    static var ssHeading2: Font { Font.system(size: 24, weight: .heavy) }
    static var ssHeading3: Font { Font.system(size: 40, weight: .heavy) }
    
    static var ssBlackTitle1: Font { Font.system(size: 20, weight: .bold) }
    static var ssWhiteTitle1: Font { Font.system(size: 20, weight: .heavy) }
    
    static var ssBlackTitle2: Font { Font.system(size: 18, weight: .bold) }
    static var ssWhiteTitle2: Font { Font.system(size: 18, weight: .heavy) }
    
    static var ssBlackSubTitle: Font { Font.system(size: 16, weight: .semibold) }
    static var ssWhiteSubTitle: Font { Font.system(size: 16, weight: .bold) }
    
    static var ssBlackBody1: Font { Font.system(size: 16, weight: .bold) }
    static var ssWhiteBody1: Font { Font.system(size: 16, weight: .heavy) }
    
    static var ssBlackBody2: Font { Font.system(size: 14, weight: .regular) }
    static var ssWhiteBody2: Font { Font.system(size: 14, weight: .bold) }
    
    static var ssBlackBody3: Font { Font.system(size: 12, weight: .regular) }
    static var ssWhiteBody3: Font { Font.system(size: 12, weight: .semibold) }
    
    static var ssBlackBody4: Font { Font.system(size: 10, weight: .regular) }
    static var ssWhiteBody4: Font { Font.system(size: 10, weight: .semibold) }
    
    static var ssBlackCaption: Font { Font.system(size: 8, weight: .regular) }
    static var ssWhiteCaption: Font { Font.system(size: 8, weight: .semibold) }
}
