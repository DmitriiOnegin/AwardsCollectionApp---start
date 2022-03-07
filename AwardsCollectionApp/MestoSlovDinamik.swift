//
//  MestoSlovDinamik.swift
//  AwardsCollectionApp
//
//  Created by Dmitrii Onegin on 06.03.2022.
//

import SwiftUI

let text = ["M","e","s","t","o","S","l","o","v"]
let positions = [0,1,2,3,4,5,6,7,8]

struct MestoSlovDinamik: View {
    
    @Binding var showAward: Bool
    
    @State private var rundomPosition = positions
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                ForEach(0 ..< rundomPosition.count, id: \.self) { iteration in
                    
                    Text(text[iteration])
                        .font(!showAward ? .largeTitle : .custom("", size: CGFloat(iteration * 30)))
                        .opacity(!showAward ? 1 : 0.1)
                        .offset(x: !showAward ? CGFloat(rundomPosition[iteration] * 30) : CGFloat(rundomPosition[iteration] * 20),
                                y: 0)
                }
            }
            .offset(x: 0, y: !showAward ? geometry.size.height : 0)
            .animation(.linear)
        }
        .onChange(of: showAward) { showAward in
            
            rundomPosition = showAward ? positions.shuffled() : positions
        }
    }
}

