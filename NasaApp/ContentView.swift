//
//  ContentView.swift
//  NasaApp
//
//  Created by BusranurOK on 10.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    // hiding tab bar...
    init() {
        
        UITabBar.appearance().isHidden = false
        
    }
    
    var body: some View {
               
            TabBarView()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
