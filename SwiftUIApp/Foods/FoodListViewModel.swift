//
//  FoodListViewModel.swift
//  SwiftUIApp
//
//  Created by Fennur Mezitov on 05.04.2020.
//  Copyright © 2020 ePayments. All rights reserved.
//

import SwiftUI

final class FoodListViewModel: ObservableObject {
    
    private static var _instance: FoodListViewModel?
    public static var instance: FoodListViewModel {
        if _instance == nil { _instance = FoodListViewModel() }
        return _instance!
    }
    
    @Published private(set) var filterButtonName = "Switch Faves"
    @Published private(set) var foods = [Food]()
    @Published private(set) var isLoading = false
    @Published var selectedItem: UUID?
    
    private init() {
        loadFromServer()
    }
    
    func loadFromServer() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.foods = [Food(name: "Strawberry", isFav: true),
                         Food(name: "Cheese", isFav: false),
                         Food(name: "Apple", isFav: false),
                         Food(name: "Tomato", isFav: true)]
            self.isLoading = false
        }
    }
}
