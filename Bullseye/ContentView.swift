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
    @State var alertIsVis = false
    @State var sliderValue = 50.0
    @State var targetValue = Int.random(in: 0...100)
    @State var score = 0
    @State var round = 0
    //single source of truth slider value
    var sliderValRounded: Int{
        Int(self.sliderValue.rounded())
    }
    
    //UI content and layout
    var body: some View {
        VStack {

            Spacer()
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                    .fontWeight(.semibold)
                Text("\(targetValue)")
            }
            
            Spacer()
            //Slider row
            // TODO: add views for slider row here.
            HStack{
                Text("1")
                Slider(value: self.$sliderValue,
                       in:1...100)
                Text("100")
            }
            
            // Button row
            Button("Hit me!") {
                print("Points awarded: \(scoreCalculator())")
                self.alertIsVis = true
                
            }
            .alert(isPresented: self.$alertIsVis){
                Alert(
                    title: Text(alertMessage()),
                    message: Text(scoringMessage()),
                    dismissButton: .default(Text("Awesome!")) {
                        if round == 0 {
                            score = scoreCalculator()
                        }
                        else{
                            score = scoreCalculator() + score
                        }
                        targetValue = Int.random(in: 0...100)
                        round = round + 1
                    })
            }
            Spacer()
            // Score row
            // TODO: add views for the score, rounds, and start and info buttons
            HStack{
                Button("Start over"){
                    targetValue = Int.random(in: 0...100)
                    score = 0
                    round = 0
                    sliderValue = 50
                }
                Spacer()
                Text("Score:")
                Text("\(score)")
                Spacer()
                Text("Round:")
                Text("\(round)")
                Spacer()
                Button("Info"){
                    
                }
            }
            .padding(.bottom, 20)
        }
    }
    
    // Methods
    // =======
    /**
     var sliderValue:
     var targetValue:*/
    func scoreCalculator()-> Int{
        let maximumScore = 100
        let diff = abs(sliderValRounded - targetValue)
        return maximumScore - diff
    }
    
    func scoringMessage()-> String{
        return "The slider value is \(sliderValRounded).\n" +
        "The target value is \(targetValue).\n" +
        "You scored \(scoreCalculator()) points this round."
    }
    
    func alertMessage()-> String{
        var aMessage: String
        let absPoint = abs(targetValue - sliderValRounded)
        if absPoint == 0 {
            aMessage = "Perfect!"
        }else if (absPoint < 5){
            aMessage = "You almost had it!"
        }
        else if (absPoint <= 10) {
            aMessage = "Not bad."
        }else {
            aMessage = "Are you even trying?"
        }
        return aMessage
    }
}

// Preview
// =======









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
