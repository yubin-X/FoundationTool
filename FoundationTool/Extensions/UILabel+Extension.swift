//
//  UILabel+Extension.swift
//  FoundationTool
//
//  Created by yubin-X on 2019/3/5.
//  Copyright © 2019年 ld. All rights reserved.
//

import Foundation

extension UILabel {
    public func calculateMaxLines() -> Int{
        let textSize = CGSize(width: self.frame.size.width, height: CGFloat(Float.infinity))
        let rHeight = lroundf(Float(self.sizeThatFits(textSize).height))
        let charSize = lroundf(Float(self.font.lineHeight))
        let lineCount = rHeight/charSize
        return lineCount
    }
}
