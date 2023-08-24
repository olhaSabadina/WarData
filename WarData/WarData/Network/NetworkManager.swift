//
//  NetworkManager.swift
//  WarData
//
//  Created by Olga Sabadina on 23.08.2023.
//

import Foundation

struct NetworkManager {
    
    func fetchData<T: Codable>(resource: Resource, of type: T.Type, completionhandler: @escaping (Result<T?, Error>)->Void) {

        guard let url = Bundle.main.url(forResource: resource.rawValue, withExtension: "json") else { print("file not find")
            return}
        do {
            let data = try Data(contentsOf: url)
            let dataModel = self.parseJSON(of: type, data: data)
            completionhandler(.success(dataModel))
        } catch {
            print("not catch")
        }
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
