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
                let painting = Painting(image: image, isLiked: false)
                paintings.append(painting)
            }
        }
    }
}

extension PaintingModel: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tableView.delegate = self
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paintings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let painting = paintings[indexPath.row]
        cell.imageView?.image = painting.image
        
        return cell
    }
    
}
