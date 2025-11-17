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
    private let tableView = UITableView()
    private var dataSources : UITableViewDiffableDataSource<Section,Item>!
    private let vm = MultiListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Multi List"
        setupTableView()
        setupDataSource()
        Task{
            await vm.loadData()
            applySnapshot()
        }
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.rowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor ),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor ),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor ),
        ])
        
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
        
        dataSources.apply(snapShot, animatingDifferences: false)
    }
}


extension MultiListVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // diffable data source থেকে item বের করছি
        guard let item = dataSources.itemIdentifier(for: indexPath) else { return }
        
        switch item {
        case .place(let place):
            print("place")
            let vc = PlaceDetailsVC(placeId: place.placeId)
            navigationController?.pushViewController(vc, animated: true)
        case .ambiumance(let amb):
            print("Ambulance \(amb)")
        }
    }
}
