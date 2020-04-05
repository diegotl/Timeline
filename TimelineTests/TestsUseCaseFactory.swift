//
//  TestsUseCaseFactory.swift
//  TimelineTests
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

@testable import Timeline

struct TestUseCaseFactory: IUseCaseFactory {
    
    var listProfilesUseCase: IListProfilesUseCase!
    var listTimelineEventsUseCase: IListTimelineEventsUseCase!
    var listHealthPromptsUseCase: IListHealthPromptsUseCase!
    
    func createListProfilesUseCase() -> IListProfilesUseCase {
        return listProfilesUseCase
    }
    
    func createListTimelineEventsUseCase() -> IListTimelineEventsUseCase {
        return listTimelineEventsUseCase
    }
    
    func createListHealthPromptsUseCase() -> IListHealthPromptsUseCase {
        return listHealthPromptsUseCase
    }
    
}
