//
//  TypeExtensions.swift
//  Noter
//
//  Created by Riccardo Scanavacca on 20/11/2020.
//

import Foundation

extension Date {
    
    var toMediumString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: self)
    }
}


extension String {
    
    func truncate(length: Int, trailing: String = "...") -> String {
        return self.count > length ? self.prefix(length) + trailing : self
    }
}
