import sys
if sys.prefix == '/usr':
    sys.real_prefix = sys.prefix
    sys.prefix = sys.exec_prefix = '/home/kseelams/ece569-fall2025/lab3/ws3/src/install/metafly_description'
