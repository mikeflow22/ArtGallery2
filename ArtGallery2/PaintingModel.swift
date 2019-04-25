//
//  PaintingModel.swift
//  ArtGallery2
//
//  Created by Michael Flowers on 4/25/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
import UIKit

class PaintingModel: NSObject {
    
    weak var tableView: UITableView? //You need this reference to be able to respond to the tappedLikeButton call.
    var paintings: [Painting] = []
    
    override init() {
        super.init()
        loadImages()
    }
    
    func loadImages(){
        for num in 1...12 {
            if let image = UIImage(named: "Image\(num)") {
                let painting = Painting(image: image)
                paintings.append(painting)
            }
        }
    }
}


