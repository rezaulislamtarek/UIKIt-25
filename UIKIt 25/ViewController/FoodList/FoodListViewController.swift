//
//  FoodListViewController.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 13/11/25.
//

import UIKit

class FoodListViewController: UIViewController {

    enum Section {
        case fruits
        case vegetables
    }
    
    private let tableview = UITableView()
    private var dataSource: UITableViewDiffableDataSource<Section, FoodItem>! = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Food List"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupUI()
        setupConstraints()
        configTableView()
        applySnapShot()
    }
    
    private func setupUI() {
        tableview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableview)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configTableView() {
        tableview.register(FoodCell.self, forCellReuseIdentifier: FoodCell.reuseIdentifier)
        tableview.delegate = self
        dataSource = UITableViewDiffableDataSource<Section, FoodItem>(tableView: tableview) { tableView, indexPath, item in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: FoodCell.reuseIdentifier, for: indexPath) as! FoodCell
            cell.config(with: item)
            return cell
        }
    }
    
    private func applySnapShot() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, FoodItem>()
        snapShot.appendSections([.fruits, .vegetables])
        snapShot.appendItems(FoodItem.fruits, toSection: .fruits)
        snapShot.appendItems(FoodItem.vegetables, toSection: .vegetables)
        
        dataSource.apply(snapShot)
    }
    
}

extension FoodListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView()
        header.backgroundColor = .white
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        
        let sectionType = dataSource.snapshot().sectionIdentifiers[section]
        
        switch sectionType {
        case .fruits:
            label.text = "🍎 FRUITS"
        case .vegetables:
            label.text = "🥕 VEGETABLES"
        }
        
        header.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: header.topAnchor, constant: 6),
            label.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -6)
        ])
        
        return header
    }
}

#Preview{
    FoodListViewController()
}
