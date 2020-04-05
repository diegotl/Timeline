//
//  EventViewRouter.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol IEventViewRouter {
    func present(timelineEvent: TimelineEvent)
}

struct EventViewRouter: IEventViewRouter {
    
    private(set) weak var parent: UIViewController?

    func present(timelineEvent: TimelineEvent) {
        let viewController = Storyboard.main.instantiate(EventViewController.self)
        viewController.configurator = EventConfigurator(timelineEvent: timelineEvent)
        parent?.present(viewController, animated: true)
    }

}
