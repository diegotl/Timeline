//
//  UseCaseFactory.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

protocol IUseCaseFactory {
    func createListProfilesUseCase() -> IListProfilesUseCase
    func createListTimelineEventsUseCase() -> IListTimelineEventsUseCase
    func createListHealthPromptsUseCase() -> IListHealthPromptsUseCase
}

struct UseCaseFactory: IUseCaseFactory {
    
    func createListProfilesUseCase() -> IListProfilesUseCase {
        return ListProfilesUseCase(gateway: GatewayFactory.api.profile)
    }
    
    func createListTimelineEventsUseCase() -> IListTimelineEventsUseCase {
        return ListTimelineEventsUseCase(gateway: GatewayFactory.api.profile)
    }
    
    func createListHealthPromptsUseCase() -> IListHealthPromptsUseCase {
        return ListHealthPromptsUseCase(gateway: GatewayFactory.api.profile)
    }
    
}
