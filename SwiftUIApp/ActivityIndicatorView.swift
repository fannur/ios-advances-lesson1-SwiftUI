//
//  ActivityIndicatorView.swift
//  SwiftUIApp
//
//  Created by Fennur Mezitov on 05.03.2020.
//  Copyright © 2020 ePayments. All rights reserved.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
 
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorView>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
 
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicatorView>) {
        uiView.startAnimating()
    }
}
