//
//  TimelineViewRouterSpy.swift
//  TimelineTests
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

@testable import Timeline

class TimelineViewRouterSpy: ITimelineViewRouter {
    
    var didCallNavigateTo: Bool = false
    var profile: Profile?
    
    func navigateTo(profile: Profile) {
        self.didCallNavigateTo = true
        self.profile = profile
    }
    
}
