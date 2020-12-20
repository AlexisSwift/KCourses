//
//  UpdateStore.swift
//  KCourses
//
//  Created by Sasha Kondratjeva on 20.12.2020.
//

import Combine
import SwiftUI

class UpdateStore: ObservableObject {
   var willChange = PassthroughSubject<Void, Never>()

   var updates: [Update] {
      didSet {
         willChange.send()
      }
   }

   init(updates: [Update] = []) {
      self.updates = updates
   }
}

