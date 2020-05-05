import time
import signal
import sys
import math

class TimeOutError(Exception):
    pass

def timeout(signum, frame, time):
    raise TimeOutError("Timed out after %d seconds" % time)

def run_with_timeout(code, time, globals=None):
    """
    Evaluate ``code``, timing out after ``time`` seconds.
    In Python 2.5 and lower, ``time`` is rounded up to the nearest integer.
    The return value is whatever ``code`` returns.
    """
    # Set the signal handler and a ``time``-second alarm
    signal.signal(signal.SIGALRM, lambda s, f: timeout(s, f, time))
    if sys.version_info > (2, 5):
        signal.setitimer(signal.ITIMER_REAL, time)
    else:
        # The above only exists in Python 2.6+
        # Otherwise, we have to use this, which only supports integer arguments
        # Use math.ceil to round a float up.
        time = int(math.ceil(time))
        signal.alarm(time)
    r = eval(code, globals)
    signal.alarm(0)          # Disable the alarm
    return r

def pudb_stringifier(obj):
    """
    This is the custom stringifier.
    It returns str(obj), unless it take more than a second to compute,
    in which case it falls back to type(obj).
    """
    # try:
    #     return run_with_timeout("str(obj)", 0.5, {'obj':obj})

    # except TimeOutError:
    #     return (type(obj), "(str too slow to compute)")
    try:
        return (list(obj.shape), "torch")
    except:
        return (type(obj), "(hogeaefawefawe)")

# Example usage

class FastString(object):
    def __str__(self):
        return "This was fast to compute."

class SlowString(object):
    def __str__(self):
        time.sleep(10) # Return the string value after ten seconds
        return "This was slow to compute."

fast = FastString()
slow = SlowString()

