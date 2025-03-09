//
//  PassView.swift
//  PassStack
//
//  Created by Dominic Thompson on 3/8/25.
//

import SwiftUI

struct PassView: View {
    var pass: Pass
    
    var body: some View {
        ZStack {
            Ticket()
                .foregroundStyle(pass.color)
            
            HStack(alignment: .top) {
                Text(pass.location)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(pass.type)
                        .italic()
                        .fontWeight(.bold)
                    
                    Text("Valid on 07/22/2024")
                        .font(.caption2)
                }
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(12)
        }
        .frame(height: 206)
    }
}
