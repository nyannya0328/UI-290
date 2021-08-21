//
//  Home.swift
//  Home
//
//  Created by nyannyan0328 on 2021/08/21.
//

import SwiftUI

struct Home: View {
    @State var stat : DotState = .normal
    
    @State var isEnd = false
    @State var dotScale : CGFloat = 1
    @State var  doRotation : Double = 0
    
    
    
    var body: some View {
        ZStack{
            
            ZStack{
                
                
                (stat == .normal ? Color("c1") : Color("gray"))
                
                
                
                if stat ==  .normal{
                    
                    MiniView()
                    
                }
                   else{
                       
                       expandView()
                       
                       
                   }
                
                
                
            }
            .animation(.none, value: stat)
            
            Rectangle()
                .fill (stat != .normal ? Color("c1") : Color("gray"))
                
                .overlay(
                    
                    
                    ZStack{
                        
                        if stat !=  .normal{
                            
                            MiniView()
                            
                        }
                           else{
                               
                               expandView()
                               
                               
                           }
                    }
                       
                       
                       
                
                
                    
                
                
                
                )
                
                
                
                .animation(.none, value: stat)
            
                .mask(
                
                    GeometryReader{proxy in
                        
                        Circle()
                            .frame(width: 100, height: 100)
                            .scaleEffect(dotScale)
                            .rotation3DEffect(.init(degrees: doRotation), axis: (x: 0, y: 1, z: 0), anchorZ: stat == .filiped ? -10 : 10, perspective: 1)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                            .offset( y: -60)
                        
                        
                        
                        
                    }
                
                
                )
            Circle()
                .foregroundColor(.black.opacity(0.03))
                .frame(width: 100, height: 100)
                .overlay(
                
                    
                    Image(systemName: "chevron.right")
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .opacity(isEnd ? 0 : 1)
                    
                
                
                
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            
                .onTapGesture {
                    
                    
                    if isEnd{return}
                    
                    isEnd = true
                    
                    if stat == .filiped{
                        
                        
                        
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.725) {
                            
                            withAnimation(.linear(duration: 0.7)){
                                
                                
                                dotScale = 1
                                stat = .normal
                                
                            }
                            
                            
                            
                        }
                        
                        
                        
                        withAnimation(.linear(duration: 1.5)){
                            doRotation = 0
                            dotScale = 8
                         
                            
                        }

                        
                       
                        
                        
                    }
                    
                    else{
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.725) {
                            
                            withAnimation(.linear(duration: 0.7)){
                                
                                
                                dotScale = 1
                                stat = .filiped
                                
                            }
                            
                            
                            
                        }
                        
                        
                        
                        withAnimation(.linear(duration: 1.5)){
                            doRotation = -180
                            dotScale = 8
                         
                            
                        }
                    }
                    
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        
                        isEnd = false
                    }
                    
                    
                }
                .offset( y: -60)
                
            
            
            
            
            
            
           
            
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func expandView() -> some View{
        
        
        VStack(spacing:15){
            
            
            Image(systemName: "ipad")
                .font(.system(size: 150))
            
            Text("iPad")
            
        }
        .foregroundColor(.white)
        
    }
    
    
    @ViewBuilder
    func MiniView() -> some View{
        
        
        VStack(spacing:15){
            
            
            Image(systemName: "laptopcomputer")
                .font(.system(size: 150))
            
            Text("Mac")
            
        }
        .foregroundColor(.white)
        
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

enum DotState{
    
    case normal
    case filiped
}
