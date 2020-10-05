//
//  HomePageViewController.swift
//  YourDrinks
//
//  Created by TiberiuOprea on 26/09/2020.
//

import UIKit
import Speech

class HomePageViewController: UIViewController {
    
    let drinkCellId = "DrinkTableViewCell"
    var searchController = UISearchController(searchResultsController: nil)
    let tableView = UITableView()
    let drinksController = DrinksController()
    let hpView = HomePageView()
    var searchDrinks = [DrinkDTO]()
    var searching = false
    
    @IBOutlet weak var mainContainer: UIView!

    @IBAction func AddButton(_ sender: Any) {
        drinksController.addDrink()
        tableView.reloadData()
        checkEmptyTable()
        present(hpView.addNewDrinkAlert(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    func prepareView() {
        fixNavigationBarHeigth() 
        addSearchBar()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.frame = self.view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.white
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.register(UINib(nibName: drinkCellId, bundle: nil), forCellReuseIdentifier: drinkCellId)
        self.view.addSubview(tableView)
        checkEmptyTable()
    }
    
    func checkEmptyTable() {
        tableView.isHidden = drinksController.drinks.count == 0
        mainContainer.isHidden = !tableView.isHidden
    }
 
    func addSearchBar() {
        searchController.searchBar.delegate = self
        searchController.searchBar.showsBookmarkButton = true
        searchController.searchBar.setImage(UIImage(systemName: "mic.fill"), for: .bookmark, state: .normal)
        self.navigationItem.searchController = searchController
    }
    
    func requestTranscribePermissions() {
        SFSpeechRecognizer.requestAuthorization { [unowned self] authStatus in
            DispatchQueue.main.async {
                if authStatus == .authorized {
                    present(hpView.handlePermissionGranted(), animated: true)
                } else {
                    print("Transcription permission was declined.")
                }
            }
        }
    }
    
    func fixNavigationBarHeigth() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = UIColor(hex: "#F9F9F9")
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.compactAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
            navigationController?.navigationBar.isTranslucent = false
        }
    }
    
//    func transcribeAudio(url: URL) {
//        // create a new recognizer and point it at our audio
//        let recognizer = SFSpeechRecognizer()
//        let request = SFSpeechURLRecognitionRequest(url: url)
//
//        // start recognition!
//        recognizer?.recognitionTask(with: request) { [unowned self] (result, error) in
//            // abort if we didn't get any transcription back
//            guard let result = result else {
//                print("There was an error: \(error!)")
//                return
//            }
//
//            // if we got the final transcription back, print it
//            if result.isFinal {
//                // pull out the best transcription...
//                print(result.bestTranscription.formattedString)
//            }
//        }
//    }
    
}

extension HomePageViewController: UISearchBarDelegate {
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
      requestTranscribePermissions()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText.count > 2 else { searching = false; tableView.reloadData(); return }
        let searchTextToLower = searchText.lowercased()
        searchDrinks = drinksController.drinks.filter({
                            $0.title!.lowercased().contains(searchTextToLower) ||
                            $0.subtitle!.lowercased().contains(searchTextToLower) })
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchDrinks.count
        }
        return drinksController.drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkTableViewCell", for: indexPath) as! DrinkTableViewCell
        if searching {
            cell.titleLabel.text = searchDrinks[indexPath.row].title
            cell.subTitleLabel.text = searchDrinks[indexPath.row].subtitle
        } else {
            cell.titleLabel.text = drinksController.drinks[indexPath.row].title
            cell.subTitleLabel.text = drinksController.drinks[indexPath.row].subtitle
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row selected")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            drinksController.deleteDrink(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            checkEmptyTable()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}



