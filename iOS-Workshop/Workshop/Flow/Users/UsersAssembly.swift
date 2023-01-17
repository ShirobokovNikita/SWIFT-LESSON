//
//  UserAssembly.swift
//  Workshop
//
//  Created by Nikita Shirobokov on 13.12.22.
//

import Foundation
import UIKit

protocol IUsersAssembly: AnyObject  {
    func makeUsersScreen(router: IRouter) -> UIViewController
    func makeProfileScreen(userid: Int, router: IRouter) -> UIViewController
    func makePostsScreen(userid: Int) -> UIViewController
}

final class UsersAssembly: IUsersAssembly {
    
    // Сущность, которая будет возвращать готовый к использованию экран
    func makeUsersScreen(router: IRouter) -> UIViewController {
        let service = WorkshopService()
        let alertFactory = UsersAlertViewFactory()
        let presentor = UsersPresenter(
            service: service,
            dataSource: UsersViewDataSource.shared,
            router: router
        )
        let viewController = UsersViewController(
            alertFactory: alertFactory,
            output: presentor
        )
        presentor.view = viewController
        return viewController
    }
    
    func makeProfileScreen(userid: Int, router: IRouter) -> UIViewController {
        let service = WorkshopService()
        let alertFactory = UsersAlertViewFactory()
        let presentor = ProfilePresentor(userId: userid,
                                         dataSource: UsersViewDataSource.shared,
                                         service: service,
                                         router: router
        )
        
        let viewController = ProfileViewController(output: presentor,
                                                   alertFactory: alertFactory
        )
        presentor.view = viewController
        return viewController
    }
    
    func makePostsScreen(userid: Int) -> UIViewController {
        let presentor = PostsPresentor(dataSource: UsersViewDataSource.shared)
        let viewController = PostsViewController(output: presentor)
        return viewController
    }
}
