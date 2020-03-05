//
//  TwoColumnView.swift
//  SwiftUIApp
//
//  Created by Fennur Mezitov on 05.03.2020.
//  Copyright © 2020 ePayments. All rights reserved.
//

import SwiftUI
import Combine

final class TwoColumnViewModel: ObservableObject {
    
    @Published private(set) var items = [[Int]]()
    
    init() {
        let i = (1...20).publisher.collect(2) // [[1,2], [3,4]]
        _ = i.collect().sink {
            self.items = $0
            print("sink \(self.items)")
        }
        
        print("//")
        print("init \(items)")

        
    }
}

struct TwoColumnView: View {
    
    @EnvironmentObject var viewModel: TwoColumnViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(0..<viewModel.items.count, id: \.self) { pair in
                    // Row
                    HStack(spacing: 10) {
                        ForEach(self.viewModel.items[pair], id: \.self) { number in
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.pink)
                                Text("\(number)")
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                        }
                    } // HStack
                } // ForEach
            } // VStack
        } // ScrollView
    }
}

struct TwoColumnView_Previews: PreviewProvider {
    static var previews: some View {
        TwoColumnView()
            .environmentObject(TwoColumnViewModel())
    }
}
