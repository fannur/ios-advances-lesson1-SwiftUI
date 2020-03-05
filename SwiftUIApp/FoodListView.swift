//
//  FoodListView.swift
//  SwiftUIApp
//
//  Created by Fennur Mezitov on 27.02.2020.
//  Copyright © 2020 ePayments. All rights reserved.
//

import SwiftUI

struct Food: Identifiable {
    let id = UUID()
    let name: String
    let isFav: Bool
}

final class FoodListViewModel: ObservableObject {
    
    @Published private(set) var filterButtonName = "Switch Faves"
    
    @Published private(set) var foods = [Food]()
    
    @Published private(set) var isLoading = false
    init() {
        loadFromServer()
    }
    
    func loadFromServer() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.foods = [Food(name: "Strawberry", isFav: true),
                         Food(name: "Cheese", isFav: false),
                         Food(name: "Apple", isFav: false),
                         Food(name: "Tomato", isFav: true)]
            self.isLoading = false
        }
    }
}

struct FilterView: View {
    @Binding var favedShowed: Bool
    
    @EnvironmentObject var viewModel: FoodListViewModel
    
    var body: some View {
        Toggle(isOn: $favedShowed) {
            Text(viewModel.filterButtonName)
        }
    }
}

struct FoodView: View {
    var body: some View {
        Text("☠️")
        .font(.largeTitle)
    }
}

struct FoodListView: View {
    
    @EnvironmentObject var viewModel: FoodListViewModel
    
    @State var favedShowed = false
    
        var body: some View {
            NavigationView {
                if viewModel.isLoading {
                    ActivityIndicatorView()
                    //Text("Loading...")
                } else {
                    List {
                        FilterView(favedShowed: $favedShowed).environmentObject(viewModel)
                        ForEach(viewModel.foods) { food in
                            if self.favedShowed == false || food.isFav  {
                                // ROW
                                NavigationLink(destination: FoodView()) {
                                    Text(food.name)
                                }
                            }
                        }
                    }.navigationBarTitle("Foods")
                }
            } // NavigationView
        }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView().environmentObject(FoodListViewModel())
    }
}
