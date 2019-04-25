//
//  PaintingTableViewCell.swift
//  ArtGallery2
//
//  Created by Michael Flowers on 4/25/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class PaintingTableViewCell: UITableViewCell {
    
    var painting: Painting?
    weak var delegate: PaintngTableViewCellDelegate? //We add the delegate variable here so that we can delegate this view's responsibility to someone else, in this case its paintingModel. In there is where we wll handle any changes to the view.
    
    @IBOutlet weak var portraitView: UIImageView!
    @IBOutlet weak var likeButtonProperties: UIButton!
    
    @IBAction func toggledAppreciation(_ sender: UIButton) {
        delegate?.tappedLikeButton(on: self) //this is to send the message back to the model controller that ths button was tapped, in the model controller is where we implement the functionalty --passing information backwards
    }
    
    private func updateView(){
        guard let passedInPainting = painting else { return }
        portraitView.image = passedInPainting.image
        
        //use a ternary operator to set the button property title. if its true set it to unlike.
        let likeButtonTitle = passedInPainting.isLiked ? "Unliked" : "liked"
        likeButtonProperties.setTitle(likeButtonTitle, for: .normal)
    }
}

