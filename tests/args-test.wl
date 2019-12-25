#!/usr/bin/env wolframscript


If[$ScriptCommandLine[[2;;]]==={"1","var=2"},
  Exit[0],
  Print["The actual commandline: ", $ScriptCommandLine];Exit[1]
]
