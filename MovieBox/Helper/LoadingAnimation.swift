//
//  LoadingAnimation.swift
//  MovieBox
//
//  Created by Apple on 27/09/20.
//  Copyright © 2020 xyz. All rights reserved.
//

import SwiftUI

struct LoadingAnimation: View {
    
    @State var animate: Bool = false
    @State var size: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .foregroundColor(Color("Color_app_primary"))
                    .frame(width: geometry.size.width/4)
                    .offset(x: self.animate ? -geometry.size.width/4 : geometry.size.width/4, y: geometry.size.width/4)
                
                Circle()
                    .foregroundColor(Color("Color_app_primary"))
                    .frame(width: geometry.size.width/4)
                    .offset(x: self.animate ? geometry.size.width/4 : 0, y: self.animate ? geometry.size.width/4 : -geometry.size.width/4)
                
                Circle()
                    .foregroundColor(Color("Color_app_primary"))
                    .frame(width: geometry.size.width/4)
                    .offset(x: self.animate ? 0 : -geometry.size.width/4, y: self.animate ? -geometry.size.width/4 : geometry.size.width/4)
            }.frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
            
        }.frame(width: size, height: size).onAppear {
            withAnimation(Animation.easeInOut(duration: 0.5)
                .delay(0.5).repeatForever(autoreverses: false)) {
                    self.animate.toggle()
            }
        }
    }
}

struct LoadingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LoadingAnimation(size: 100)
    }
}
