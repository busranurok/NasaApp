//
//  TabBarView.swift
//  NasaApp
//
//  Created by BusranurOK on 10.07.2022.
//

import SwiftUI

struct TabBarView: View {
    
    @State var current = "Curiosity"
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            TabView(selection: $current) {
                
                CuriosityView()
                    .tag("Curiosity")
                
                OpportunityView()
                    .tag("Opportunity")
                
                SpiritView()
                    .tag("Spirit")
                
            }
            
            HStack(spacing: 0) {
                
                // TabButton...
                
                TabButtonView(title: "Curiosity", image: "c.circle", selected: $current)
                
                Spacer(minLength: 0)
                
                TabButtonView(title: "Opportunity", image: "o.circle", selected: $current)
                
                Spacer(minLength: 0)
                
                TabButtonView(title: "Spirit", image: "s.circle", selected: $current)
                
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color("Accent3"))
            .clipShape(Capsule())
            .padding(.horizontal, 25)
        }
        
    }
    
}
