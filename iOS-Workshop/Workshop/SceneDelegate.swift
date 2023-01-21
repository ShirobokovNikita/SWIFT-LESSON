//
//  SceneDelegate.swift
//  Workshop
//
//  Created by Артем Шарапов on 26.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    private let rootNavigationController = UINavigationController()
    
    // делаем assembly вычислимой переменной, чтобы она могла обращаться к self
    private var usersAssembly: IUsersAssembly { UsersAssembly() }
    
    // router, который внутри себя скрывает всю логику показа экрана
    private lazy var router: IRouter = {
        Router(usersAssembly: usersAssembly)
    }()
    
    private lazy var tabBarController = TabBarViewController(
        usersTransitionHandler: rootNavigationController,
        testViewController: TestViewController()
    )
    
    private lazy var tabBarCoordinator: TabBarCoordinator = {
        TabBarCoordinator(
            userFlowCoordinator: UserFlowCoordinator(router: router),
            testFlowCoordinator: TestFlowCoordinator(),
            transitionHandler: tabBarController
        )
    }()

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
//        rootNavigationController
        rootNavigationController.tabBarItem = UITabBarItem(title: "Root", image: nil, selectedImage: nil)
        tabBarCoordinator.start(0)
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = tabBarController
        self.window = window
        window.makeKeyAndVisible()
    }
}

