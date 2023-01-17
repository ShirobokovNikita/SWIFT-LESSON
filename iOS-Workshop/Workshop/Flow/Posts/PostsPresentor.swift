//
//  PostsPresentor.swift
//  Workshop
//
//  Created by Nikita Shirobokov on 14.01.23.
//

import UIKit

protocol IPostsPresentor {
    func getPost(at index: Int) -> Post
    func getNumberOfPosts() -> Int
}

final class PostsPresentor: IPostsPresentor {
    private let dataSource: IUserViewDataSource
    
    init(dataSource: IUserViewDataSource) {
        self.dataSource = dataSource
    }
    
    func getPost(at index: Int) -> Post {
        dataSource.getPost(at: index)
    }
    
    func getNumberOfPosts() -> Int {
        dataSource.getNumberOfPosts()
    }
    
    
}

//extension PostsPresentor: IPostsPresentor {
//
//}
