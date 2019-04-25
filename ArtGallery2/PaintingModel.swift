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
    
    ////In numberOfSections, set your weak tableView Property ------- DO WE EVEN NEED TO SET THE TABLEVIEW PROPERTY HERE?
//    func numberOfSections(in tableView: UITableView) -> Int {
//        tableView.delegate = self
//
//        return 1
//    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paintings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PaintingTableViewCell else { return UITableViewCell() }
        
        //We can set the tableViewCell's properties here, we don't need to do a segue and pass the model, we can, but this is a different way.
        let painting = paintings[indexPath.row]
        cell.portraitView.image = painting.image
        
        //use a ternary operator to set the button property title. if its true set it to unlike.
        let likeButtonTitle = painting.isLiked ? "Unlike" : "like"
        cell.likeButtonProperties.setTitle(likeButtonTitle, for: .normal)
        
        
        //because we have access, in this function, to grab the tableViewCell's property "delegate" we can grab that and set this class to be the delegate
        cell.delegate = self
        
        return cell
    }
}

extension PaintingModel: PaintngTableViewCellDelegate {
    
    func toggleIsLiked(for painting: Painting){
        painting.isLiked = !painting.isLiked
    }
    func tappedLikeButton(on cell: PaintingTableViewCell) {
        print("delegate was triggered")
        
        //have to get the painting at said cell. We have to access its index path
        guard let index = tableView?.indexPath(for: cell) else { return }
        let paintingToChange = paintings[index.row]
        print("pantng indexpath: \(index.row)")
        print("painting isLiked before toggle: \(paintingToChange.isLiked)")
        
        toggleIsLiked(for: paintingToChange)
        print("painting isLked AFTER toggle: \(paintingToChange.isLiked)")
        tableView?.reloadData()
    }
}
