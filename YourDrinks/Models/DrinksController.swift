//
//  DrinksController.swift
//  YourDrinks
//
//  Created by TiberiuOprea on 27/09/2020.
//

import Foundation

class DrinksController {
    var drinks = [DrinkDTO]()
    var drinksDict = ["Sweet dreams" : "Something fresh for a nice summer evening in your backyard",
                      "Lemon something" : "Something fresh for a nice summer evening in your backyard",
                      "Green Apple Jeans" : "Green juice with cocoa and vodka, milk, honney",
                      "Blue Feeling" : "Somebody is feeling blue type of ingredients",
                      "Black Pepper" :  "Black Kiwi, Mango Juice, Jack Daniels"]
    
    init() { _ = load() }

    // Load the drinks from memory or disk
    func load() -> [DrinkDTO] {
        var i = 0
        drinksDict.forEach { (title, subtitle) in
            let drink = DrinkDTO()
            drink?.id = i
            drink?.title = title
            drink?.subtitle = subtitle
            drinks.append(drink!)
            i += 1
        }
        return drinks
    }
    
    func addDrink() {
        let drink = DrinkDTO()
        drink?.id = drinks.count
        drink?.title = "Sweet nice dreams"
        drink?.subtitle = "Something fresh for a nice summer evening in your backyard"
        drinks.append(drink!)
    }
    
    func deleteDrink(at: Int) {
        drinks.remove(at: at)
    }
    
}
