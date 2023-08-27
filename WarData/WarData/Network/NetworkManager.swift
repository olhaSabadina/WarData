//
//  NetworkManager.swift
//  WarData
//
//  Created by Olga Sabadina on 23.08.2023.
//

import Foundation

enum Resource: String {
    case main
    case equipment
    case personnel
}

struct NetworkManager {
    
    //in Future write URLDataTask for fetch data from online server...
    func fetchData<T: Codable>(resource: Resource, of type: T.Type) -> T? {

        guard let url = Bundle.main.url(forResource: resource.rawValue, withExtension: "json") else { print("file not find")
            return nil }
        do {
            let data = try Data(contentsOf: url)
            let dataModel = self.parseJSON(of: type, data: data)
            return dataModel
        } catch {
            print("not catch")
        }
        return nil
    }
    
    private func parseJSON<T: Codable>(of type: T.Type, data: Data) -> T? {
        let decoder = JSONDecoder()
        do{
            let mainData: T = try decoder.decode(T.self, from: data)
            return mainData
            
        } catch {
            print(WarDataErrors.errorParsing)
        }
        return nil
    }
}
