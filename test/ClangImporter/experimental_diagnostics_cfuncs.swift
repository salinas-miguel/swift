// RUN: not %target-swift-frontend(mock-sdk: %clang-importer-sdk) -enable-experimental-clang-importer-diagnostics -typecheck %s 2>&1 | %FileCheck %s --strict-whitespace

import cfuncs

unsupported_parameter_type(1,2)
// CHECK:      experimental_diagnostics_cfuncs.swift:5:1: error: cannot find 'unsupported_parameter_type' in scope
// CHECK-NEXT: unsupported_parameter_type(1,2)
// CHECK-NEXT: ^~~~~~~~~~~~~~~~~~~~~~~~~~
// CHECK-NEXT: cfuncs.h:{{[0-9]+}}:1: note: function 'unsupported_parameter_type' not imported
// CHECK-NEXT:      int unsupported_parameter_type(int param1, _Complex int param2);
// CHECK-NEXT: {{^}}^
// CHECK-NEXT: cfuncs.h:{{[0-9]+}}:44: note: parameter 'param2' not imported
// CHECK-NEXT:      int unsupported_parameter_type(int param1, _Complex int param2);
// CHECK-NEXT: {{^}}                                           ^
// CHECK-NEXT: cfuncs.h:{{[0-9]+}}:44: note: built-in type 'Complex' not supported
// CHECK-NEXT:      int unsupported_parameter_type(int param1, _Complex int param2);
// CHECK-NEXT: {{^}}                                           ^

unsupported_return_type()
// CHECK:      experimental_diagnostics_cfuncs.swift:19:1: error: cannot find 'unsupported_return_type' in scope
// CHECK-NEXT: unsupported_return_type()
// CHECK-NEXT: ^~~~~~~~~~~~~~~~~~~~~~~
// CHECK-NEXT: cfuncs.h:{{[0-9]+}}:1: note: function 'unsupported_return_type' not imported
// CHECK-NEXT:      _Complex int unsupported_return_type();
// CHECK-NEXT: {{^}}^
// CHECK-NEXT: cfuncs.h:{{[0-9]+}}:1: note: return type not imported
// CHECK-NEXT:      _Complex int unsupported_return_type();
// CHECK-NEXT: {{^}}^
// CHECK-NEXT: cfuncs.h:{{[0-9]+}}:1: note: built-in type 'Complex' not supported
// CHECK-NEXT:      _Complex int unsupported_return_type();
// CHECK-NEXT: {{^}}^

unsupported_parameter_type(1,2)
// CHECK:      experimental_diagnostics_cfuncs.swift:33:1: error: cannot find 'unsupported_parameter_type' in scope
// CHECK-NEXT: unsupported_parameter_type(1,2)
// CHECK-NEXT: ^~~~~~~~~~~~~~~~~~~~~~~~~~
// CHECK-NEXT: cfuncs.h:{{[0-9]+}}:1: note: function 'unsupported_parameter_type' not imported
// CHECK-NEXT:      int unsupported_parameter_type(int param1, _Complex int param2);
// CHECK-NEXT: {{^}}^
// CHECK-NEXT: cfuncs.h:{{[0-9]+}}:44: note: parameter 'param2' not imported
// CHECK-NEXT:      int unsupported_parameter_type(int param1, _Complex int param2);
// CHECK-NEXT: {{^}}                                           ^
// CHECK-NEXT: cfuncs.h:{{[0-9]+}}:44: note: built-in type 'Complex' not supported
// CHECK-NEXT:      int unsupported_parameter_type(int param1, _Complex int param2);
// CHECK-NEXT: {{^}}                                           ^

unsupported_return_type()
// CHECK:      experimental_diagnostics_cfuncs.swift:47:1: error: cannot find 'unsupported_return_type' in scope
// CHECK-NEXT: unsupported_return_type()
// CHECK-NEXT: ^~~~~~~~~~~~~~~~~~~~~~~
// CHECK-NEXT: cfuncs.h:{{[0-9]+}}:1: note: function 'unsupported_return_type' not imported
// CHECK-NEXT:      _Complex int unsupported_return_type();
// CHECK-NEXT: {{^}}^
// CHECK-NEXT: cfuncs.h:{{[0-9]+}}:1: note: return type not imported
// CHECK-NEXT:      _Complex int unsupported_return_type();
// CHECK-NEXT: {{^}}^
// CHECK-NEXT: cfuncs.h:{{[0-9]+}}:1: note: built-in type 'Complex' not supported
// CHECK-NEXT:      _Complex int unsupported_return_type();
// CHECK-NEXT: {{^}}^
