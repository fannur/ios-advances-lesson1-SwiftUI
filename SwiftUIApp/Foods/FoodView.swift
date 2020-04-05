//
//  FoodView.swift
//  SwiftUIApp
//
//  Created by Fennur Mezitov on 05.04.2020.
//  Copyright © 2020 ePayments. All rights reserved.
//

import SwiftUI

struct FoodView: View {
    var name: String

    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        HStack {
            Text("☠️")
                .font(.largeTitle)
            Text(name)
                .font(.largeTitle)
        }
    }
}
