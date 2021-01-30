//
//  ContentView.swift
//  AppStoreCard
//
//  Created by Ravi Tripathi on 30/01/21.
//

import SwiftUI

struct ContentView: View {
    @State private var pressed: Bool = false
    var cardData: [CardData] = {
        
        var cd = [CardData]()
        for i in 1...30 {
            cd.append(CardData(id: i, title: "This is a great app", subTitle: "This is the app description"))
        }
        return cd
        
        
        
    }()
    @State private var active: Bool = false
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(cardData) { cD in
                        Button(action: { self.pressed.toggle()
                        }) {
                            NavigationLink(destination: CardView(title: cD.title, subTitle: cD.subTitle)) {
                                CardView(title: cD.title, subTitle: cD.subTitle)
                            }.buttonStyle(PlainButtonStyle())
                        }.buttonStyle(tapBounceButtonStyle())
                        .padding()
                    }
                }
            }
            //        Got a slightly better performance in LazyVStack
            //        List(cardData) { cD in
            //            Button(action: { self.pressed.toggle() }) {
            //                CardView(title: cD.title, subTitle: cD.subTitle)
            //            }.buttonStyle(tapBounceButtonStyle())
            //        }
        }
    }
}

/// https://stackoverflow.com/questions/60882198/swiftui-draggesture-in-scrollview-doesnt-register-scrolling-when-swipe-begins
struct tapBounceButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeInOut)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardData: Identifiable {
    var id: Int
    var title: String
    var subTitle: String
}
