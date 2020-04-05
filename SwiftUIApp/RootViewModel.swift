//
//  RootViewModel.swift
//  SwiftUIApp
//
//  Created by Fennur Mezitov on 05.04.2020.
//  Copyright © 2020 ePayments. All rights reserved.
//

import Foundation

final class RootViewModel: ObservableObject {
    private static var _instance: RootViewModel?
    public static var instance: RootViewModel {
        if _instance == nil { _instance = RootViewModel() }
        return _instance!
    }
    
    private init() {
        
    }
    
    @Published public var currentTab = Tabs.first
}
