//
//  SingleUserTableViewCell.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 24/03/22.
//

import UIKit

class SingleUserTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var ivUserImage: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserEmail: UILabel!
    
    //MARK: - UITableViewCell
    override func awakeFromNib() {
        super.awakeFromNib()
        ivUserImage.layer.masksToBounds = true
        ivUserImage.layer.cornerRadius = ivUserImage.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
        
}//End of class
