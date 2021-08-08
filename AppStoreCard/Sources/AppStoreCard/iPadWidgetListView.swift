//
//  iPadWidgetListView.swift
//  AppStoreCard
//
//  Created by Ravi Tripathi on 13/02/21.
//

import SwiftUI

struct iPadWidgetListView: View {
    let maxX = UIScreen.main.bounds.maxX
    var cardData: [CardData] = {
        
        var cd = [CardData]()
        for i in 1...30 {
            cd.append(CardData(id: i, title: "This is a great app", subTitle: "This is the app description"))
        }
        return cd
        
        
        
    }()
    var currentDateString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: Date())
    }
    
    let bounds = UIScreen.main.bounds
    var body: some View {
        ScrollView {
            VStack {
                ForEach(cardData) { cD in
                    GeometryReader { geo in
                        CardView(title: "Card Number: \(cD.id)", subTitle: cD.subTitle)
                            .opacity(Double(opacity(cardGeo: geo)))
                            .animation(.easeInOut(duration: 0.5))
//                            .blur(radius: (multiplier(cardGeo: geo) == 1.0) ? 0.0 : 3.0)
                            .scaleEffect(multiplier(cardGeo: geo))
                            .animation(.easeIn(duration: 0.5))
                    }.frame(height: 350.0)
                    .padding(EdgeInsets(top: 16.0, leading: 20.0, bottom: 16.0, trailing: 20.0))
                }
            }
        }
    }
    //        Awesome butterfly animations
    //        .rotation3DEffect(Angle(degrees: Double(geo.frame(in: .global).minY - 20.0 / 4)), axis: (x: 20, y: 20, z: 20))
    
    func multiplier(cardGeo geo: GeometryProxy) -> CGFloat {
        // Range from top
        let eightyPercentFromTop = geo.size.height * 0.8
        let topBound = bounds.minY + 91.0
        let bottomBound = bounds.maxY - 91.0
        if (topBound...topBound + 5.00).overlaps(geo.frame(in: .global).minY+eightyPercentFromTop...geo.frame(in: .global).maxY) {
            return 0.98
        } else if (bottomBound - 10.0...bottomBound).overlaps(geo.frame(in: .global).minY...geo.frame(in: .global).minY+20.0) {
            return 0.98
        } else if (geo.frame(in: .global).minY > bottomBound){
            return 0.98
        } else {
            return 1.0
        }
    }
    
    func opacity(cardGeo geo: GeometryProxy) -> CGFloat {
        // Range from top
        let eightyPercentFromTop = geo.size.height * 0.8
        let topBound = bounds.minY + 91.0
        let bottomBound = bounds.maxY - 91.0
        if (topBound...topBound + 5.00).overlaps(geo.frame(in: .global).minY+eightyPercentFromTop...geo.frame(in: .global).maxY) {
            return 0.2
        } else if (bottomBound - 10.0...bottomBound).overlaps(geo.frame(in: .global).minY...geo.frame(in: .global).minY+20.0) {
            return 0.2
        } else if (geo.frame(in: .global).minY > bottomBound){
            return 0.2
        } else {
            return 1.0
        }
    }

    
//    func opacity(forCardGeo geo: GeometryProxy) -> Double {
//        let eightyPercentFromTop = geo.size.height * 0.8
//        let topBound = bounds.minY + 91.0
//        let bottomBound = bounds.maxY - 91.0
//        if (topBound...topBound + 5.00).overlaps(geo.frame(in: .global).minY+eightyPercentFromTop...geo.frame(in: .global).maxY) {
//            return 0.2
//        } else if (bottomBound - 10.0...bottomBound).overlaps(geo.frame(in: .global).minY...geo.frame(in: .global).minY+20.0) {
//            return 0.2
//        } else if (geo.frame(in: .global).minY > bottomBound){
//            return Double((geo.frame(in: .local).minY - bottomBound)/5.0)
//        } else {
//            return 1.0
//        }
//        let topBound = bounds.minY + 91.0
//        let bottomBound = bounds.maxY - 91.0
//
//        let currentMinY = geo.frame(in: .local).minY + (bounds.height/2)
//        let currentMaxY = geo.frame(in: .local).maxY
//
//        // Going up
//        if currentMinY < (topBound + 5.0) {
//            return Double((currentMinY - topBound)/5.0)
//        }
//        if (currentMinY > (topBound + 5.0)) && (currentMaxY < (bottomBound - 5.0)) {
//            return 1.0
//        }
//        if (currentMinY > bottomBound - 5.0) {
//            return Double((currentMinY - bottomBound)/5.0)
//        }
//
//        return 1.0
//    }
}

struct iPadWidgetListView_Previews: PreviewProvider {
    static var previews: some View {
        iPadWidgetListView()
    }
}
