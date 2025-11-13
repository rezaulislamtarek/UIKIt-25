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
        tableView.register(ArticleCell.self, forCellReuseIdentifier: ArticleCell.reuseIdentifier )
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
        
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        
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
    
    private func toggleFavourite(for indexPath: IndexPath, cell: ArticleCell) {
        guard Article.articles.indices.contains(indexPath.row) else { return }
        Article.articles[indexPath.row].isFavourite.toggle()
        let isFavourite = Article.articles[indexPath.row].isFavourite
        cell.setFavourite(isFavourite)
    }
}

extension NewsFeedViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Article.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.reuseIdentifier, for: indexPath) as? ArticleCell else { return UITableViewCell()
        }
        let article = Article.articles[indexPath.row]
        cell.config(with: article)
        cell.selectionStyle = .none
        cell.delegate = self
        
        return cell
    }
    
}

extension NewsFeedViewController : ArticleCellDelegate {
    func didTapOnFavouriteButton(cell: ArticleCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        toggleFavourite(for: indexPath, cell: cell)
    }
    
     
}


#Preview{
    NewsFeedViewController()
}
