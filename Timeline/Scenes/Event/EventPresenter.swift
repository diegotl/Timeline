//
//  EventPresenter.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

protocol IEventView: class {

}

protocol IEventPresenter {
    var title: String { get }
}

class EventPresenter: IEventPresenter {
    private(set) weak var view: IEventView?
    private let timelineEvent: TimelineEvent
    
    var title: String {
        return timelineEvent.title
    }
    
    internal init(view: IEventView? = nil, timelineEvent: TimelineEvent) {
        self.view = view
        self.timelineEvent = timelineEvent
    }

}
