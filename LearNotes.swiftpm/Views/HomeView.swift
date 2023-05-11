//
//  HomeView.swift
//  WWDC2023
//
//  Created by Iago Ramos on 18/04/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color("theme")
                    .ignoresSafeArea()
                
                VStack{
                    Text("Musical Notes")
                        .title()
                        .padding(.bottom, 10)
                    
                    Text("Have you ever heard about the history of musical notes? From Pythagoras in ancient Greece to Guido of Arezzo in Italy, come learn about this history with amazing interactions!")
                        .text()
//                        .padding(.top, 10)
                    
                    NavigationLink(destination: MonochordView()) {
                        ContinueButton(text: "Start")
                    }
                    .padding(.top, 10)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
