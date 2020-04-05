//
//  ListHealthPromptsUseCase.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

protocol IListHealthPromptsUseCase {
    func list(profile: Profile, completion: @escaping (_ result: Result<[HealthPrompt], Error>) -> Void)
}

struct ListHealthPromptsUseCase: IListHealthPromptsUseCase {

    let gateway: ProfileGateway
    
    func list(profile: Profile, completion: @escaping (Result<[HealthPrompt], Error>) -> Void) {
        gateway.listHealthPrompts(profileId: profile.id, completion: completion)
    }

}
