//
//  CustomTableViewCell.swift
//  YourDrinks
//
//  Created by TiberiuOprea on 26/09/2020.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    lazy var backView = backRes()
    lazy var nameLbl = addLabel()
    
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
    
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
    }
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(nameLbl)
        // Configure the view for the selected state
    }
    
}
