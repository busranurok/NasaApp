//
//  TabButtonView.swift
//  NasaApp
//
//  Created by BusranurOK on 10.07.2022.
//

import SwiftUI

struct TabButtonView: View {
    
    var title: String
    var image : String
    
    @Binding var selected: String
    
    var body: some View {
        
        Button(action: {
            
            withAnimation(.spring()) {selected = title}
            
        }) {
            
            HStack(spacing: 10) {
                
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                
                if selected == title {
                    
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                }
                
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color.white.opacity(selected == title ? 0.08 : 0))
            .clipShape(Capsule())
            
        }
        
    }
    
}
