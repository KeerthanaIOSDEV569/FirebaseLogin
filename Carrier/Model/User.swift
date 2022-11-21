//
//  User.swift
//  Carrier
//
//  Created by Siddu Lakshmi Keerthana on 20/11/22.
//

import Foundation

class User : Codable{
    var email: String!
    var password: String!
    
    required init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decode(String.self, forKey: .email)
        password = try container.decode(String.self, forKey: .password)

    }
}
