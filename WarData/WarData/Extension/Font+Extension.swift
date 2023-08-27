//
//  Font+Extension.swift
//  WarData
//
//  Created by Olga Sabadina on 27.08.2023.
//

import UIKit

extension UIFont {
    static func digiFont(ofSize size: CGFloat) -> UIFont {
        let digiFont = UIFont(name: "DS-Digital-Bold", size: size) ?? .systemFont(ofSize: size)
        return digiFont
    }
}
