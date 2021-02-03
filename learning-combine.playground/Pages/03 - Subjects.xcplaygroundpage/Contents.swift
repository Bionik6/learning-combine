//: [Previous](@previous)

import Foundation
import Combine

// SUBJECTS: Dealing for code happening outside of Combine generally

// Just
// Empty
// Fail
// Publishers.Sequence
// Timer.TimerPublisher

// PassthroughSubject
let subject = PassthroughSubject<String, Never>()
subject.sink { print("1) received \($0)") }
subject.send("message 1")
subject.send("message 2")

print("--------------")

let subject2 = PassthroughSubject<String, Never>()
subject2.sink { completion in
  print("2) \(completion)")
} receiveValue: { value in
  print("2) \(value)")
}
subject2.send("Testing completion")
subject2.send(completion: .finished)

print("--------------")

struct CustomError: Error { }
let subject3 = PassthroughSubject<String, CustomError>()
subject3.sink { completion in
  print("3) \(completion)")
} receiveValue: { value in
  print("3) \(value)")
}
subject3.send("Testing failure")
subject3.send(completion: .failure(CustomError()))

print("--------------")


// CurrentValueSubject => Variable + Publisher
let wordOfTheDay = CurrentValueSubject<String, Never>("bellicose")
wordOfTheDay.sink { print("The word of the day is \($0).") }
wordOfTheDay.send("erudite")
wordOfTheDay.value
wordOfTheDay.sink { print("Second subscriber received: \($0)") }
wordOfTheDay.send("cogitable")

print("--------------")

let buttonTapSubject = PassthroughSubject<Void, Never>() // used in order to notify that something happens
buttonTapSubject.send()

//: [Next](@next)
