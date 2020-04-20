#!/usr/bin/env wolframscript

Print["Wolfram Language Version: ", $Version];
Print["Running tests...","\n"];

If[FailureQ@Environment["WOLFRAM_ID"],
  CloudConnect[],
  CloudConnect[Environment["WOLFRAM_ID"], Environment["WOLFRAM_PASS"]]
];
If[!TrueQ@$CloudConnected,
  Print["Cloud connection failed!"];
  Exit[1]
]

$baseDir=DirectoryName[$InputFileName]

Module[{report, time, results, failIdx},
  report=TestReport[
    FileNameJoin[{$baseDir, "tests.wlt"}]
  ];
  time=report["TimeElapsed"];
  results=report["TestResults"];
  failIdx=report["TestsFailedIndices"];
  Print["  ", Length[results], " tests run in ", TextString@time, "."];
  If[TrueQ@report["AllTestsSucceeded"]
    ,
    Print["  All tests succeeded!"];
    Exit[]
    ,
    Print["  ", Length[failIdx], " tests failed!"];
    Do[
      Print["  ", i, " | ", results[i]["Outcome"], " | ", results[i]["TestID"]],
      {i, failIdx}
    ];
    Exit[1]
  ]
]
