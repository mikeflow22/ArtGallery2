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
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paintings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PaintingTableViewCell else { return UITableViewCell() }
        
        //pass the painting at indexpath.row to the tableViewCell's painting property.
        let paintingToPass = paintings[indexPath.row]
        cell.painting = paintingToPass
        
        //because we have access, in this function, to grab the tableViewCell's property "delegate" we can grab that and set this class to be the delegate
        cell.delegate = self
        
        return cell
    }
}

extension PaintingModel: PaintngTableViewCellDelegate {
    
    func toggleAppreciation(for painting: Painting){
        painting.isLiked = !painting.isLiked
    }
    func tappedLikeButton(on cell: PaintingTableViewCell) {
        <#code#>
    }
    
    
}
