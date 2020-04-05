//
//  LoadingProfileConfigurator.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

protocol ILoadingProfileConfigurator {
    func configure(_ viewController: LoadingProfileViewController)
}

struct LoadingProfileConfigurator: ILoadingProfileConfigurator {
    
    func configure(_ viewController: LoadingProfileViewController) {
        let useCaseFactory = UseCaseFactory()
        let routerFactory = RouterFactory(navigationController: viewController.navigationController)
        viewController.presenter = LoadingProfilePresenter(view: viewController, useCaseFactory: useCaseFactory, routerFactory: routerFactory)
    }
    
}
