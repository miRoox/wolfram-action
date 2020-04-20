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
  Block[{cf1, cf2},
    cf1 = FunctionCompile@Function[{Typed[arg, "MachineInteger"]}, 
      If[EvenQ[arg], arg + 1, arg - 1]
    ];
    cf2 = FunctionCompile@Function[{Typed[fun, { "MachineInteger"} -> "MachineInteger"], Typed[lim, "MachineInteger"]},
      Table[fun[i], {i, lim}]
    ];
    cf2[cf1, 10]
  ]
  ,
  {0, 3, 2, 5, 4, 7, 6, 9, 8, 11}
  ,
  TestID->"New_Compile"
]

(*
VerificationTest[
  GeneralUtilities`SetupTeardown[
    libext = GeneralUtilities`StringMatch[$OperatingSystem, 
      "Windows", "dll", 
      "MacOSX", "dylib", 
      "Unix"|"Linux", "so"
    ];
    lib = FunctionCompileExportLibrary["function."<>libext,
      Function[Typed[arg,"Real64"], Typed[KernelFunction[AiryAi], {"Real64"}->"Real64"][arg]]
    ];
    fun = LibraryFunctionLoad[lib],
    fun[1.8],
    LibraryFunctionUnload[fun]
  ]
  ,
  AiryAi[1.8]
  ,
  TestID->"New_Compile_Lib"
]
 *)

(*
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
 *)

VerificationTest[
  ResourceFunction["GrayCode"][100]
  ,
  {1, 0, 1, 0, 1, 1, 0}
  ,
  TestID->"Resource_Accessibility"
]

VerificationTest[
  Import["https://raw.githubusercontent.com/kubapod/mpm/master/install.m"];
  Needs["MPM`"];
  MPM`MPMInstall["arnoudbuzing", "Prototypes", "AllowPrereleases"->True];
  Needs["Prototypes`"];
  Prototypes`PrimeCount[10^12]
  ,
  PrimePi[10^12]
  ,
  TestID->"Paclet_Accessibility"
]

EndTestSection[]
