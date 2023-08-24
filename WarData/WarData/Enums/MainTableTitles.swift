//
//  TitleConstant.swift
//  WarData
//
//  Created by Olga Sabadina on 24.08.2023.
//

import Foundation

public enum MainTableTitles: String, CaseIterable {
    case personnel = "Ліквідовано загарбників"
    case aircraft = "Літаків"
    case helicopter = "Гелікоптерів"
    case tank = "Танків"
    case apc = "БМП"
    case fieldArtillery = "Артилерії"
    case mrl = "MRL систем"
    case drone = "БПЛА"
    case navalShip = "Кораблів"
    case antiAircraftWarfare = "Засобів ПВО"
    case specialEquipment = "Спеціальної техніки"
    case vehiclesAndFuelTanks = "Вантажівки (ПММ)"
    case cruiseMissiles = "Крилаті ракети"
    
   static var titleArray: [String] {
        return MainTableTitles.allCases.map({$0.rawValue})
    }
}



