//
//  TimelinePresenter.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import Foundation

protocol ITimelineView: class {
    func set(loading: Bool)
    func reloadData()
}

protocol ITimelinePresenter {
    var groupedTimelineEvents: [GroupedTimelineEvents] { get }
    
    func setupChildViews()
    func loadTimelineEvents()
    func presentDetails(for event: TimelineEvent)
}

class TimelinePresenter: ITimelinePresenter {
        
    private(set) weak var view: ITimelineView?
    private let useCaseFactory: IUseCaseFactory
    private let routerFactory: IRouterFactory
    private let profile: Profile
    
    private lazy var listTimelineEventsUseCase: IListTimelineEventsUseCase = useCaseFactory.createListTimelineEventsUseCase()
    private lazy var healthPromptsViewRouter: IHealthPromptsViewRouter = routerFactory.createHealthPromptsViewRouter()
    private lazy var eventViewRouter: IEventViewRouter = routerFactory.createEventViewRouter()
    
    var groupedTimelineEvents: [GroupedTimelineEvents] = []
    
    internal init(view: ITimelineView? = nil, useCaseFactory: IUseCaseFactory, routerFactory: IRouterFactory, profile: Profile) {
        self.view = view
        self.useCaseFactory = useCaseFactory
        self.routerFactory = routerFactory
        self.profile = profile
    }
    
    func setupChildViews() {
        healthPromptsViewRouter.injectInto(profile: profile)
    }
    
    func loadTimelineEvents() {
        view?.set(loading: true)
        
        listTimelineEventsUseCase.list(profile: profile) { result in
            self.view?.set(loading: false)
            
            do {
                let events = try result.get()
                var grouped = [String: [TimelineEvent]]()
                
                events.forEach { event in
                    if grouped[event.date!.formatted] != nil {
                        grouped[event.date!.formatted]?.append(event)
                    } else {
                        grouped[event.date!.formatted] = [event]
                    }
                }
                
                self.groupedTimelineEvents = grouped.map({ return GroupedTimelineEvents(title: $0, timelineEvents: $1) })
                self.view?.reloadData()
                
            } catch {
                //TODO: handle error
                print(error)
            }
        }
    }
    
    func presentDetails(for event: TimelineEvent) {
        eventViewRouter.present(timelineEvent: event)
    }

}
