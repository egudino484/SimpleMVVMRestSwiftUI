//
//  ContentView.swift
//  SimpleMVVMRestSwiftUI
//
//  Created by Edison Gudiño on 12/10/20.
//  Copyright © 2020 Edison Gudiño. All rights reserved.
//

import SwiftUI
import Foundation

//Models
struct Person {
    var name: String
    var age: String
}
//View models
class ContenViewModel: ObservableObject {
    //published annotation help to refresh ui when modelview changes
    @Published private var alice = Person(name: "Alice" , age: "20")
    
    func getDataFromWS(){
        alice.name = name
        alice.age = "22"
    }
    
    var name:String {
        alice.name
    }
    var age: String{
        return alice.age
    }
    //     Intent
    func changeName(_ name: String){
        alice.name = name
    }
    
    func increaseAge(){
        alice.age = String((Int(alice.age) ?? 0) + 1)
    }
    
}

//Views
struct ContentView: View {
    @ObservedObject var dataViewModel = ContenViewModel()
    var body: some View {
        VStack {
            Text(dataViewModel.name).padding()
            Text(dataViewModel.age).padding()
            Button("Change name"){
                // Change the name
                self.dataViewModel.changeName("Juan")
                print(self.dataViewModel.name)
            }
            Button("Increse age"){
                // Change the name
                self.dataViewModel.increaseAge()
                print(self.dataViewModel.age)
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
