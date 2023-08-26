//
//  Date+Extensions.swift
//  WarData
//
//  Created by Olga Sabadina on 26.08.2023.
//

import UIKit

extension Date {
    
    func formateDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
