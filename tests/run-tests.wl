#!/usr/bin/env wolframscript

Print["Running tests..."];

getFailedTestsID[tr_TestReportObject]:=#["TestID"]& /@ Flatten[Values /@ Values@tr["TestsFailed"]]


With[{tr=TestReport[FileNameJoin[{Directory[],"tests.wlt"}]]},
  Exit@If[tr["TestsFailedCount"]===0,
    Print["All tests passed!"];0,
    Print["Tests failed!\nID: ",getFailedTestsID[tr]];1
  ]
]

