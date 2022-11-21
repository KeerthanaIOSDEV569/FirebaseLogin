//
//  ChartData.swift
//  Carrier
//
//  Created by Siddu Lakshmi Keerthana on 20/11/22.
//

import Foundation

class ChartData : Codable{
    
    var Date: String!
    var Mode: String!
    var Temperature: Int
    var Humidity: Int
    
    required init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        Date = try container.decode(String.self, forKey: .Date)
        Mode = try container.decode(String.self, forKey: .Mode)
        Temperature = try container.decode(Int.self, forKey: .Temperature)
        Humidity = try container.decode(Int.self, forKey: .Humidity)
        
    }

}
