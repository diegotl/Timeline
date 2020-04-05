//
//  TimelineEvent.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import Foundation

struct TimelineEvent: Codable {
    let uuid: String
    let timestamp: String
    let displayCategory: String
    let title: String
    let description: String
    let category: String
    
    var date: Date? {
        return timestamp.date
    }
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case timestamp
        case title
        case displayCategory = "display_category"
        case description
        case category
    }
}

struct GroupedTimelineEvents {
    let title: String
    let timelineEvents: [TimelineEvent]
}
