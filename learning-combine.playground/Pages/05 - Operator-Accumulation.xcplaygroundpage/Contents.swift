//: [Previous](@previous)

import Foundation

func example(_ title: String, block: ()->()) {
  print("\n------------[\(title)]-------------")
  block()
  print("\n------------------------------\n\n")
}

// The below operators are going to wait to the upstream to finish publishing before performing some actions

example("reduce") {
  let grades = [1, 5, 12]
  grades.publisher
    .print()
    .reduce(0) { $0 + $1 }
    .sink { print($0) }
}


example("count") {
  let values = [1, 5, 12]
  values.publisher
    .print()
    .count()
    .sink { print($0) }
}

example("last") {
  let values = [1, 5, 12]
  values.publisher
    .print()
    .last()
    .sink { print($0) }
}

example("first") {
  let values = [1, 5, 12]
  values.publisher
    .print()
    .first()
    .sink { print($0) }
}

example("output(at:)") {
  let values = [1, 5, 12]
  values.publisher
    .print()
    .output(at: 2)
    .sink { print($0) }
}

// max/min

example("collect") {
  let values = [1, 5, 12]
  values.publisher
    .print()
    .collect()
    .sink { print($0) } // gives us an array
}

//: [Next](@next)
