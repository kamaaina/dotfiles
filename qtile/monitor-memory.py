#!/usr/bin/env python

# qtile top
#tracemalloc not started on qtile, start by setting PYTHONTRACEMALLOC=1 before starting qtile
#or force start tracemalloc now, but you'll lose early traces
# PYTHONTRACEMALLOC=1

# this will start tracemalloc so you can run 'qtile top' to see
# what is eating memory and cpu
from libqtile.command.client import InteractiveCommandClient
i=InteractiveCommandClient()
tracemalloc.start()
i.eval("import tracemalloc;tracemalloc.start()")
