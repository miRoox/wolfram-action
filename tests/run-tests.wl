#!/usr/bin/env wolframscript

Print["Wolfram Language Version: ", $Version];

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

If[MUnit`TestRun[FileNameJoin[{$baseDir, "tests.wlt"}], "Loggers" -> {MUnit`VerbosePrintLogger[]}],
  Exit[],
  Exit[1]
]
