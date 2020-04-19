(* Mathematica Test File    *)


BeginTestSection["GitHubAction"]

VerificationTest[
  1+1
  ,
  2
  ,
  TestID->"Simple_Expression"
]

VerificationTest[
  1/0
  ,
  ComplexInfinity
  ,
  Power::infy
  ,
  TestID->"Message_Output"
]

VerificationTest[
  RandomInteger[]
  ,
  0|1
  ,
  SameTest -> MatchQ
  ,
  TestID->"Match_Random"
]

VerificationTest[
  $CloudConnected
  ,
  True
  ,
  TestID->"Cloud_Connected"
]

VerificationTest[
  cf1 = FunctionCompile@Function[{Typed[arg, "MachineInteger"]}, 
    If[EvenQ[arg], arg + 1, arg - 1]
  ];
  cf2 = FunctionCompile@Function[{Typed[fun, { "MachineInteger"} -> "MachineInteger"], Typed[lim, "MachineInteger"]},
    Table[fun[i], {i, lim}]
  ];
  cf2[cf1, 10]
  ,
  {0, 3, 2, 5, 4, 7, 6, 9, 8, 11}
  ,
  TestID->"New_Compile"
]

VerificationTest[
  c = Compile[{{x}}, x^2+Sin[x^2], CompilationTarget -> "C"];
  c[Sqrt[Pi]]
  ,
  Pi
  ,
  SameTest -> TrueQ@*Equal
  ,
  TestID->"C_Compile"
]

VerificationTest[
  ResourceFunction["GrayCode"][100]
  ,
  {1, 0, 1, 0, 1, 1, 0}
  ,
  TestID->"Resource_Accessibility"
]

VerificationTest[
  ResourceFunction["GitHubInstall"]["RuleBasedIntegration", "Rubi"];
  Needs["Rubi`"];
  Rubi`Int[(1 + 2*x)/(x*(2 + 3*x + 5*x^2)), {x, 1, 2}]
  ,
  Integrate[(1 + 2*x)/(x*(2 + 3*x + 5*x^2)), {x, 1, 2}]
  ,
  SameTest->TrueQ@*FullSimplify@*Equal
  ,
  TestID->"Paclet_Accessibility"
]

EndTestSection[]
