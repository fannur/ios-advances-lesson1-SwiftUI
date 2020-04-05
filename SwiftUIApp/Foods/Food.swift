//
//  Food.swift
//  SwiftUIApp
//
//  Created by Fennur Mezitov on 05.04.2020.
//  Copyright © 2020 ePayments. All rights reserved.
//

import Foundation

struct Food: Identifiable {
    let id = UUID()
    let name: String
    let isFav: Bool
}
