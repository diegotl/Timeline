//
//  HealthPromptsConfigurator.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

protocol IHealthPromptsConfigurator {
    func configure(_ viewController: HealthPromptsViewController)
}

struct HealthPromptsConfigurator: IHealthPromptsConfigurator {
    
    let profile: Profile
    
    func configure(_ viewController: HealthPromptsViewController) {
        let useCaseFactory = UseCaseFactory()
        viewController.presenter = HealthPromptsPresenter(view: viewController, useCaseFactory: useCaseFactory, profile: profile)
    }
    
}
