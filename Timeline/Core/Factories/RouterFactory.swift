//
//  RouterFactory.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol IRouterFactory {
    func createTimelineViewRouter() -> ITimelineViewRouter
    func createHealthPromptsViewRouter() -> IHealthPromptsViewRouter
    func createEventViewRouter() -> IEventViewRouter
}

struct RouterFactory: IRouterFactory {
    
    let parent: UIViewController?
    let container: UIView?
    let navigationController: UINavigationController?
    
    init(parent: UIViewController? = nil, container: UIView? = nil, navigationController: UINavigationController? = nil) {
        self.parent = parent
        self.container = container
        self.navigationController = navigationController
    }
    
    func createTimelineViewRouter() -> ITimelineViewRouter {
        return TimelineViewRouter(navigationController: navigationController)
    }
    
    func createHealthPromptsViewRouter() -> IHealthPromptsViewRouter {
        return HealthPromptsViewRouter(parent: parent, container: container)
    }
    
    func createEventViewRouter() -> IEventViewRouter {
        return EventViewRouter(parent: parent)
    }
    
}
