//
//  EnumErrors.swift
//  WarData
//
//  Created by Olga Sabadina on 23.08.2023.
//

import Foundation

public enum WarDataNetworkErrors: Error {
    case badURL
    case invalidData
    case responseStatusCodeError
    case errorParsing
}
