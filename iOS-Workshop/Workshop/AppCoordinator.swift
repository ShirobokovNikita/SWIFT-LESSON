//
//  AppCoordinator.swift
//  Workshop
//
//  Created by Nikita Shirobokov on 21.01.23.
//

import UIKit

protocol IAppCoordinator: AnyObject {
    func start(_ index: Int)
}

class AppCoordinator {}

extension AppCoordinator: IAppCoordinator {
    func start(_ index: Int) {
        
    }
}
