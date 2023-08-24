//
//  PersonnelData.swift
//  WarData
//
//  Created by Olga Sabadina on 24.08.2023.
//

import Foundation

typealias PersonnelData = [PersonnelDatum]

struct PersonnelDatum: Codable {
    let date: String
    let day, personnel: Int
    let personnelDatumPersonnel: Personnel
    let pow: Int?

    enum CodingKeys: String, CodingKey {
        case date, day, personnel
        case personnelDatumPersonnel = "personnel*"
        case pow = "POW"
    }
}

enum Personnel: String, Codable {
    case about = "about"
    case more = "more"
}

