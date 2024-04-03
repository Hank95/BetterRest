//
//  ContentView.swift
//  BetterRest
//
//  Created by Henry Pendleton on 4/2/24.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    @State private var coffeeAmount = 0
    
    var body: some View {
        NavigationStack{
            
            VStack{
                
                Text("When do you want to wake up?")
                    .font(.headline)
                DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Text("Disired amount of Sleep")
                    .font(.headline)
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                Text("Daily coffee intake")
                    .font(.headline)
                Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
                
            }
            .navigationTitle("BetterRest")
            .toolbar{
                Button("Calculate", action: calculateBedtime)
            }
        }
    }
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minutes = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(hour + minutes), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}
