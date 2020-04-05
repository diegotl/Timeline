//
//  Profile.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

struct Profile: Codable {
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case id = "profile_id"
    }
}
