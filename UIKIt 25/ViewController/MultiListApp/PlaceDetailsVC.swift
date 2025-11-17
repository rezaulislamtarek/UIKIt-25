//
//  PlaceDetailsVC.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 17/11/25.
//

import UIKit

class PlaceDetailsVC: UIViewController {
    let placeId : Int
    var vm : PlaceDetailsViewModel
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    var placeImage : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        iv.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        return iv
    }()
    
    let placeNameLabel: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 18, weight: .bold)
        lb.textColor = .label
        return lb
    }()
    
    let locationIv : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.widthAnchor.constraint(equalToConstant: 20).isActive = true
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    var labelAddress : UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 14, weight: .bold)
        lb.textColor = .secondaryLabel
        return lb
    }()
    
    let labelDetail : UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 14, weight: .bold)
        lb.textColor = .secondaryLabel
        return lb
    }()
    let labelDetailText : UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 14)
        lb.textColor = .secondaryLabel
        lb.numberOfLines = 0
        return lb
    }()
    
    let labelDetailText2 : UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 14)
        lb.textColor = .secondaryLabel
        lb.numberOfLines = 0
        return lb
    }()
    
    init(placeId: Int, vm : PlaceDetailsViewModel = PlaceDetailsViewModel() ) {
        self.placeId = placeId
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Place details"
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        let addressStack = UIStackView(arrangedSubviews: [ locationIv, labelAddress])
        addressStack.axis = .horizontal
        addressStack.spacing = 4
        addressStack.alignment = .center
        addressStack.distribution = .fill
        
        
        let stack = UIStackView(arrangedSubviews: [
            placeImage, placeNameLabel, addressStack, labelDetail, labelDetailText, labelDetailText, labelDetailText2
        ])
        stack.axis = .vertical
        stack.spacing = 8
        contentView.addSubview(stack)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor ),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor ),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        Task {
            await vm.fetchPlaceDetails(id: placeId)
            if let place = vm.place {
                setData(place: place)
            }
        }
        
        
    }
    
    func setData(place : Place){
        placeImage.setImageFromURL(Endpoints.baseUrl+place.photo)
        placeNameLabel.text = place.placeName
        labelDetail.text = "Details"
        labelDetailText.text = place.placeDetails
        labelDetailText2.text = (place.placeDetails ?? "") + "\n" + (place.placeDetails ?? "")
        locationIv.image = UIImage(systemName: "location")
        labelAddress.text = "\(place.villageName), \(place.unionName)"
    }
    
}

#Preview{
    PlaceDetailsVC(placeId: 5, vm: PlaceDetailsViewModel(service: PlaceService()))
}
