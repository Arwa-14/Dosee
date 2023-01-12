//
//  ContentView.swift
//  Boarding Animation
//
//  Created by Arwa Ali Alshehri on 17/06/1444 AH.
//

import SwiftUI

struct onbordView: View {
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        
        VStack {
           
          Home(viewRouter: viewRouter)
        }
       
    }
}

//struct onbordView_Previews: PreviewProvider {
//    static var previews: some View {
//        onbordView()
//    }
//}
struct Home: View{
   
    @State var offset: CGSize = .zero
    @State var showHome = false
    @State var ispressed = false
    @StateObject var viewRouter: ViewRouter
    var body: some View{
        ZStack{
            Color("CenterButton")
                .overlay(
                    VStack(alignment: .leading, spacing: 10, content:{
                        Text ("Welcome to Dosee Reminder")
                            .font (.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor (Color("bg"))
                        Text ("It's easier with us ..")
                            .font(.largeTitle)
                            .fontWeight (.bold)
                    })
                    .foregroundColor (.white)
                    .padding (.horizontal, 30)
                    .offset(x: -15)
                    )
            .clipShape(LiquidSwipe(offset:offset))
            .ignoresSafeArea()
            .overlay(
            Image(systemName:"chevron.left")
                .renderingMode(.template).foregroundColor(Color("CenterButton"))
                .font(.largeTitle)
                .frame (width: 50, height: 50)
                .contentShape(Rectangle())
                .gesture(DragGesture().onChanged({ (value) in
                   
                    withAnimation(.interactiveSpring(response: 0.7,dampingFraction: 0.6, blendDuration: 0.6)){
                        offset = value.translation
                    }
                }).onEnded({(value) in
                   
                    let screen = UIScreen.main.bounds
                    withAnimation(.spring()){
                        if -offset.width > screen.width / 2{
                            offset.width = -screen.height
                            showHome.toggle()
                    }
                        else{
                        offset = .zero
                    }
                    }
                }))
                .offset(x:15,y:58)
            
                .opacity(offset == .zero ? 1 : 0)
            ,alignment: .topTrailing
            )
           .padding(.trailing)
            
            if showHome{
                Image(("onBoarding")).resizable()//.frame(width: 400, height: 814.0)
                    .aspectRatio(contentMode: .fill)
                    .padding(.bottom, 20)
                
                HStack{
                    Text ("Diabete care  \n at your fingertips")
                        .font (.title)
                        .fontWeight(.bold)
                        .foregroundColor (.white)
                    Spacer()
                    
                }
                .padding(.leading)
                ZStack{
                    
                    Button(action:{
                        ispressed = true
                    }){Text("Get Started")
                        .bold()
                        .padding(12)
                        .frame(width: 200, height:55)
                        .background(Color("TabBarHighlight"))
                        .cornerRadius(16)
                        .padding(.horizontal,40)
                        .foregroundColor(.white)
                    
                    }.fullScreenCover(isPresented: $ispressed, content: NotificationRequest.init)
                    .padding(.top, 650)
//                    .onTapGesture {
//                        MainView(viewRouter: viewRouter)
//                    }
                //.fullScreenCover(isPresented: $ispressed, content: MainView.init)
                    
                }
               
            }
        }.accessibilityLabel(Text(""))
    }
}

struct LiquidSwipe: Shape {
    
    var offset: CGSize
    
    var animatableData: CGSize.AnimatableData{
        get{return offset.animatableData}
        set{offset.animatableData=newValue}
    }
    func path(in rect: CGRect) -> Path {
        return Path{path in
           
            let width = rect.width + (-offset.width > 0 ? offset.width : 0)
            path.move(to: CGPoint (x:0, y: 0))
            path.addLine (to: CGPoint(x: rect.width, y: 0))
            path.addLine (to: CGPoint(x: rect.width, y: rect.height))
            path.addLine (to: CGPoint(x: 0, y: rect.height))
            
            let from = 80 + (offset.width)
            path.move (to: CGPoint(x: rect.width, y:from > 80 ? 80 : from))
          
            
            var to = 180+(offset.height) + (-offset.width)
            to = to < 180 ? 180 : to
            
            let mid : CGFloat = 80 + ((to - 80) / 2)
            
            path.addCurve(to: CGPoint(x: rect.width, y: to), control1: CGPoint(x: width-50, y: mid), control2: CGPoint(x: width-50, y: mid))
          
        }
    }
}
