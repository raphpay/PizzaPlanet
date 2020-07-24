//
//  BigPizzaView.swift
//  PizzaPlanet
//
//  Created by Raphaël Payet on 22/07/2020.
//  Copyright © 2020 Oriapy. All rights reserved.
//

import SwiftUI

struct BigPizzaView: View {
    
    @State var pizzaCount : Int = 1
    @State var pizzaPrice : Double = 9.99
    @Binding var show : Bool
    
    var body: some View {
        ZStack {
            
            Color.black.opacity(0.5)
            .edgesIgnoringSafeArea(.all)
            
            ZStack {
                
                
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundColor(.red)
                
                VStack {
                    HStack {
                        Button(action : {
                            withAnimation {
                                self.show.toggle()
                            }
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .bold, design: .monospaced))
                        }
                        Spacer()
                        
                        VStack {
                            Image("pizza1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            HStack(spacing : 20) {
                                AlienText(text : "L")
                                AlienText(text : "XL")
                                AlienText(text : "XXL")
                            }
                        }.frame(width: 200, height: 200)
                        
                        Spacer()
                    }.offset(y : -75)
                    .padding(.horizontal)
                    
                    
                    HStack {
                        VStack(alignment: .leading) {
                            AlienText(text : "Pluto")
                            AlienText(text : "Pepperoni and cheese", size: 15)
                        }
                        
                        Spacer()
                    }.padding()
                    
                    HStack {
                        Button(action : {
                            if self.pizzaCount > 0 {
                                self.pizzaCount -= 1
                            }
                        }) {
                            CountButtonContent(name: "minus")
                        }
                        
                        AlienText(text : "\(pizzaCount)")
                        Button(action : {
                            if self.pizzaCount < 10 {
                                self.pizzaCount += 1
                            }
                        }) {
                            CountButtonContent(name: "plus")
                        }
                        
                        Spacer()
                    }.padding()
                    
                    
                    AlienText(text: "$\(pizzaPrice * Double(pizzaCount))")
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 40, style: .continuous)
                            .foregroundColor(.white)
                            .shadow(radius: 20)
                        AlienText(text : "ADD", color: .red)
                    }
                    .frame(width: 200, height: 60)
                    Spacer()
                }
            }
            .offset(y : screen.height * 2/8)
        }
    }
}

struct BigPizzaView_Previews: PreviewProvider {
    static var previews: some View {
        BigPizzaView(show: .constant(true))
    }
}

struct CountButtonContent: View {
    var name : String
    
    var body: some View {
        Image(systemName: "\(name).circle")
            .foregroundColor(.white)
            .font(.system(size: 30, weight: .bold, design: .monospaced))
    }
}
