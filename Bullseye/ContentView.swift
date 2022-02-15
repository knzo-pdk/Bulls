//
//  ContentView.swift
//  Bullseye
//
//  Created by Kenzo on 2/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVis: Bool = false
    var body: some View {
        VStack {
            Text("Welcome to my first app!")
                .fontWeight(.semibold)
            .padding()
            Button("Hit me!") {
                print("Button pressed!")
                self.alertIsVis = true
            }
            .alert(isPresented: self.$alertIsVis){
                Alert(
                    title: Text("Hello there!"),
                    message: Text("This is my first pop-up."),
                    dismissButton: .default(Text("Awesome!")))
            }
        }
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
