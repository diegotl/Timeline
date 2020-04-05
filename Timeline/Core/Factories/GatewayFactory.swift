//
//  GatewayFactory.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import APIClient

struct GatewayFactory {
    static var api: APIGatewayFactory = APIGatewayFactory()
}

struct APIGatewayFactory {
    
    private var apiClient: APIClient = APIClient(strategy: APIDefaultStrategy(), adapters: [])
    
    var profile: ProfileGateway {
        return APIProfileGateway(apiClient: apiClient)
    }
    
}
