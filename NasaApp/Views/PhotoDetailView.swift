//
//  PhotoDetailView.swift
//  NasaApp
//
//  Created by BusranurOK on 11.07.2022.
//

import SwiftUI

struct PhotoDetailView: View {
    
    @Binding var show : Bool
    var selectedPhoto : PhotoModel
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            
            VStack(spacing: 25) {
                
                AsyncImage(url: URL(string: selectedPhoto.imageUrl)) { image in
                    
                    image.resizable()
                    
                }
            placeholder:{
                Color.red
            }
            .frame(width: 128, height: 128)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .listRowSeparator(.hidden, edges: .top)
                
                Text("Çekildiği Tarih : \(selectedPhoto.earthDate)")
                
                Text("Araç Adı : \(selectedPhoto.rover.name)")
                
                Text("Hangi Kameradan Çekildi: \(selectedPhoto.camera.fullName)")
                
                Text("Aracın Görev Durumu: \(selectedPhoto.rover.status)")
                
                Text("Aracın Fırlatma Tarihi: \(selectedPhoto.rover.launchDate)")
                
                Text("İniş Tarihi: \(selectedPhoto.rover.landingDate)")
                
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .cornerRadius(25)
            .font(.body)
            .foregroundColor(.pink)
            
            Button(action: {
                
                withAnimation {
                    
                    show.toggle()
                    
                }
                
            }) {
                
                Image(systemName: "xmark.circle")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.purple)
                
            }
            .padding()
            
        }
        
    }
}
