
from setuptools import setup, find_packages

setup(name="hbase-thrift",
      version='0.20.4',
      description="Python client for HBase Thrift interface",
      url="http://hbase.org/",
      packages=find_packages(exclude=['ez_setup', 'examples', 'tests']),
      include_package_data=True,
      author="Jeff Hammerbacher",
      author_email="hammer@cloudera.com",
      scripts=['scripts/Hbase-remote'],
      keywords="database hbase thrift",
      install_requires=['Thrift'])
