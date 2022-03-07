//
//  MestoSlovView.swift
//  AwardsCollectionApp
//
//  Created by Dmitrii Onegin on 06.03.2022.
//

import SwiftUI

struct MestoSlovView: View {
    
    @Binding var showAward: Bool
    
    var body: some View {
        
        GeometryReader { geometry in
            BukvaM(width: geometry.size.width, height: geometry.size.height , animatableData: showAward ? 0 : 1)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [.green, .blue]),
                    startPoint: UnitPoint(x: 0, y: 1),
                    endPoint: UnitPoint(x: 1, y: 0)
                ))
        }
        .onAppear {
            pressButton()
        }
        
    }
    
    func pressButton() {
        withAnimation(Animation.linear) {
            showAward.toggle()
        }
    }
}

struct BukvaM: Shape {
    
    let width: CGFloat
    let height: CGFloat
    var animatableData: CGFloat
    
    func path(in rect: CGRect) -> Path {
       
            let size = min(width, height)
            
            let nearLine = size * 0.1
            let farLine = size * 0.9
            let middle = size / 2
            
            var path = Path()
                //1
                path.move(to: CGPoint(x: nearLine, y: nearLine))
                //2
                path.addLine(to: CGPoint(x: nearLine + middle/3 , y: nearLine))
                //3
        path.addLine(to: CGPoint(x: middle, y: nearLine + middle * animatableData ))
                //4
                path.addLine(to: CGPoint(x: farLine - middle/3, y: nearLine))
                //5
                path.addLine(to: CGPoint(x: farLine, y: nearLine))
                //6
                path.addLine(to: CGPoint(x: farLine, y: farLine))
                //7
                path.addLine(to: CGPoint(x: farLine - middle/3, y: farLine))
                //8
                path.addLine(to: CGPoint(x: farLine - middle/3, y: farLine - middle * animatableData))
                //9
                path.addLine(to: CGPoint(x: middle, y: farLine))
                //10
                path.addLine(to: CGPoint(x: nearLine + middle/3, y: farLine - middle * animatableData))
                //11
                path.addLine(to: CGPoint(x: nearLine + middle/3, y: farLine))
                //12
                path.addLine(to: CGPoint(x: nearLine, y: farLine))
                
                path.closeSubpath()
                
        return path
    }
}
