//
//  TabBarViewController.swift
//  Workshop
//
//  Created by Nikita Shirobokov on 21.01.23.
//

import UIKit

protocol ITabBarController: AnyObject {

}

final class TabBarViewController: UITabBarController {
    
    private let usersTransitionHandler: UINavigationController
    private let testViewController: TestViewController
    
    init(usersTransitionHandler: UINavigationController, testViewController: TestViewController) {
        self.usersTransitionHandler = usersTransitionHandler
        self.testViewController = testViewController
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [usersTransitionHandler, testViewController]
    }
}

extension TabBarViewController: ITabBarController {
    
}
