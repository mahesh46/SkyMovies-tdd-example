//
//  String+Extensions.swift
//  SkyMovies
//
//  Created by mahesh lad on 22/05/2023.
//

import Foundation

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
