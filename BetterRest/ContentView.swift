//
//  ContentView.swift
//  BetterRest
//
//  Created by Henry Pendleton on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack{
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
                .labelsHidden()
        }
    }
    
    func exampleDates(){
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date  = Calendar.current.date(from: components) ?? .now

        
        
    }
}

#Preview {
    ContentView()
}
