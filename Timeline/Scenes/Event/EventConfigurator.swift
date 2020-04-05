//
//  EventConfigurator.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

protocol IEventConfigurator {
    func configure(_ viewController: EventViewController)
}

struct EventConfigurator: IEventConfigurator {
    
    let timelineEvent: TimelineEvent
    
    func configure(_ viewController: EventViewController) {
        viewController.presenter = EventPresenter(view: viewController, timelineEvent: timelineEvent)
    }
    
}
