//
//  JsonDataObject.swift
//  Recipe App
//
//  Created by Jason Bullard on 1/9/22.
//

import Foundation

protocol JsonDataObject: Identifiable, Decodable {
    
    var id: UUID? { get set }
    
}
