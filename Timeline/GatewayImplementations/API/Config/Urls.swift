//
//  Urls.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import APIClient

enum Endpoints: APIEndpointPath {
    case listProfiles
    case listTimelineEvents(profileId: String)
    case listHealthPrompts(profileId: String)
    
    var value: String {
        switch self {
            case .listProfiles:
                return "/user/customer/profiles"
            case .listTimelineEvents(let profileId):
                return "/user/customer/profiles/\(profileId)/timeline-events"
            case .listHealthPrompts(let profileId):
                return "/user/customer/profiles/\(profileId)/health-prompts"
        }
    }
}
