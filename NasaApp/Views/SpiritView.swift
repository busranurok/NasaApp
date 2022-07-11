//
//  SettingsView.swift
//  NasaApp
//
//  Created by BusranurOK on 10.07.2022.
//

import SwiftUI

struct SpiritView: View {
    
    @ObservedObject var spiritViewModel =  SpiritViewModel()
    @State var size = CameraModel.CameraName.ALL.rawValue
    @State var show : Bool = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Spacer()
                
                Menu(content: {
                    
                    ForEach(CameraModel.CameraName.allCases, id: \.self) { cameraName in
                        
                        Button(action:{
                            
                            size = cameraName.rawValue
                            
                            if cameraName == CameraModel.CameraName.ALL {
                                
                                spiritViewModel.photoList = spiritViewModel.allPhotos
                                
                            }
                            else {
                                
                                spiritViewModel.photoList = spiritViewModel.allPhotos.filter{ $0.camera.name == cameraName.rawValue}
                                
                            }
                   
                            spiritViewModel.filterCameraName = cameraName.rawValue
                            
                        }) {
                            
                            Text(cameraName.rawValue)
                            
                        }
                        
                    }
                    
                }) {
                    
                    Label(title: {
                        
                        Text(size)
                            .foregroundColor(.white)
                        
                    }) {
                        
                        Image(systemName: "video.circle.fill")
                            .foregroundColor(.white)
                        
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color("Tertiary5"))
                    .clipShape(Capsule())
                    
                }
            }
            
            ZStack {
                
                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach(spiritViewModel, id: \.self.id) { (photo : PhotoModel) in
                            
                            AsyncImage(url: URL(string: photo.imageUrl)) { image in
                                
                                image.resizable()
                                
                            }
                        placeholder:{
                            Color.red
                        }
                        .frame(width: 128, height: 128)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .listRowSeparator(.hidden, edges: .top)
                        .onTapGesture {
                            
                            show.toggle()
                            spiritViewModel.selectedId = photo.id
                            
                        }
                        .onAppear {
                            
                            self.spiritViewModel.fetchMorePhotos(currentItem: photo)
                            
                          }
                            
                        }
                    }
                }
                
                if show {
                    
                    let filteredPhoto = spiritViewModel.photoList.filter{ $0.id == spiritViewModel.selectedId}
                    
                    PhotoDetailView(show: $show,selectedPhoto: filteredPhoto.first!)
                    
                }
                
            }
            
            Spacer()
            
        }
        .padding()
        
    }
    
}
