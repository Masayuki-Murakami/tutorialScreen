//
//  TableViewCell.swift
//  TutorialScreen
//
//  Created by 村上匡志 on 2023-06-08.
//

import UIKit

class TableViewCell: UITableViewCell {
  
  @IBOutlet var label: UILabel!
  @IBOutlet var bgView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }

}
