#!/usr/bin/env wolframscript


If[$ScriptCommandLine[[2;;]]==={"1","var=2"},
  Print["Test Passed!"];Exit[0],
  Print["The actual commandline: ", $ScriptCommandLine];Exit[1]
]
