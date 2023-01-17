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
    
    // private let usersAssembly = UserAssembly()
    
    // делаем assembly вычислимой переменной, чтобы она могла обращаться к self
    private var usersAssembly: IUsersAssembly { UsersAssembly() }
    
    // router, который внутри себя скрывает всю логику показа экрана
    private lazy var router: IRouter = {
        Router(transitionHandler: rootNavigationController, usersAssembly: usersAssembly)
    }()

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
//        rootNavigationController
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = rootNavigationController
        router.showUsersScreen()
        self.window = window
        window.makeKeyAndVisible()
    }
}

