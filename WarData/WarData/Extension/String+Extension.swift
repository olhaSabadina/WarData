//
//  String+Extension.swift
//  WarData
//
//  Created by Olga Sabadina on 25.08.2023.
//

import UIKit

extension String {
    
    func setAttributeForFirstEightSymbols(_ sizeFont: CGFloat, count: Int) -> NSMutableAttributedString? {
        guard self.count >= 8 else {return nil}
        let range = NSRange(location: 0, length: count)
        let attributedString = NSMutableAttributedString(string: self, attributes: nil)
        attributedString.setAttributes([
            .font: UIFont(name: "DS-Digital-Bold", size: sizeFont) ?? UIFont.systemFont(ofSize: sizeFont),
            .foregroundColor: UIColor.white.cgColor],
                                       range: range)
        return attributedString
    }
}
