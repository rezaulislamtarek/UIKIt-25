//
//  UIImageView+Extension.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 16/11/25.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImageFromURL(_ url: String) {
        self.kf.setImage(with: URL(string: url), placeholder:  UIImage(systemName: "photo"), options: [
            .transition(.fade(0.2)),
            .cacheOriginalImage
        ])
    }
}
