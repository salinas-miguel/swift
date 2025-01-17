// RUN: %empty-directory(%t)
// RUN: %target-build-swift %s -Xfrontend -disable-preallocated-instantiation-caches -o %t/a.out
// RUN: %target-codesign %t/a.out
// RUN: %target-run %t/a.out

// REQUIRES: executable_test

public class Generic<T> {
  public func m1(t: T) -> T { return t }
  public func m2(t: T) -> T { return t }
}

protocol MyProtocol {
  associatedtype T
  func foo() -> T
}

public struct MyStruct<T>: MyProtocol {
  func foo() -> T { fatalError() }
}

print(Generic<Int>())
print(MyStruct<Int>())
