//
//  Painting.swift
//  ArtGallery2
//
//  Created by Michael Flowers on 4/25/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
import UIKit

class Painting {
    let image: UIImage
    var isLiked: Bool
    
    init(image: UIImage, isLiked: Bool = false) {
        self.image = image
        self.isLiked = isLiked
    }
}
