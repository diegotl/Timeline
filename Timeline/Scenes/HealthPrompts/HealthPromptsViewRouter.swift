//
//  HealthPromptsViewRouter.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol IHealthPromptsViewRouter {
    func injectInto(profile: Profile)
}

struct HealthPromptsViewRouter: IHealthPromptsViewRouter {
        
    private weak var parent: UIViewController?
    private weak var container: UIView?

    init(parent: UIViewController?, container: UIView?) {
        self.parent = parent
        self.container = container
    }

    func injectInto(profile: Profile) {
        guard let container = container else { return }
        
        let viewController = Storyboard.main.instantiate(HealthPromptsViewController.self)
        viewController.configurator = HealthPromptsConfigurator(profile: profile)
        
        parent?.addChild(viewController)
        container.addSubview(viewController.view)
        viewController.didMove(toParent: parent)
        
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        container.addConstraints([
            viewController.view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            viewController.view.topAnchor.constraint(equalTo: container.topAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
    }

}
