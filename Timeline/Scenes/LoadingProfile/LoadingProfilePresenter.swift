//
//  LoadingProfilePresenter.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import Foundation

protocol ILoadingProfileView: class {
    func set(loading: Bool)
    func update(status: String?)
    func toggleRetryButton(show: Bool)
}

protocol ILoadingProfilePresenter {
    func loadProfile()
}

class LoadingProfilePresenter: ILoadingProfilePresenter {

    private(set) weak var view: ILoadingProfileView?
    private let useCaseFactory: IUseCaseFactory
    private let routerFactory: IRouterFactory
    
    private lazy var listProfilesUseCase: IListProfilesUseCase = useCaseFactory.createListProfilesUseCase()
    private lazy var timelineViewRouter: ITimelineViewRouter = routerFactory.createTimelineViewRouter()
    
    internal init(view: ILoadingProfileView?, useCaseFactory: IUseCaseFactory, routerFactory: IRouterFactory) {
        self.view = view
        self.useCaseFactory = useCaseFactory
        self.routerFactory = routerFactory
    }
    
    func loadProfile() {
        view?.set(loading: true)
        view?.update(status: "Loading Profile")
        view?.toggleRetryButton(show: false)
        
        listProfilesUseCase.list { result in
            self.view?.set(loading: false)
            
            do {
                if let profile = try result.get().first {
                    self.view?.update(status: "Found profile: \(profile.id)")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                        self?.timelineViewRouter.navigateTo(profile: profile)
                    }
                    
                } else {
                    self.view?.update(status: "No profiles found")
                }
            } catch {
                self.view?.update(status: error.localizedDescription)
                self.view?.toggleRetryButton(show: true)
            }
        }
    }

}
