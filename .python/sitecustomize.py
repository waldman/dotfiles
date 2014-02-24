#
# original: http://code.activestate.com/recipes/65287/
#


# Start debug on Exception

import bdb
import sys

def info(type, value, tb):
   if hasattr(sys, 'ps1') \
         or not sys.stdin.isatty() \
         or not sys.stdout.isatty() \
         or not sys.stderr.isatty() \
         or issubclass(type, bdb.BdbQuit) \
         or issubclass(type, SyntaxError):
      # we are in interactive mode or we don't have a tty-like
      # device, so we call the default hook
      sys.__excepthook__(type, value, tb)
   else:
      import traceback, ipdb
      # we are NOT in interactive mode, print the exception...
      traceback.print_exception(type, value, tb)
      print
      # ...then start the debugger in post-mortem mode.
      ipdb.pm()

sys.excepthook = info
