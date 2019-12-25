#!/usr/bin/env wolframscript


Exit@If[$ScriptCommandLine==={"1","var=2"},
  0,
  Print["The actual commandline: ", $ScriptCommandLine];1
]
