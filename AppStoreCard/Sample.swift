//
//  Sample.swift
//  AppStoreCard
//
//  Created by Ravi Tripathi on 31/01/21.
//

import SwiftUI

struct Sample: View {
    
    @State var pickedNumber: Int = -1
    @State var showDetail = false
    @Namespace var namespace
    
    var body: some View {
        VStack {
            if !showDetail {
                VStack(spacing: 15) {
                    ForEach(0..<3) { number in
                        Button("Hello world \(number)") {
                            withAnimation {
                                pickedNumber = number
                                showDetail = true
                            }
                        }
                        .frame(width: 300, height: 30, alignment: .center)
                        .padding()
                        .border(Color.black, width: 1)
                        .matchedGeometryEffect(id: number, in: namespace)
                    }
                }
            } else {
                ZStack {
                    Rectangle().foregroundColor(.blue).cornerRadius(30)
                    Button("Back") {
                        withAnimation {
                            showDetail = false
                        }
                    }
                    .padding()
                    .foregroundColor(.black)
                }
                .matchedGeometryEffect(id: pickedNumber, in: namespace)
            }
            //            }
        }
    }
}

struct Sample_Previews: PreviewProvider {
    static var previews: some View {
        Sample()
    }
}
