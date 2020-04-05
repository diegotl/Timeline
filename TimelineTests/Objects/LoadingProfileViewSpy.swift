//
//  LoadingProfileViewSpy.swift
//  TimelineTests
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

@testable import Timeline

class LoadingProfileViewSpy: ILoadingProfileView {
    
    var loading: Bool = false
    var status: String? = nil
    var retryButtonShown: Bool = false
    
    func set(loading: Bool) {
        self.loading = loading
    }
    
    func update(status: String?) {
        self.status = status
    }
    
    func toggleRetryButton(show: Bool) {
        self.retryButtonShown = show
    }

}
