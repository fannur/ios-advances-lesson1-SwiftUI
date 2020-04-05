//
//  FirstTabView.swift
//  SwiftUIApp
//
//  Created by Fennur Mezitov on 04.04.2020.
//  Copyright © 2020 ePayments. All rights reserved.
//

import SwiftUI

struct FirstTabView: View {
    var body: some View {
        Button(action: {
            // Переход на вторую вкладку
            RootViewModel.instance.currentTab = .foods
            // Переход на первый элемент списка через 3 сек
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                FoodListViewModel.instance.selectedItem = FoodListViewModel.instance.foods.first?.id
            }
        }) {
            Text("Go to Foods")
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                .lineLimit(nil)
        }
    }
}

struct FirstTabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabView()
    }
}
