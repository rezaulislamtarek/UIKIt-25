//
//  MultiListVC.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 16/11/25.
//

import UIKit

enum Section: Int, CaseIterable {
    case places
    case ambulances
}

enum Item : Hashable {
    case place(Place)
    case ambiumance(Transport)
}

class MultiListVC: UIViewController {
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private var dataSources : UITableViewDiffableDataSource<Section,Item>!
    private let vm = MultiListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupDataSource()
        
        Task{
            await vm.loadData()
            applySnapshot()
        }
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        tableView.register(PlaceCell.self, forCellReuseIdentifier: PlaceCell.reuseIdentifier)
        tableView.register(AmbulanceCell.self, forCellReuseIdentifier: AmbulanceCell.reuseIdentifier)
    }
    
    private func setupDataSource() {
        dataSources = UITableViewDiffableDataSource<Section, Item>(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .place(let place):
                let cell = tableView.dequeueReusableCell(withIdentifier: PlaceCell.reuseIdentifier, for: indexPath) as! PlaceCell
                cell.config(with: place)
                return cell
                
            case .ambiumance(let amb):
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: AmbulanceCell.reuseIdentifier,
                    for: indexPath
                ) as! AmbulanceCell
                cell.configure(with: amb)
                return cell
            }
        })
    }
    
    private func applySnapshot() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapShot.appendSections([.places, .ambulances])
        snapShot.appendItems(vm.places.map {.place($0) }, toSection: .places)
        snapShot.appendItems(vm.ambulances.map {.ambiumance($0) }, toSection: .ambulances)
        
        dataSources.apply(snapShot, animatingDifferences: true)
    }
}
