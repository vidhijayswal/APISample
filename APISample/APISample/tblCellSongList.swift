//
//  tblCellSongList.swift
//  APISample
//
//  Created by vidhi jayswal on 12/02/19.
//  Copyright © 2019 vidhi jayswal. All rights reserved.
//

import UIKit

class tblCellSongList: UITableViewCell
{
    @IBOutlet weak var lblSongName: UILabel!
    
    @IBOutlet weak var lblartistname: UILabel!
    
    @IBOutlet weak var myImageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
