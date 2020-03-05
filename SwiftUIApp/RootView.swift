//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by Fennur Mezitov on 27.02.2020.
//  Copyright © 2020 ePayments. All rights reserved.
//

import SwiftUI



struct RootView: View {
    
    @EnvironmentObject var foodListViewModel: FoodListViewModel
    
    @State private var selection = 0
    
    var body: some View {
        TabView {
            FoodListView()
                .environmentObject(foodListViewModel)
                .tag(0)
                .tabItem {
                    VStack {
                        Text("Foods")
                        Image(systemName: "flame.fill")
                    }
                }
            AboutView()
                .tag(1)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("About")
                }
        }
    }
    

}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

// MARK: - Views

struct AboutView: View {
    
    @State var aboutShowed: Bool = false
    
    var body: some View {
        VStack {
            Text("About App")
                .simultaneousGesture(TapGesture().onEnded {
                    self.aboutShowed.toggle()
                })
        }
        .sheet(isPresented: $aboutShowed, onDismiss: { print("Modal closed") }) {
            AboutViewModal()
        }
    }
}

struct AboutViewModal: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Close")
            }
            Spacer()
            Image(systemName: "tortoise.fill")
                .foregroundColor(.red)
                .font(.largeTitle)
            Spacer()
            Spacer()
        }
    }
}
