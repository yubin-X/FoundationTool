//
//  String+Extension.swift
//  FoundationTool
//
//  Created by yzhu82 on 2019/3/5.
//  Copyright © 2019年 ld. All rights reserved.
//

import Foundation

extension String {
    public func calculateSize(inSize: CGSize, inFontSize: CGFloat) -> CGSize {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: inFontSize)
        let rect = CGRect(origin: .zero, size: inSize)
        let textRect = label.textRect(forBounds:rect , limitedToNumberOfLines: 0)
        return textRect.size
    }
}

extension NSAttributedString {
    public func calculateSize(inSize: CGSize) -> CGSize {
        let label = UILabel()
        label.numberOfLines = 0
        label.attributedText = self
        let rect = CGRect(origin: .zero, size: inSize)
        let textRect = label.textRect(forBounds:rect , limitedToNumberOfLines: 0)
        return textRect.size
    }
}
