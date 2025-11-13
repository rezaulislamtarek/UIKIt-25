//
//  ArticleDetailsViewController.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 13/11/25.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    let article: Article
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let imageView = UIImageView()
    let authorLabel = UILabel()
    let timeLabel = UILabel()
    let details = UITextView()
    
    init(article: Article) {
        self.article = article
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = article.title
        navigationController?.navigationBar.prefersLargeTitles = true
        setupUI()
        setupConstructions()
    }
    
    func setupUI(){
        
    }
    
    func setupConstructions(){
        
    }
     
}

#Preview{
    ArticleDetailsViewController(article: Article.articles.first!)
}
