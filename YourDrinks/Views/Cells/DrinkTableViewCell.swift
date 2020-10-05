//
//  DrinkTableViewCell.swift
//  YourDrinks
//
//  Created by TiberiuOprea on 26/09/2020.
//

import UIKit

class DrinkTableViewCell: UITableViewCell {
    lazy var backView = backRes()
    lazy var nameLbl = addLabel()
    
    @IBOutlet weak var mainContent: UIView!
    func addLabel() -> UILabel {
        let lab = UILabel(frame: CGRect(x: 116, y : 8, width:self.frame.width - 116, height: 30))
        lab.textAlignment = .left
        lab.font = UIFont.boldSystemFont(ofSize: 18)
        return lab
    }
    
    func backRes() -> UIView {
        let view = UIView(frame: CGRect(x: 10, y : 6, width:self.frame.width - 20, height: 110))
        view.backgroundColor = UIColor.green
        return view
    }

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        // Configure the view for the selected state
    }
    
}
