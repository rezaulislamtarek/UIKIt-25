//
//  NewsFeedViewController.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 12/11/25.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Articles"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupUI()
        setupConstraints()
    }
    
    func setupUI(){
        tableView.register(ArticleCellTableViewCell.self, forCellReuseIdentifier: ArticleCellTableViewCell.reuseIdentifier )
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.separatorStyle = .singleLine
        
        view.addSubviews(tableView)
    }
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension NewsFeedViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Article.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCellTableViewCell.reuseIdentifier, for: indexPath) as? ArticleCellTableViewCell else { return UITableViewCell()
        }
        let artile = Article.articles[indexPath.row]
        cell.config(with: artile)
        
        return cell
    }
    
    
}


#Preview{
    NewsFeedViewController()
}
