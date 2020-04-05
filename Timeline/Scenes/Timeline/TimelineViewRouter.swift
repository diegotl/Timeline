//
//  TimelineViewRouter.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol ITimelineViewRouter {
    func navigateTo(profile: Profile)
}

struct TimelineViewRouter: ITimelineViewRouter {
    
    private(set) weak var navigationController: UINavigationController?

    func navigateTo(profile: Profile) {
        let viewController = Storyboard.main.instantiate(TimelineViewController.self)
        viewController.configurator = TimelineConfigurator(profile: profile)
        navigationController?.setViewControllers([viewController], animated: true)
    }

}
