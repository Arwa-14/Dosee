//
//  NotificationRequest.swift
//  Dosee
//
//  Created by Arwa Ali Alshehri on 19/06/1444 AH.
//

import SwiftUI


struct NotificationRequest: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            VStack{
                Image("notification-icon")
               .offset(y: 30)
                Text("Everytime you want to take ansulin")
              .offset(y: -150)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor (Color("CenterButton"))
                Text("and sometimes forget your doses")
              .offset(y: -150)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor (Color("CenterButton"))
                
                //and sometimes forget your doses"
            }
    .offset(y: -20)
            VStack {
                Button(action: requestNotification, label: {
                    Text("Allow notifications")
                        .bold()
                     //   .padding(12)
                        .frame(width: 200, height:55)
                        .background(Color("TabBarHighlight"))
                        .cornerRadius(16)
                        .padding(.horizontal,40)
                        .foregroundColor(.white)
                })
                .buttonStyle(PlainButtonStyle())
            }
         .offset(y: -30)
        }
    }
    
    private func requestNotification() {
        NotificationManager.shared.requestNotificationPermission {
            withAnimation {
                DispatchQueue.main.async {
                    self.viewRouter.currentPage = .alarm
                }
            }
        }
    }
}

struct NotificationRequest_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRequest()
    }
}
