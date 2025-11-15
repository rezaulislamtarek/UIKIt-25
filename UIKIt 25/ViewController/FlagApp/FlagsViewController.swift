//
//  FlagsViewController.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 14/11/25.
//

import UIKit
import Kingfisher
import Combine

class FlagsViewController: UIViewController {
    private var cancellables = Set<AnyCancellable>()
    var vm = FlagViewModel()
    private let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Flags"
        setupUI()
        observeFlags()
        vm.loadFlags()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
    }
    
    private func setupUI() {
        self.view.addSubview(flagImageView)
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            flagImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            flagImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            flagImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            flagImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
    func setImageFromURL(_ url: String) {
        flagImageView.kf.setImage(with: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Flag_of_Bangladesh.svg/2560px-Flag_of_Bangladesh.svg.png"), placeholder:  UIImage(systemName: "photo"), options: [
            .transition(.fade(0.2)),
            .cacheOriginalImage
        ])
    }
    
    func observeFlags(){
        vm.$flags.receive(on: DispatchQueue.main)
            .sink { [weak self] flags in
                if let firstFlagURL = flags.first?.rectangleImageUrl {
                    self?.setImageFromURL(firstFlagURL)
                }
            }.store(in: &cancellables)
    }
    
}
