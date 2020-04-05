//
//  AboutView.swift
//  SwiftUIApp
//
//  Created by Fennur Mezitov on 05.04.2020.
//  Copyright © 2020 ePayments. All rights reserved.
//

import SwiftUI


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
