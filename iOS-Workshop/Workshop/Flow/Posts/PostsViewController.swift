//
//  PostsViewController.swift
//  Workshop
//
//  Created by Nikita Shirobokov on 14.01.23.
//

import UIKit
import SnapKit

private extension String {
    static let postCell = "PostCell"
}

protocol IPostsView: AnyObject {
    
}

final class PostsViewController: UIViewController {
    private let output: IPostsPresentor?
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.register(PostCell.self, forCellReuseIdentifier: .postCell)
        return table
    }()
    
    init(output: IPostsPresentor) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

extension PostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output?.getNumberOfPosts() ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: .postCell, for: indexPath)
        if let postCell = (cell as? PostCell),
           let model = output?.getPost(at: indexPath.row) {
            postCell.configure(PostCellViewModel(title: model.title, text: model.body))
        }
        return cell
    }
}
