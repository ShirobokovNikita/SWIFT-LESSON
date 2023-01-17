//
//  Post.swift
//  Workshop
//
//  Created by Nikita Shirobokov on 13.12.22.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String 
}
