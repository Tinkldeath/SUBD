//
//  PlayerCell.swift
//  MusicalPlayer
//
//  Created by Dima on 7.12.22.
//

import UIKit

class PlayerCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var associatedImage: UIImageView!
    
    
    func setup(_ title: String, _ details: String, _ image: UIImage) {
        self.title.text = title
        self.details.text = details
        self.associatedImage.image = image
    }
    
}
