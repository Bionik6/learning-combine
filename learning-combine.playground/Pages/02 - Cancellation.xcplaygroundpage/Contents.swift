//: [Previous](@previous)

import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


let ints = [1, 2, 3].publisher
var x = ints.sink { _ in } // x is AnyCancellable


class TickTock {
  var cancellables: Set<AnyCancellable> = []
  
  init() {
    Timer.publish(every: 0.5, on: .main, in: .common)
      .autoconnect()
      .print("Timer") // for debugging
      .sink { [weak self] _ in
        self?.tick() // be aware of retain-cycle that will not deallocate the class
      }
      .store(in: &cancellables) // if we don't store in a cancellable, the event subscription will not occur
  }
  
  func tick() {
    print("Tick")
  }
}


var example: TickTock? = TickTock()
DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
  print("Cleaning up....")
  example = nil
}






//: [Next](@next)
