
from setuptools import setup, find_packages

setup(name="python-hbase",
      version='0.20.4',
      description="Thrift client for HBase",
      url="http://hbase.org/",
      packages=find_packages(exclude=['ez_setup', 'examples', 'tests']),
      include_package_data=True,
      author="Jeff Hammerbacher",
      author_email="hammer@cloudera.com",
      scripts=['scripts/Hbase-remote'],
      keywords="database hbase",
      install_requires=['Thrift'])
