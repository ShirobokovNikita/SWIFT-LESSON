//
//  TabBarCoordinator.swift
//  Workshop
//
//  Created by Nikita Shirobokov on 21.01.23.
//

import UIKit

protocol ITabBarCoordinator: AnyObject {
    func start(_ index: Int)
}

final class TabBarCoordinator {
    
    private let transitionHandler: TabBarViewController
    private let userFlowCoordinator: IUserFlowCoordinator
    private let testFlowCoordinator: ITestFlowCoordinator
    
    init(userFlowCoordinator: IUserFlowCoordinator, testFlowCoordinator: ITestFlowCoordinator, transitionHandler: TabBarViewController) {
        self.userFlowCoordinator = userFlowCoordinator
        self.testFlowCoordinator = testFlowCoordinator
        self.transitionHandler = transitionHandler
    }
}

extension TabBarCoordinator: ITabBarCoordinator {
    func start(_ index: Int) {
        switch index {
        case 0:
            guard let navigationController = transitionHandler.viewControllers?[0] as? UINavigationController else {
                print("Cant`t cast to Navigation")
                return
            }
            userFlowCoordinator.start(from: navigationController)
        case 1: testFlowCoordinator.start()
        default: print("index incorrect")
        }
    }
    
    private func startTestFlow() {
        transitionHandler.selectedIndex = 1
        testFlowCoordinator.start()
    }
}
