//
//  ListTimelineEventsUseCase.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

protocol IListTimelineEventsUseCase {
    func list(profile: Profile, completion: @escaping (_ result: Result<[TimelineEvent], Error>) -> Void)
}

struct ListTimelineEventsUseCase: IListTimelineEventsUseCase {

    let gateway: ProfileGateway
    
    func list(profile: Profile, completion: @escaping (Result<[TimelineEvent], Error>) -> Void) {
        gateway.listTimelineEvents(profileId: profile.id, completion: completion)
    }

}
