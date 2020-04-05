//
//  HealthPromptsPresenter.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

protocol IHealthPromptsView: class {
    func set(loading: Bool)
    func update(status: String?)
    func toggleRetryButton(show: Bool)
    func update(healthPrompt: HealthPrompt)
}

protocol IHealthPromptsPresenter {
    func listHealthPrompts()
}

class HealthPromptsPresenter: IHealthPromptsPresenter {
    
    private(set) weak var view: IHealthPromptsView?
    private let useCaseFactory: IUseCaseFactory
    private let profile: Profile
    
    private lazy var listHealthPromptsUseCase: IListHealthPromptsUseCase = useCaseFactory.createListHealthPromptsUseCase()
    
    internal init(view: IHealthPromptsView? = nil, useCaseFactory: IUseCaseFactory, profile: Profile) {
        self.view = view
        self.useCaseFactory = useCaseFactory
        self.profile = profile
    }
    
    func listHealthPrompts() {
        view?.set(loading: true)
        self.view?.toggleRetryButton(show: false)
        
        listHealthPromptsUseCase.list(profile: profile) { result in
            self.view?.set(loading: false)
            
            do {
                if let prompt = try result.get().first {
                    self.view?.update(healthPrompt: prompt)
                } else {
                    self.view?.update(status: "No prompt found.")
                }
                
            } catch {
                self.view?.update(status: error.localizedDescription)
                self.view?.toggleRetryButton(show: true)
            }
        }
    }

}
