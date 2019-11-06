=begin

  - Encapsulation: Exposing only the necessary data/functionality as a
    means of avoiding un-expected, un-authorized mutation of state
    and behaviour. Also abstracting this state and functionality into
    a package that's is easy to use and hard t break.
    The idea is to package data together with ways of accessing and
    transforming that data through a coherent interface (methods).

  - Polymorphism:  Abstract the state and behaviour of objects using
    inheritance and mix-in modules, for fine grained control over an
    objects capabilities and state, and if necessary change the object
    specific implementation details to reflect the objects capabilities.
    One type of object can be used to represent all sorts of objects,
    or can change it's state and behaviour based on it's abstract 
    representation in the real world, making it more intuitive to work
    with

  - A great too to avoid repetition of code, if the hierarchy is well
    designed.

  - Great technique to model objects into classes of state and behaviour,
    which we can then use more intuitively, because the abstraction
    allows us to use the objects as we think of them already.

  - Easy to add, remove and modify functionality if designed right.
    Most projects will grow, shrink or have to be modified at some
    point.

=end