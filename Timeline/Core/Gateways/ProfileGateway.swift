//
//  ProfileGateway.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

protocol ProfileGateway {
    func list(completion: @escaping (_ result: Result<[Profile], Error>) -> Void)
    func listTimelineEvents(profileId: String, completion: @escaping (_ result: Result<[TimelineEvent], Error>) -> Void)
    func listHealthPrompts(profileId: String, completion: @escaping (_ result: Result<[HealthPrompt], Error>) -> Void)
}
