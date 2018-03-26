## dnstree

`dnstree` is a simple implementation example of [dnstree](https://github.com/florianl/dnstree).


Get data from [CISCO - Umbrella Popularity List](http://s3-us-west-1.amazonaws.com/umbrella-static/index.html) and pass it as parameter to this implementation example.

Usage
-----
        $ git clone git@github.com:florianl/playground.git
          Cloning into 'playground'...
          [...]
        $ cd playground/dnstree/
        $ go get -u github.com/florianl/dnstree
          [...]
        $ go build
          [...]
        $ ./dnstree mydata.csv
          [...]

Lessons learned
---------------
[golang](https://golang.org/)s implementation of [map](https://golang.org/ref/spec#Map_types) is really fast.
