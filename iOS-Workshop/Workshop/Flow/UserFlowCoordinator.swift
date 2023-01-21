//
//  UserFlowCoordinator.swift
//  Workshop
//
//  Created by Nikita Shirobokov on 21.01.23.
//

import UIKit

protocol IUserFlowCoordinator: AnyObject {
    func start(from rootViewController: UINavigationController)
}

final class UserFlowCoordinator {
    
    private let router: IRouter
    
    init(router: IRouter) {
        self.router = router
    }
    
}

extension UserFlowCoordinator: IUserFlowCoordinator {
    func start(from rootViewController: UINavigationController) {
        router.showUsersScreen(from: rootViewController)
    }
}
