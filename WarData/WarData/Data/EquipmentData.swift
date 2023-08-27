//
//  EquipmentData.swift
//  WarData
//
//  Created by Olga Sabadina on 24.08.2023.
//

import Foundation

typealias EquipmentData = [EquipmentDataObject]

struct EquipmentDataObject: Codable {
    let equipmentOryx, model: String
    let manufacturer: Manufacturer
    let lossesTotal: Int
    let equipmentUa: EquipmentUa

    enum CodingKeys: String, CodingKey {
        case equipmentOryx = "equipment_oryx"
        case model, manufacturer
        case lossesTotal = "losses_total"
        case equipmentUa = "equipment_ua"
    }
}

enum EquipmentUa: String, Codable, CaseIterable {
    case personnel = "personnel"
    case aircrafts = "Aircrafts"
    case helicopters = "Helicopters"
    case tanks = "Tanks"
    case armouredPersonnelCarriers = "Armoured Personnel Carriers"
    case artillerySystems = "Artillery Systems"
    case multipleRocketLaunchers = "Multiple Rocket Launchers"
    case drone = "dron"
    case warshipsBoats = "Warships, Boats"
    case antiAircraftWarfareSystems = "Anti-aircraft Warfare Systems"
    case specialEquipment = "Special Equipment"
    case vehicleAndFuelTank = "Vehicle and Fuel Tank"
    case cruiseMissiles = "cruiseMissiles"
    case unmannedAerialVehicles = "Unmanned Aerial Vehicles"
}

enum Manufacturer: String, Codable {
    case iran = "Iran"
    case israel = "Israel"
    case italy = "Italy"
    case poland = "Poland"
    case russia = "Russia"
    case theCzechRepublic = "the Czech Republic"
    case theSovietUnion = "the Soviet Union"
}
