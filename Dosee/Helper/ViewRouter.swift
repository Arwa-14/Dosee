//
//  ViewRouter.swift
//  Dosee
//
//  Created by Arwa Ali Alshehri on 19/06/1444 AH.
//

import SwiftUI

enum Page {
    case onboarding
    case notificationRequest
    case alarm
    case timer
}

class ViewRouter: ObservableObject {
    @Published var currentPage: Page
    
    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            currentPage = .onboarding
        } else {
            currentPage = .alarm
        }
    }
}

