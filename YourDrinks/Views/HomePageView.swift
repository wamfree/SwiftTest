//
//  HomePageView.swift
//  YourDrinks
//
//  Created by TiberiuOprea on 27/09/2020.
//

import UIKit
import Speech

struct HomePageView {
    func addNewDrinkAlert() -> UIAlertController {
        let ac = UIAlertController(title: "Add New Drink",
                                   message: "This feature is not ready yet. For the momment just adds another dummy row", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .cancel))
        return ac
    }

    func handlePermissionGranted() -> UIAlertController {
        let ac = UIAlertController(title: "Speech recognition",
                                   message: "This feature is not ready yet", preferredStyle: .alert)
        //ac.addAction(UIAlertAction(title: "Start", style: .default))
        ac.addAction(UIAlertAction(title: "Ok", style: .cancel))
        return ac
    }
    
}

