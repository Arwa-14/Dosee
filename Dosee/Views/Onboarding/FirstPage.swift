//
//  FirstPage.swift
//  Dosee
//
//  Created by Arwa Ali Alshehri on 19/06/1444 AH.
//

import SwiftUI


struct FirstPage: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("stalarm-icon")
            Text("My doses")
                .font(.title)
            Text("An alarm that improve your \n self-discipline")
                .multilineTextAlignment(.center)
                .font(.title3)
        }
        .offset(y: -100)
    }
}

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage()
    }
}
