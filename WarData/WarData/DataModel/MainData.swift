//
//  MainData.swift
//  WarData
//
//  Created by Olga Sabadina on 23.08.2023.
//

import Foundation

typealias MainData = [MainDatum]

struct MainDatum: Codable {
    let date: String
    let day, aircraft, helicopter, tank: Int
    let apc, fieldArtillery, mrl: Int
    let militaryAuto, fuelTank: Int?
    let drone, navalShip, antiAircraftWarfare: Int
    let specialEquipment, mobileSRBMSystem: Int?
    let greatestLossesDirection: String?
    let vehiclesAndFuelTanks, cruiseMissiles: Int?
    
    enum CodingKeys: String, CodingKey {
        case date, day, aircraft, helicopter, tank
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSRBMSystem = "mobile SRBM system"
        case greatestLossesDirection = "greatest losses direction"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
    }
    
    var mainDatumArrayForShow: [String?] {
        var result: [String?] = []
        for i in MainTableTitles.allCases {
            var value: String? = ""
            switch i {
            case .personnel:
                value = ""
            case .aircraft:
                value = "\(aircraft)"
            case .helicopter:
                value = String(helicopter)
            case .tank:
                value = String(tank)
            case .apc:
                value = String(apc)
            case .fieldArtillery:
                value = String(fieldArtillery)
            case .mrl:
                value = String(mrl)
            case .drone:
                value = String(drone)
            case .navalShip:
                value = String(navalShip)
            case .antiAircraftWarfare:
                value = String(antiAircraftWarfare)
            case .specialEquipment:
                value = specialEquipment != nil ? "\(specialEquipment ?? 0)" : "don't receive"
            case .vehiclesAndFuelTanks:
                value = vehiclesAndFuelTanks != nil ? "\(vehiclesAndFuelTanks ?? 0)" : "don't receive"
            case .cruiseMissiles:
                value = cruiseMissiles != nil ? "\(cruiseMissiles ?? 0)" : "don't receive"
            }
            result.append(value)
        }
        return result
    }
}
