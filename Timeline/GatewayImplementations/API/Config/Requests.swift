//
//  Requests.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import APIClient

class ListProfilesRequest: APIRequest {
    init() {
        let endpoint = APIEndpoint(environment: Environment.production, path: Endpoints.listProfiles)
        super.init(endpoint: endpoint, method: .get, encoding: .queryString(nil))
    }
}

class ListTimelineEventsRequest: APIRequest {
    init(profileId: String) {
        let endpoint = APIEndpoint(environment: Environment.production, path: Endpoints.listTimelineEvents(profileId: profileId))
        super.init(endpoint: endpoint, method: .get, encoding: .queryString(nil))
    }
}

class ListHealthPromptsRequest: APIRequest {
    init(profileId: String) {
        let endpoint = APIEndpoint(environment: Environment.production, path: Endpoints.listHealthPrompts(profileId: profileId))
        super.init(endpoint: endpoint, method: .get, encoding: .queryString(nil))
    }
}
