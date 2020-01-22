=begin

req:
  - each node has left and right sub-tree whichi point to nil init.
  - left sub-tree contains values <= parent
  - right sub-tree contains values > parent  
  - class 'Bst' design: --> Bst is a node really
    * data; left; right
    - Bst#new(data)
    - Bst#left -> return left node
    - Bst#right -> return right node
    - Bst#insert -> inserts data where it matches requirements
    - Bst#each -> yields every data point to block

=end