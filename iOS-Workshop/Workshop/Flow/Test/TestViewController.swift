//
//  TestViewController.swift
//  Workshop
//
//  Created by Nikita Shirobokov on 21.01.23.
//

import UIKit

final class TestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        tabBarItem = UITabBarItem(title: "Test", image: nil, selectedImage: nil)
    }
}
