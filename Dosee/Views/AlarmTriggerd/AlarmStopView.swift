//
//  AlarmStopView.swift
//  Dosee
//
//  Created by Arwa Ali Alshehri on 19/06/1444 AH.
//

import SwiftUI


struct AlarmStopView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var notificationRequestManager: NotificationRequestManager
    @Binding var currentPage: Int
    
    var alarmTime: Int16
    
    @ObservedObject private var viewModel = AlarmTriggeredViewModel()
    
    init(currentPage: Binding<Int>, alarmTime: Int16) {
        self._currentPage = currentPage
        self.alarmTime = alarmTime
        
        self.viewModel.activityDuration = alarmTime
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.08293265849, green: 0.2706470191, blue: 0.6344409585, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.6031056046, blue: 0.7491990924, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack(spacing: 40) {
                
            
                Text(viewModel.activityStatus)
                    .font(.title2)
                Spacer()
                if viewModel.alarmStopped {
                    Button(action: finishActivity, label: {
                        Text("Finish")
                            .frame(width: 250, height: 45, alignment: .center)
                            .background(Color("bg"))
                            .cornerRadius(25)
                            .foregroundColor(.black)
                    })
                    .buttonStyle(PlainButtonStyle())
                    .offset(y: -250)
                }
            }
            .offset(y: 125)
        }
        .foregroundColor(.white)
        .edgesIgnoringSafeArea(.all)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
    
    private func finishActivity() {
        withAnimation {
            notificationRequestManager.notificationData = nil
            
            currentPage = 3
            viewRouter.currentPage = .alarm
        }
    }
}

struct AlarmStopView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmStopView(currentPage: .constant(2), alarmTime: 10)
    }
}

