//
//  Date+Extensions.swift
//  WarData
//
//  Created by Olga Sabadina on 26.08.2023.
//

import UIKit

extension Date {
    
    func formaterDate(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
