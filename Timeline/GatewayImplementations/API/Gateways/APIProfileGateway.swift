//
//  APIProfileGateway.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import APIClient

struct APIProfileGateway: ProfileGateway {
    
    let apiClient: APIClient
    
    func list(completion: @escaping (Result<[Profile], Error>) -> Void) {
        let request = ListProfilesRequest()
        apiClient.execute(apiRequest: request) { (result: Result<[Profile], APIError>) in
            do {
                try completion(.success(result.get()))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func listTimelineEvents(profileId: String, completion: @escaping (Result<[TimelineEvent], Error>) -> Void) {
        let request = ListTimelineEventsRequest(profileId: profileId)
        apiClient.execute(apiRequest: request) { (result: Result<[TimelineEvent], APIError>) in
            do {
                try completion(.success(result.get()))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func listHealthPrompts(profileId: String, completion: @escaping (Result<[HealthPrompt], Error>) -> Void) {
        let request = ListHealthPromptsRequest(profileId: profileId)
        apiClient.execute(apiRequest: request) { (result: Result<[HealthPrompt], APIError>) in
            do {
                try completion(.success(result.get()))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
}
