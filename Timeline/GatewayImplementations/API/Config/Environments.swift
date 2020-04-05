//
//  Environments.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import APIClient

enum Environment: APIEnvionment {
    case production
    //case development
    
    var baseUrl: String {
        switch self {
            case .production: return "https://freemium.ottonova.de/api"
            //case .development: return "https://freemium.ottonova.de/dev"
        }
    }
}
