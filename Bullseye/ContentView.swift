//
//  ContentView.swift
//  Bullseye
//
//  Created by Kenzo on 2/10/22.
//

/**
 git add .
  git commit -m "sjdqwfjqwb"
  git push -u origin main
 */

import SwiftUI

struct ContentView: View {
    @State var alertIsVis: Bool = false
    
    //UI content and layout
    var body: some View {
        VStack {
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                    .fontWeight(.semibold)
                Text("100")
            }
            
            
            //Slider row
            // TODO: add views for slider row here.
            HStack{
                Text("1")
                
                Text("100")
            }
            
            // Button row
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
            
            // Score row
            // TODO: add views for the score, rounds, and start and info buttons
            
        }
    }
    
    // Methods
    // =======
}


// Preview
// =======









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
