//
//  FoodListView.swift
//  SwiftUIApp
//
//  Created by Fennur Mezitov on 27.02.2020.
//  Copyright © 2020 ePayments. All rights reserved.
//

import SwiftUI

struct FilterView: View {
    @Binding var favedShowed: Bool
    @EnvironmentObject var viewModel: FoodListViewModel
    
    var body: some View {
        Toggle(isOn: $favedShowed) {
            Text(viewModel.filterButtonName)
        }
    }
}

struct FoodListView: View {

    @EnvironmentObject var viewModel: FoodListViewModel
    @State var favedShowed = false
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ActivityIndicatorView()
            } else {
                List {
                    FilterView(favedShowed: $favedShowed)
                    
                    ForEach(viewModel.foods) { food in
                        
                        if self.favedShowed == false || food.isFav  {
                            
                            NavigationLink(destination: FoodView(name: food.name),
                                           tag: food.id,
                                           selection: self.$viewModel.selectedItem) {
                                            
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
        FoodListView().environmentObject(FoodListViewModel.instance)
    }
}
