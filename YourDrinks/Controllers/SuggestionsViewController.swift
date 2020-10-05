//
//  SuggestionsViewController.swift
//  YourDrinks
//
//  Created by TiberiuOprea on 26/09/2020.
//

import UIKit

class SuggestionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTabButton() {
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        navigationController?.pushViewController(vc, animated: true)
    }
}
