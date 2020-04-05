//
//  TestRouterFactory.swift
//  TimelineTests
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

@testable import Timeline

struct TestRouterFactory: IRouterFactory {
    
    var timelineViewRouter: ITimelineViewRouter!
    var healthPromptsViewRouter: IHealthPromptsViewRouter!
    var eventViewRouter: IEventViewRouter!
    
    func createTimelineViewRouter() -> ITimelineViewRouter {
        return timelineViewRouter
    }
    
    func createHealthPromptsViewRouter() -> IHealthPromptsViewRouter {
        return healthPromptsViewRouter
    }
    
    func createEventViewRouter() -> IEventViewRouter {
        return eventViewRouter
    }
    
}
