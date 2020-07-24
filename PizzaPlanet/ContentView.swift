//
//  ContentView.swift
//  PizzaPlanet
//
//  Created by Raphaël Payet on 22/07/2020.
//  Copyright © 2020 Oriapy. All rights reserved.
//

import SwiftUI

let screen = UIScreen.main.bounds

struct ContentView: View {
    
    @State var show = false
    
    var body: some View {
        ZStack {
            PrincipalView(show: $show)
            BigPizzaView(show : $show)
                .offset(y : show ? 0 : screen.height)
                .animation(.easeInOut)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Header: View {
    var body: some View {
        HStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height : 75)
            
            Spacer()
            
            Image("basket")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width : 50, height : 50)
        }
        .padding(.horizontal)
    }
}

struct MenuList: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Galaxy Menu")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold, design: .monospaced))
            
            Text("1x Pizza XXL")
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .bold, design: .monospaced))
            
            Text("1x Soda 50cl")
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .bold, design: .monospaced))
            Spacer()
            Text("$11.99")
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .bold, design: .monospaced))
        }
    }
}

struct MenuCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
            Image("galaxy")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack {
                AlienText(text: "MOST POPULAR", size: 35)
                
                Rectangle()
                    .foregroundColor(.red)
                    .frame(height : 2)
                    .padding(.horizontal, 30)
                    .offset(y : -20)
                
                
                HStack {
                    MenuList()
                    
                    Image("menu")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }.padding(.leading)
                
                Spacer()
                
                
            }.padding(.top, 8)
        }.frame(height : screen.height * 1/3)
            .padding(.horizontal, 30)
    }
}

struct ScrollingMenus: View {
    
    var menuTypes = [
        MenuType(name: "PIZZAS", isSelected: true),
        MenuType(name: "MENUS", isSelected: false),
        MenuType(name: "DRINKS", isSelected: false),
        MenuType(name: "DESSERTS", isSelected: false)
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing : 40) {
                ForEach(menuTypes) { menu in
                    AlienText(text: menu.name, color: menu.isSelected ? .black : Color.black.opacity(0.6),size: 25 )
                        
                }
            }
        }
    }
}

struct AlienText: View {
    var text    : String
    var color   : Color         = .white
    var size    : CGFloat       = 30
    var weight  : Font.Weight   = .bold
    var design  : Font.Design   = .monospaced
    
    var body: some View {
        Text(text)
            .foregroundColor(color)
            .font(.system(size: size, weight: weight, design: design))
    }
}

struct SmallPizzaCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(.red)
            
            VStack(alignment: .leading) {
                VStack {
                    AlienText(text: "Pluto")
                    AlienText(text: "This is the smallest pizza of the pizza system", size: 12)
                    AlienText(text : "$8.99")
                }.padding(.horizontal)
                
                Image("pizza1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width : 190)
            }
            
            
        }.frame(width : 175 ,height : 300)
    }
}

struct ScrollingPizzas: View {
    
    @Binding var show : Bool
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing : 50) {
                ForEach(0..<5) {_ in
                    SmallPizzaCard().onTapGesture {
                        self.show.toggle()
                    }
                }
            }.padding(.leading)
        }
    }
}

struct PrincipalView: View {
    
    @Binding var show : Bool
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing : 30) {
                Header()
                MenuCard()
                ScrollingMenus()
                    .padding(.leading)
                ScrollingPizzas(show: $show)
            }
        }
    }
}
