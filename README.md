Python-HBase
================

This package can be used to generate a Python source or binary distribution for the [HBase](http://www.hbase.org) [Thrift](http://incubator.apache.org/thrift/) bindings.

I've borrowed and modified the Makefile and setup.py file from Ian Eure's [python-cassandra](http://github.com/ieure/python-cassandra).

To upload to PyPI, I run:

    $ make 
    $ python setup.py build sdist upload

Unless you plan on changing the HBase Thrift bindings yourself, you shouldn't need to use this project. To work with HBase from Python, just say

    $ sudo pip install python-hbase

