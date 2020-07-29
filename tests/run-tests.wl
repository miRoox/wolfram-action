#!/usr/bin/env wolframscript

If[FailureQ@Environment["WOLFRAM_ID"],
  CloudConnect[],
  CloudConnect[Environment["WOLFRAM_ID"], Environment["WOLFRAM_PASS"]]
];
If[!TrueQ@$CloudConnected,
  Print["Cloud connection failed!"];
  Exit[1]
]

$baseDir=DirectoryName[$InputFileName]

Compiler`$CCompilerOptions = {
  "ShellCommandFunction" -> EchoFunction["Command: ", Identity],
  "ShellOutputFunction" -> EchoFunction["Output: ", Identity]
};

Needs["MUnit`"]
Get["https://raw.githubusercontent.com/miRoox/CILogger-MUnit/master/CILogger/CILogger.wl"]

If[MUnit`TestRun[FileNameJoin[{$baseDir, "tests.wlt"}], "Loggers" :> {CILogger`CILogger[]}],
  Exit[],
  Exit[1]
]
