//
//  APIHandler.swift
//  API project
//
//  Created by Dax Gerber on 12/1/23.
//

import Foundation

enum dataFetchErrorCode: Error, LocalizedError {
    case errorRetrievingDataTheirFault
}


class APIHandler {
    
    static func getMeTheGoods(urlString: String) async throws -> Data {
        let url = URL(string: urlString)!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw dataFetchErrorCode.errorRetrievingDataTheirFault }
        return data
    }
    
    static func doggo(dogoData: Data) throws -> Doggo {
        let jsonDecoder = JSONDecoder()
        let doggo = try jsonDecoder.decode(Doggo.self, from: dogoData)
        return doggo
    }
    
    static func Rep(repData: Data) throws -> Representatives {
        let jsonDecoder = JSONDecoder()
        let representatives = try jsonDecoder.decode(Representatives.self, from: repData)
        return representatives
    }
    
    
    
    
    
    
    
    
}
