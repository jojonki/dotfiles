"""
https://github.com/inducer/pudb/blob/master/example-stringifier.py
"""

def pudb_stringifier(obj):
    try:
        return (list(obj.shape), "tensor")
    except:
        return type(obj)
