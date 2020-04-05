//
//  ListProfilesUseCaseStub.swift
//  TimelineTests
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

@testable import Timeline

struct ListProfilesUseCaseStub: IListProfilesUseCase {
    
    var resultToBeReturned: Result<[Profile], Error>!
    
    func list(completion: @escaping (Result<[Profile], Error>) -> Void) {
        completion(resultToBeReturned)
    }
    
}
