//
//  TimelineConfigurator.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

protocol ITimelineConfigurator {
    func configure(_ viewController: TimelineViewController)
}

struct TimelineConfigurator: ITimelineConfigurator {
    
    let profile: Profile
    
    func configure(_ viewController: TimelineViewController) {
        let useCaseFactory = UseCaseFactory()
        let routerFactory = RouterFactory(parent: viewController, container: viewController.promptsContainerView)
        viewController.presenter = TimelinePresenter(view: viewController, useCaseFactory: useCaseFactory, routerFactory: routerFactory, profile: profile)
    }
    
}
