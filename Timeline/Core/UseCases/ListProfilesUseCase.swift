//
//  ListProfilesUseCase.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

protocol IListProfilesUseCase {
    func list(completion: @escaping (_ result: Result<[Profile], Error>) -> Void)
}

struct ListProfilesUseCase: IListProfilesUseCase {

    let gateway: ProfileGateway
    
    func list(completion: @escaping (Result<[Profile], Error>) -> Void) {
        gateway.list(completion: completion)
    }

}
