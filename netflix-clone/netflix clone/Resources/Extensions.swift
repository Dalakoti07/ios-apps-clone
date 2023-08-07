//
//  Extensions.swift
//  netflix clone
//
//  Created by Saurabh Dalakoti on 06/08/23.
//

import Foundation

extension String{
    
    func capitalizeFirstLetter()->String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
}
