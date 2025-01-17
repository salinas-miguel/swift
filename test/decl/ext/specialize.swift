// RUN: %target-typecheck-verify-swift -enable-experimental-bound-generic-extensions

extension Array<Int> {
  func someIntFuncOnArray() {}
}

let _ = [0, 1, 2].someIntFuncOnArray()

extension [Character] {
  func makeString() -> String { fatalError() }
}

let _ = ["a", "b", "c"].makeString()
let _ = [1, 2, 3].makeString() // expected-error 3 {{cannot convert value of type 'Int' to expected element type 'Character'}}

extension Set<_> {} // expected-error {{cannot extend a type that contains placeholders}}

// https://bugs.swift.org/browse/SR-4875

struct Foo<T, U> {
  var x: T
  var y: U
}

typealias IntFoo<U> = Foo<Int, U>

extension IntFoo where U == Int {
  func hello() {
    print("hello")
  }
}

Foo(x: "test", y: 1).hello()

struct MyType<TyA, TyB> {
  var a : TyA, b : TyB
}

typealias A<T1, T2> = MyType<T2, T1>

extension A {}

extension A<Float, Int> {}
extension A<Void, Void> {}

struct Tree<T> {
  struct Branch<B> {
    struct Nest<N> {
      struct Egg {}
    }
  }
}

extension Tree.Branch.Nest.Egg { static func tweet() {} }
extension Tree<Int>.Branch.Nest.Egg { static func twoot() {} }
extension Tree<Int>.Branch<String>.Nest.Egg { static func twote() {} }
extension Tree<Int>.Branch<String>.Nest<Void>.Egg { static func twite() {} }

func testNestedExtensions() {
  do {
    Tree<Void>.Branch<Void>.Nest<Void>.Egg.tweet()
  }

  do {
    Tree<Int>.Branch<Void>.Nest<Void>.Egg.twoot()
    Tree<Int>.Branch<Int>.Nest<Void>.Egg.twoot()
    Tree<Int>.Branch<Int>.Nest<Int>.Egg.twoot()
  }

  do {
    Tree<Int>.Branch<String>.Nest<Void>.Egg.twote()
    Tree<Int>.Branch<String>.Nest<Float>.Egg.twote()
  }

  Tree<Int>.Branch<String>.Nest<Void>.Egg.twite()
}
