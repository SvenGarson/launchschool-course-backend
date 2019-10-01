=begin

  The method lookup path for checked Modules/Classes is:

    1. Class  Cat
    2. Class  Animal
    3. Class  Object
    4. Module Kernel
    5. Class  BasicObject

  The method definition is never found which is why the
  lookup path goes on until the BasicObject Class is
  checked for a definition. Since BasicObject has no 
  superclass, the search for the method definition ends
  there.

=end