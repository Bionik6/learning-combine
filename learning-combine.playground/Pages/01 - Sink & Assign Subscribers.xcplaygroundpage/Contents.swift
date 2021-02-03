import Combine

// Sink
// Assign

func sinkExampleManual() {
  let publisher = [1, 2, 5, 8, 11].publisher
  
  let subscriber = Subscribers.Sink<Int, Never> { completion in
    print(completion)
  } receiveValue: { value in
    print(value)
  }
  
  publisher.subscribe(subscriber) // We need to subscribe to a publisher for him to begins emitting values
}

func sinkExampleShorthand() {
  let publisher = [1, 2, 5, 8, 11].publisher
  publisher.sink { completion in
    print(completion)
  } receiveValue: { value in
    print(value)
  }

}


class Human {
  var name: String = "" {
    didSet { print(name) }
  }
}

func assignExampleManual() {
  let publisher = ["Adji", "Ibrahima"].publisher
  let human = Human()
  let subscriber = Subscribers.Assign<Human, String>(object: human, keyPath: \.name)
  publisher.subscribe(subscriber)
}

func assignShortHand() {
  let publisher = ["Adji", "Ibrahima"].publisher
  let human = Human()
  publisher.assign(to: \.name, on: human)
}

assignShortHand()
