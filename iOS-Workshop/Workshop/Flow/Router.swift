//
//  Router.swift
//  Workshop
//
//  Created by Nikita Shirobokov on 13.12.22.
//

import Foundation
import UIKit

protocol IRouter: AnyObject {
    func showUsersScreen()
    func showProfile(userid: Int)
    func showPosts(userid: Int)
}

final class Router {
    private let transitionHandler: UINavigationController
    private let usersAssembly: IUsersAssembly
    
    init(transitionHandler: UINavigationController, usersAssembly: IUsersAssembly) {
        self.transitionHandler = transitionHandler
        self.usersAssembly = usersAssembly
    }
}

extension Router: IRouter {
    func showUsersScreen() {
        let viewController = usersAssembly.makeUsersScreen(router: self)
        transitionHandler.pushViewController(viewController, animated: true)
    }
    
    func showProfile(userid: Int) {
        let viewController = usersAssembly.makeProfileScreen(userid: userid, router: self)
        transitionHandler.pushViewController(viewController, animated: true)
    }
    
    func showPosts(userid: Int) {
        let viewController = usersAssembly.makePostsScreen(userid: userid)
        viewController.modalPresentationStyle = .formSheet
        viewController.isModalInPresentation = false
        transitionHandler.present(viewController, animated: true)
    }
}
