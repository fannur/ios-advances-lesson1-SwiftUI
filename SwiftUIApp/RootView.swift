//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by Fennur Mezitov on 27.02.2020.
//  Copyright © 2020 ePayments. All rights reserved.
//

import SwiftUI

enum Tabs: Hashable {
    case first
    case foods
    case about
    case twoColumns
}

struct RootView: View {
    
    @EnvironmentObject var foodListViewModel: FoodListViewModel
    @EnvironmentObject var twoColumnViewModel: TwoColumnViewModel
    @EnvironmentObject var viewModel: RootViewModel
    
    var body: some View {
        TabView(selection: $viewModel.currentTab) {
            FirstTabView()
                .tag(Tabs.first)
                .tabItem {
                    Image(systemName: "triangle.fill")
                    Text("First")
                }
            FoodListView()
                //.environmentObject(foodListViewModel)
                .tag(Tabs.foods)
                .tabItem {
                    VStack {
                        Text("Foods")
                        Image(systemName: "flame.fill")
                    }
                }
            AboutView()
                .tag(Tabs.about)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("About")
                }
            TwoColumnView()
                //.environmentObject(twoColumnViewModel)
                .tag(Tabs.twoColumns)
                .tabItem {
                    VStack {
                        Text("TwoColumns")
                        Image(systemName: "square.fill")
                    }
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
