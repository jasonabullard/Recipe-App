//
//  Parseable.swift
//  Recipe App
//
//  Created by Jason Bullard on 1/9/22.
//

import Foundation

protocol Parseable: Identifiable, Decodable {
    
    var id: UUID? { get set }
    
}
