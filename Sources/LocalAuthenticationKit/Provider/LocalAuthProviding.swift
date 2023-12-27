//
//  LocalAuthProviding.swift
//
//  Created by James Sedlacek on 12/26/23.
//

import Foundation

protocol LocalAuthProviding: AnyObject, Observable {
    var isEnabled: Bool { get set }
}
