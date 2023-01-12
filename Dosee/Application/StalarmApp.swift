//
//  StalarmApp.swift
//  Dosee
//
//  Created by Arwa Ali Alshehri on 19/06/1444 AH.
//


import SwiftUI
import CoreData

@main
struct DoseeApp: App {
    @StateObject var viewRouter = ViewRouter()
    @StateObject var notificationRequestManager = NotificationRequestManager()
    
    var body: some Scene {
        WindowGroup {
            MainView(viewRouter: viewRouter)
                .environmentObject(notificationRequestManager)
        }
    }
}
