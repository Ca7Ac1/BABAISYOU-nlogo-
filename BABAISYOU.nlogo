globals [start tempBeaten inLevel
  proxyAShape proxyBShape
  inWorldOne inWorldTwo inWorldCredits
  inLevelOne inLevelTwo inLevelThree
  inLevelFour inLevelFive inLevelSix
  inLevelSeven inLevelEight inLevelNine
  inLevelTen inLevelEleven inLevelTwelve
  inLevelThirteen inLevelFourteen inLevelFifteen
  inLevelSixteen inLevelSeventeen inLevelEighteen
  levelOneBeaten levelTwoBeaten levelThreeBeaten
  levelFourBeaten levelFiveBeaten levelSixBeaten
  levelSevenBeaten levelEightBeaten levelNineBeaten
  levelTenBeaten levelElevenBeaten levelTwelveBeaten
  levelThirteenBeaten levelFourteenBeaten levelFifteenBeaten
  levelSixteenBeaten levelSeventeenBeaten levelEighteenBeaten
]

breed [objects object]
breed [adjectiveWords adjectiveWord]
breed [objectWords objectWord]
breed [isWords isWord]
breed [andWords andWord]

objectWords-own [
  babaWord
  wallWord
  flagWord
  rockWord
  waterWord
  skullWord
  pillarWord
  starWord
  crabWord
  lavaWord
  proxyAWord
  proxyBWord
  tempBaba
  tempWall
  tempFlag
  tempRock
  tempWater
  tempSkull
  tempPillar
  tempStar
  tempCrab
  tempLava
  tempProxyA
  tempProxyB
  tempHot
  tempMelt
  tempSink
  tempDefeat
  tempHalt
  tempPush
  tempWin
  tempYou
  change
]

adjectiveWords-own [
  hotWord
  meltWord
  sinkWord
  defeatWord
  haltWord
  pushWord
  winWord
  youWord
]

objects-own [
  border
  baba
  wall
  flag
  rock
  water
  skull
  pillar
  star
  crab
  lava
  proxyA
  proxyB
]

turtles-own [
  hot
  melt
  sink
  defeat
  halt
  push
  win
  you
  direction
]

to initialize
  if start != false [set start true]
  if start = true [set start false
    set inWorldOne true set inWorldTwo false set inWorldCredits false
    set levelOneBeaten false set levelTwoBeaten false set levelThreeBeaten false
    set levelFourBeaten false set levelFiveBeaten false set levelSixBeaten false
    set levelSevenBeaten false set levelEightBeaten false set levelNineBeaten false
    set levelTenBeaten false set levelElevenBeaten false set levelTwelveBeaten false
    set levelThirteenBeaten false set levelFourteenBeaten false set levelFifteenBeaten false
    set levelSixteenBeaten false set levelSeventeenBeaten false set levelEIghteenBeaten false
  ]
end

to setup
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set tempBeaten false set inLevel false
  set inLevelOne false set inLevelTwo false set inLevelThree false
  set inLevelFour false set inLevelFive false set inLevelSix false
  set inLevelSeven false set inLevelEight false set inLevelNine false
  resize-world -12 12 -12 12
  set-patch-size 20
  if inWorldOne [setupWorldOne]
  if inWorldTwo [setupWorldTwo]
  if inWorldCredits [setupCredits]
end

to setupWorldOne
  ask patches with [pxcor < -5 and pxcor > -9 and pycor = 3] [set pcolor yellow]
    ifelse levelOneBeaten
      [ask patches with [pxcor < 2 and pxcor > -2 and pycor = 3] [set pcolor yellow]]
      [ask patches with [pxcor < 2 and pxcor > -2 and pycor = 3] [set pcolor yellow + 3]]
    ifelse levelTwoBeaten
      [ask patches with [pxcor < 9 and pxcor > 5 and pycor = 3] [set pcolor yellow ]]
      [ask patches with [pxcor < 9 and pxcor > 5 and pycor = 3] [set pcolor yellow + 3]]
    ifelse levelThreeBeaten
      [ask patches with [pxcor < -5 and pxcor > -9 and pycor = 0] [set pcolor yellow]]
      [ask patches with [pxcor < -5 and pxcor > -9 and pycor = 0] [set pcolor yellow + 3]]
    ifelse levelFourBeaten
      [ask patches with [pxcor < 2 and pxcor > -2 and pycor = 0] [set pcolor yellow ]]
      [ask patches with [pxcor < 2 and pxcor > -2 and pycor = 0] [set pcolor yellow + 3]]
    ifelse levelFiveBeaten
      [ask patches with [pxcor < 9 and pxcor > 5 and pycor = 0] [set pcolor yellow ]]
      [ask patches with [pxcor < 9 and pxcor > 5 and pycor = 0] [set pcolor yellow + 3]]
    ifelse levelSixBeaten
      [ask patches with [pxcor < -5 and pxcor > -9 and pycor = -3] [set pcolor yellow]]
      [ask patches with [pxcor < -5 and pxcor > -9 and pycor = -3] [set pcolor yellow + 3]]
    ifelse levelSevenBeaten
      [ask patches with [pxcor < 2 and pxcor > -2 and pycor = -3] [set pcolor yellow ]]
      [ask patches with [pxcor < 2 and pxcor > -2 and pycor = -3] [set pcolor yellow + 3]]
    ifelse levelEightBeaten
      [ask patches with [pxcor < 9 and pxcor > 5 and pycor = -3] [set pcolor yellow ]]
      [ask patches with [pxcor < 9 and pxcor > 5 and pycor = -3] [set pcolor yellow + 3]]
    if levelNineBeaten [ask patches with [pxcor < 2 and pxcor > -2 and pycor = -5] [set pcolor yellow]]
    crt 1 [set color yellow setxy -6.8 3 set label-color black set label "level 1"]
    ifelse levelOneBeaten
      [crt 1 [set color yellow setxy .2 3 set label-color black set label "level 2"]]
      [crt 1 [set color yellow + 3 setxy .2 3 set label-color black set label "level 2"]]
    ifelse levelTwoBeaten
      [crt 1 [set color yellow setxy 7.2 3 set label-color black set label "level 3"]]
      [crt 1 [set color yellow + 3 setxy 7.2 3 set label-color black set label "level 3"]]
    ifelse levelThreeBeaten
      [crt 1 [set color yellow setxy -6.8 0 set label-color black set label "level 4"]]
      [crt 1 [set color yellow + 3 setxy -6.8 0 set label-color black set label "level 4"]]
    ifelse levelFourBeaten
      [crt 1 [set color yellow setxy .2 0 set label-color black set label "level 5"]]
      [crt 1 [set color yellow + 3 setxy .2 0 set label-color black set label "level 5"]]
    ifelse levelFiveBeaten
      [crt 1 [set color yellow setxy 7.2 0 set label-color black set label "level 6"]]
      [crt 1 [set color yellow + 3 setxy 7.2 0 set label-color black set label "level 6"]]
    ifelse levelSixBeaten
      [crt 1 [set color yellow setxy -6.8 -3 set label-color black set label "level 7"]]
      [crt 1 [set color yellow + 3 setxy -6.8 -3 set label-color black set label "level 7"]]
    ifelse levelSevenBeaten
      [crt 1 [set color yellow setxy .2 -3 set label-color black set label "level 8"]]
      [crt 1 [set color yellow + 3 setxy .2 -3 set label-color black set label "level 8"]]
    ifelse levelEightBeaten
      [crt 1 [set color yellow setxy 7.2 -3 set label-color black set label "level 9"]]
      [crt 1 [set color yellow + 3 setxy 7.2 -3 set label-color black set label "level 9"]]
    if levelNineBeaten [crt 1 [set color yellow setxy .8 -5 set label-color black set label "Next World"]]
    crt 1 [setxy 1 7 set color black set label-color yellow set label "BABA IS YOU"]
    crt 1 [setxy 5.8 -7 set color black set label-color yellow set label
      "!you must play each level through to get to the next!"]
    crt 1 [setxy 11.4 -9 set color black set label-color yellow set label
      "!If you get stuck on a level and need to reset you can click setup again. All progress will be retained!"]
end

to setupWorldTwo
  ask patches with [pxcor < -5 and pxcor > -9 and pycor = 3] [set pcolor lime]
  ifelse levelTenBeaten
    [ask patches with [pxcor < 2 and pxcor > -2 and pycor = 3] [set pcolor lime]]
    [ask patches with [pxcor < 2 and pxcor > -2 and pycor = 3] [set pcolor lime + 3]]
  ifelse levelElevenBeaten
    [ask patches with [pxcor < 9 and pxcor > 5 and pycor = 3] [set pcolor lime ]]
    [ask patches with [pxcor < 9 and pxcor > 5 and pycor = 3] [set pcolor lime + 3]]
  ifelse levelTwelveBeaten
    [ask patches with [pxcor < -5 and pxcor > -9 and pycor = 0] [set pcolor lime]]
    [ask patches with [pxcor < -5 and pxcor > -9 and pycor = 0] [set pcolor lime + 3]]
  ifelse levelThirteenBeaten
    [ask patches with [pxcor < 2 and pxcor > -2 and pycor = 0] [set pcolor lime ]]
    [ask patches with [pxcor < 2 and pxcor > -2 and pycor = 0] [set pcolor lime + 3]]
  ifelse levelFourteenBeaten
    [ask patches with [pxcor < 9 and pxcor > 5 and pycor = 0] [set pcolor lime ]]
    [ask patches with [pxcor < 9 and pxcor > 5 and pycor = 0] [set pcolor lime + 3]]
  ifelse levelFifteenBeaten
    [ask patches with [pxcor < -5 and pxcor > -9 and pycor = -3] [set pcolor lime]]
    [ask patches with [pxcor < -5 and pxcor > -9 and pycor = -3] [set pcolor lime + 3]]
  ifelse levelSixteenBeaten
    [ask patches with [pxcor < 2 and pxcor > -2 and pycor = -3] [set pcolor lime ]]
    [ask patches with [pxcor < 2 and pxcor > -2 and pycor = -3] [set pcolor lime + 3]]
  ifelse levelSeventeenBeaten
    [ask patches with [pxcor < 9 and pxcor > 5 and pycor = -3] [set pcolor lime ]]
    [ask patches with [pxcor < 9 and pxcor > 5 and pycor = -3] [set pcolor lime + 3]]
  ask patches with [pxcor < -1 and pxcor > -5 and pycor = -5] [set pcolor lime]
  ifelse levelEighteenBeaten
    [ask patches with [pxcor < 5 and pxcor > 1 and pycor = -5] [set pcolor lime]]
    [ask patches with [pxcor < 5 and pxcor > 1 and pycor = -5] [set pcolor lime + 3]]
  crt 1 [set color lime setxy -6.8 3 set label-color black set label "level 1"]
  ifelse levelTenBeaten
    [crt 1 [set color lime setxy .2 3 set label-color black set label "level 2"]]
    [crt 1 [set color lime + 3 setxy .2 3 set label-color black set label "level 2"]]
  ifelse levelElevenBeaten
    [crt 1 [set color lime setxy 7.2 3 set label-color black set label "level 3"]]
    [crt 1 [set color lime + 3 setxy 7.2 3 set label-color black set label "level 3"]]
  ifelse levelTwelveBeaten
    [crt 1 [set color lime setxy -6.8 0 set label-color black set label "level 4"]]
    [crt 1 [set color lime + 3 setxy -6.8 0 set label-color black set label "level 4"]]
  ifelse levelThirteenBeaten
    [crt 1 [set color lime setxy .2 0 set label-color black set label "level 5"]]
    [crt 1 [set color lime + 3 setxy .2 0 set label-color black set label "level 5"]]
  ifelse levelFourteenBeaten
    [crt 1 [set color lime setxy 7.2 0 set label-color black set label "level 6"]]
    [crt 1 [set color lime + 3 setxy 7.2 0 set label-color black set label "level 6"]]
  ifelse levelFifteenBeaten
    [crt 1 [set color lime setxy -6.8 -3 set label-color black set label "level 7"]]
    [crt 1 [set color lime + 3 setxy -6.8 -3 set label-color black set label "level 7"]]
  ifelse levelSixteenBeaten
    [crt 1 [set color lime setxy .2 -3 set label-color black set label "level 8"]]
    [crt 1 [set color lime + 3 setxy .2 -3 set label-color black set label "level 8"]]
  ifelse levelSeventeenBeaten
    [crt 1 [set color lime setxy 7.2 -3 set label-color black set label "level 9"]]
    [crt 1 [set color lime + 3 setxy 7.2 -3 set label-color black set label "level 9"]]
  crt 1 [set color lime setxy -2.2 -5 set label-color black set label "Past World"]
  ifelse levelEighteenBeaten
    [crt 1 [set color lime setxy 3.2 -5 set label-color black set label "Credits"]]
    [crt 1 [set color lime + 3 setxy 3.2 -5 set label-color black set label "Credits"]]
  crt 1 [setxy 1 7 set color black set label-color lime set label "BABA IS YOU"]
  crt 1 [setxy 1.2 -7 set color black set label-color lime set label
    "!WORLD TWO!"]
  crt 1 [setxy 11.4 -9 set color black set label-color lime set label
    "!If you get stuck on a level and need to reset you can click setup again. All progress will be retained!"]
end

to setupBorder
  ask patches [
    if (pxcor = max-pxcor) or (pxcor = (-1 * max-pxcor))
    or (pycor = max-pycor) or (pycor = (-1 * max-pycor)) [
      sprout-objects 1 [set border true]
    ]
  ]
end

to setupLevelOneObjects
  create-objects 1 [set baba true setxy 2 -1] create-objects 1 [set flag true setxy -5 0]
  create-objects 1 [set wall true setxy -6 2] create-objects 1 [set wall true setxy -6 -2]
  create-objects 1 [set wall true setxy -5 2] create-objects 1 [set wall true setxy -5 -2]
  create-objects 1 [set wall true setxy -4 2] create-objects 1 [set wall true setxy -4 -2]
  create-objects 1 [set wall true setxy -3 2] create-objects 1 [set wall true setxy -3 -2]
  create-objects 1 [set wall true setxy -2 2] create-objects 1 [set wall true setxy -2 -2]
  create-objects 1 [set wall true setxy -1 2] create-objects 1 [set wall true setxy -1 -2]
  create-objects 1 [set wall true setxy 0 2] create-objects 1 [set wall true setxy 0 -2]
  create-objects 1 [set wall true setxy 1 2] create-objects 1 [set wall true setxy 1 -2]
  create-objects 1 [set wall true setxy 2 2] create-objects 1 [set wall true setxy 2 -2]
  create-objects 1 [set wall true setxy 3 2] create-objects 1 [set wall true setxy 3 -2]
  create-objects 1 [set wall true setxy 4 2] create-objects 1 [set wall true setxy 4 -2]
  create-objects 1 [set wall true setxy 5 2] create-objects 1 [set wall true setxy 5 -2]
  create-objects 1 [set wall true setxy 6 2] create-objects 1 [set wall true setxy 6 -2]
  create-objects 1 [set wall true setxy -7 2] create-objects 1 [set wall true setxy 6 1]
  create-objects 1 [set wall true setxy -7 1] create-objects 1 [set wall true setxy 6 0]
  create-objects 1 [set wall true setxy -7 0] create-objects 1 [set wall true setxy 7 0]
  create-objects 1 [set wall true setxy -7 -1] create-objects 1 [set wall true setxy 7 -1]
  create-objects 1 [set wall true setxy -7 -2] create-objects 1 [set wall true setxy 7 -2]
  create-objects 1 [set rock true setxy -2 1] create-objects 1 [set rock true setxy -2 0]
  create-objects 1 [set rock true setxy -2 -1]
end

to setupLevelOneWords
  create-objectWords 1 [set babaWord true setxy -10 1]
  create-objectWords 1 [set wallWord true setxy 10 1]
  create-adjectiveWords 1 [set haltWord true setxy 10 -1]
  create-adjectiveWords 1 [set pushWord true setxy 4 -1]
  create-adjectiveWords 1 [set youWord true setxy -10 -1]
  create-objectWords 1 [set rockWord true setxy 5 1]
  create-adjectiveWords 1 [set haltword true setxy 5 -1]
  create-adjectiveWords 1 [set winword true setxy 2 5]
  create-objectWords 1 [set flagword true setxy 0 5]
  create-isWords 1 [setxy -10 0] create-isWords 1 [setxy 10 0] create-isWords 1 [setxy 5 0] create-isWords 1 [setxy 1 5]
end

to setupLevelOne
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelOne true
  setupBorder
  setupLevelOneObjects
  setupLevelOneWords
end

to setupLevelTwoObjects
  create-objects 1 [set baba true setxy 2 -1] create-objects 1 [set flag true setxy -1 4]
  create-objects 1 [set wall true setxy -7 2] create-objects 1 [set wall true setxy -6 2]
  create-objects 1 [set wall true setxy -5 2] create-objects 1 [set wall true setxy -4 2]
  create-objects 1 [set wall true setxy -3 2] create-objects 1 [set wall true setxy -2 2]
  create-objects 1 [set wall true setxy -1 2] create-objects 1 [set wall true setxy 0 2]
  create-objects 1 [set wall true setxy 1 2] create-objects 1 [set wall true setxy 2 2]
  create-objects 1 [set wall true setxy 3 2] create-objects 1 [set wall true setxy 4 2]
  create-objects 1 [set wall true setxy -7 3] create-objects 1 [set wall true setxy -7 4]
  create-objects 1 [set wall true setxy -7 5] create-objects 1 [set wall true setxy -7 6]
  create-objects 1 [set wall true setxy -6 6] create-objects 1 [set wall true setxy -5 6]
  create-objects 1 [set wall true setxy -4 6] create-objects 1 [set wall true setxy -3 6]
  create-objects 1 [set wall true setxy -3 7] create-objects 1 [set wall true setxy -3 8]
  create-objects 1 [set wall true setxy -3 9] create-objects 1 [set wall true setxy -3 10]
  create-objects 1 [set wall true setxy -3 11] create-objects 1 [set wall true setxy -2 11]
  create-objects 1 [set wall true setxy -1 11] create-objects 1 [set wall true setxy 0 11]
  create-objects 1 [set wall true setxy 1 11] create-objects 1 [set wall true setxy 2 11]
  create-objects 1 [set wall true setxy 3 11] create-objects 1 [set wall true setxy 4 11]
  create-objects 1 [set wall true setxy 4 10] create-objects 1 [set wall true setxy 4 9]
  create-objects 1 [set wall true setxy 4 8] create-objects 1 [set wall true setxy 4 7]
  create-objects 1 [set wall true setxy 4 6] create-objects 1 [set wall true setxy 4 5]
  create-objects 1 [set wall true setxy 4 4] create-objects 1 [set wall true setxy 4 3]
  create-objects 1 [set wall true setxy 4 1] create-objects 1 [set wall true setxy 4 0]
  create-objects 1 [set wall true setxy 4 -1] create-objects 1 [set wall true setxy 4 -2]
  create-objects 1 [set wall true setxy 4 -3] create-objects 1 [set wall true setxy 3 -3]
  create-objects 1 [set wall true setxy 2 -3] create-objects 1 [set wall true setxy 1 -3]
  create-objects 1 [set wall true setxy 0 -3] create-objects 1 [set wall true setxy -1 -3]
  create-objects 1 [set wall true setxy -2 -3] create-objects 1 [set wall true setxy -3 -3]
  create-objects 1 [set wall true setxy -3 -2] create-objects 1 [set wall true setxy -3 -1]
  create-objects 1 [set wall true setxy -3 0] create-objects 1 [set wall true setxy -3 1]
end

to setupLevelTwoWords
  create-objectWords 1 [set flagWord true setxy -5 4]
  create-objectWords 1 [set babaWord true setxy -6 0]
  create-objectWords 1 [set wallWord true setxy -1 0]
  create-adjectiveWords 1 [set haltWord true setxy -1 -2]
  create-adjectiveWords 1 [set winWord true setxy 2 6]
  create-adjectiveWords 1 [set youWord true setxy -6 -2]
  create-isWords 1 [setxy -6 -1] create-isWords 1 [setxy -1 -1] create-isWords 1 [setxy  -1 8]
end

to setupLevelTwo
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelTwo true
  setupBorder
  setupLevelTwoObjects
  setupLevelTwoWords
end

to setupLevelThreeObjects
  create-objects 1 [set baba true setxy 0 0] create-objects 1 [set flag true setxy 8 0]
  create-objects 1 [set wall true setxy 11 2] create-objects 1 [set wall true setxy 10 2]
  create-objects 1 [set wall true setxy 10 1] create-objects 1 [set wall true setxy 10 0]
  create-objects 1 [set wall true setxy 10 -1] create-objects 1 [set wall true setxy 10 -2]
  create-objects 1 [set wall true setxy 11 -2] create-objects 1 [set wall true setxy 9 -2]
  create-objects 1 [set wall true setxy 8 -2] create-objects 1 [set wall true setxy 7 -2]
  create-objects 1 [set wall true setxy 6 -2] create-objects 1 [set wall true setxy 6 -1]
  create-objects 1 [set wall true setxy 6 0] create-objects 1 [set wall true setxy 6 1]
  create-objects 1 [set wall true setxy 6 2] create-objects 1 [set wall true setxy 7 2]
  create-objects 1 [set wall true setxy 8 2] create-objects 1 [set wall true setxy 9 2]
end

to setupLevelThreeWords
  create-objectWords 1 [set babaWord true setxy -6 3]
  create-objectWords 1 [set flagWord true setxy -6 -3]
  create-objectWords 1 [set wallWord true setxy 11 1]
  create-adjectiveWords 1 [set youWord true setxy -4 3]
  create-adjectiveWords 1 [set winWord true setxy -4 -3]
  create-adjectiveWords 1 [set haltWord true setxy 11 -1]
  create-isWords 1 [setxy -5 3] create-isWords 1 [setxy -5 -3] create-isWords 1 [setxy 11 0]
end

to setupLevelThree
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelThree true
  setupBorder
  setupLevelThreeObjects
  setupLevelThreeWords
end

to setupLevelFourObjects
  create-objects 1 [set wall true setxy 2 -1] create-objects 1 [set flag true setxy -7 2]
  create-objects 1 [set flag true setxy -6 2] create-objects 1 [set flag true setxy -5 2]
  create-objects 1 [set flag true setxy -4 2] create-objects 1 [set flag true setxy -3 2]
  create-objects 1 [set flag true setxy -2 2] create-objects 1 [set flag true setxy -1 2]
  create-objects 1 [set flag true setxy 0 2] create-objects 1 [set flag true setxy 1 2]
  create-objects 1 [set flag true setxy 2 2] create-objects 1 [set flag true setxy 3 2]
  create-objects 1 [set flag true setxy 4 2] create-objects 1 [set flag true setxy -7 3]
  create-objects 1 [set flag true setxy -7 4] create-objects 1 [set flag true setxy -7 5]
  create-objects 1 [set flag true setxy -7 6] create-objects 1 [set flag true setxy -6 6]
  create-objects 1 [set flag true setxy -5 6] create-objects 1 [set flag true setxy -4 6]
  create-objects 1 [set flag true setxy -3 6] create-objects 1 [set flag true setxy -3 7]
  create-objects 1 [set flag true setxy -3 8] create-objects 1 [set flag true setxy -3 9]
  create-objects 1 [set flag true setxy -3 10] create-objects 1 [set flag true setxy -3 11]
  create-objects 1 [set flag true setxy -2 11] create-objects 1 [set flag true setxy -1 11]
  create-objects 1 [set flag true setxy 0 11] create-objects 1 [set flag true setxy 1 11]
  create-objects 1 [set flag true setxy 2 11] create-objects 1 [set flag true setxy 3 11]
  create-objects 1 [set flag true setxy 4 11] create-objects 1 [set flag true setxy 4 10]
  create-objects 1 [set flag true setxy 4 9] create-objects 1 [set flag true setxy 4 8]
  create-objects 1 [set flag true setxy 4 7] create-objects 1 [set flag true setxy 4 6]
  create-objects 1 [set flag true setxy 4 5] create-objects 1 [set flag true setxy 4 4]
  create-objects 1 [set flag true setxy 4 3] create-objects 1 [set flag true setxy 4 1]
  create-objects 1 [set flag true setxy 4 0] create-objects 1 [set flag true setxy 4 -1]
  create-objects 1 [set flag true setxy 4 -2] create-objects 1 [set flag true setxy 4 -3]
  create-objects 1 [set flag true setxy 3 -3] create-objects 1 [set flag true setxy 2 -3]
  create-objects 1 [set flag true setxy 1 -3] create-objects 1 [set flag true setxy 0 -3]
  create-objects 1 [set flag true setxy -1 -3] create-objects 1 [set flag true setxy -2 -3]
  create-objects 1 [set flag true setxy -3 -3] create-objects 1 [set flag true setxy -3 -2]
  create-objects 1 [set flag true setxy -3 -1] create-objects 1 [set flag true setxy -3 0]
  create-objects 1 [set flag true setxy -3 1]
end

to setupLevelFourWords
  create-objectWords 1 [set babaWord true setxy -5 4]
  create-objectWords 1 [set wallWord true setxy -6 0]
  create-objectWords 1 [set flagWord true setxy -1 0]
  create-adjectiveWords 1 [set haltWord true setxy -1 -2]
  create-adjectiveWords 1 [set winWord true setxy 2 6]
  create-adjectiveWords 1 [set youWord true setxy -6 -2]
  create-isWords 1 [setxy -6 -1] create-isWords 1 [setxy -1 -1] create-isWords 1 [setxy  -1 8]
end

to setupLevelFour
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelFour true
  setupBorder
  setupLevelFourObjects
  setupLevelFourWords
end

to setupLevelFiveObjects
  create-objects 1 [set baba true setxy -2 7] create-objects 1 [set flag true setxy -6 -3]
  create-objects 1 [set rock true setxy 1 7] create-objects 1 [set rock true setxy 1 5]
  create-objects 1 [set water true setxy -3 3] create-objects 1 [set water true setxy -2 3]
  create-objects 1 [set water true setxy -1 3] create-objects 1 [set water true setxy -6 -2]
  create-objects 1 [set water true setxy -6 -1] create-objects 1 [set water true setxy -5 -3]
  create-objects 1 [set water true setxy -5 -2] create-objects 1 [set water true setxy -5 -1]
  create-objects 1 [set water true setxy -4 -3] create-objects 1 [set water true setxy -4 -2]
  create-objects 1 [set water true setxy -4 -1] create-objects 1 [set wall true setxy 0 3]
  create-objects 1 [set wall true setxy 1 3] create-objects 1 [set wall true setxy 2 3]
  create-objects 1 [set wall true setxy 3 3] create-objects 1 [set wall true setxy 4 3]
  create-objects 1 [set wall true setxy 5 3] create-objects 1 [set wall true setxy 6 3]
  create-objects 1 [set wall true setxy 6 2] create-objects 1 [set wall true setxy 6 1]
  create-objects 1 [set wall true setxy 6 0] create-objects 1 [set wall true setxy 6 -1]
  create-objects 1 [set wall true setxy 6 -2] create-objects 1 [set wall true setxy 6 -3]
  create-objects 1 [set wall true setxy 6 -4] create-objects 1 [set wall true setxy 5 -4]
  create-objects 1 [set wall true setxy 4 -4] create-objects 1 [set wall true setxy 3 -4]
  create-objects 1 [set wall true setxy 2 -4] create-objects 1 [set wall true setxy 1 -4]
  create-objects 1 [set wall true setxy 0 -4] create-objects 1 [set wall true setxy -1 -4]
  create-objects 1 [set wall true setxy -2 -4] create-objects 1 [set wall true setxy -3 -4]
  create-objects 1 [set wall true setxy -4 -4] create-objects 1 [set wall true setxy -5 -4]
  create-objects 1 [set wall true setxy -6 -4] create-objects 1 [set wall true setxy -7 -4]
  create-objects 1 [set wall true setxy -7 -3] create-objects 1 [set wall true setxy -7 -2]
  create-objects 1 [set wall true setxy -7 -1] create-objects 1 [set wall true setxy -7 0]
  create-objects 1 [set wall true setxy -7 1] create-objects 1 [set wall true setxy -7 2]
  create-objects 1 [set wall true setxy -7 3] create-objects 1 [set wall true setxy -6 3]
  create-objects 1 [set wall true setxy -5 3] create-objects 1 [set wall true setxy -4 3]
  create-objects 1 [set wall true setxy -4 4] create-objects 1 [set wall true setxy -4 5]
  create-objects 1 [set wall true setxy -4 6] create-objects 1 [set wall true setxy -4 7]
  create-objects 1 [set wall true setxy -4 8] create-objects 1 [set wall true setxy -4 9]
  create-objects 1 [set wall true setxy -3 9] create-objects 1 [set wall true setxy -2 9]
  create-objects 1 [set wall true setxy -1 9] create-objects 1 [set wall true setxy 0 9]
  create-objects 1 [set wall true setxy 1 9] create-objects 1 [set wall true setxy 2 9]
  create-objects 1 [set wall true setxy 3 9] create-objects 1 [set wall true setxy 3 8]
  create-objects 1 [set wall true setxy 3 7] create-objects 1 [set wall true setxy 3 6]
  create-objects 1 [set wall true setxy 3 5] create-objects 1 [set wall true setxy 3 4]
  create-objects 1 [set wall true setxy 0 2] create-objects 1 [set wall true setxy 0 1]
  create-objects 1 [set wall true setxy 0 0] create-objects 1 [set wall true setxy 0 -2]
  create-objects 1 [set wall true setxy 0 -3] create-objects 1 [set wall true setxy -2 -1]
  create-objects 1 [set wall true setxy -9 11] create-objects 1 [set wall true setxy -9 10]
  create-objects 1 [set wall true setxy -9 9] create-objects 1 [set wall true setxy -9 8]
  create-objects 1 [set wall true setxy -10 8] create-objects 1 [set wall true setxy -11 8]
end

to setupLevelFiveWords
  create-objectWords 1 [set babaWord true setxy -11 11]
  create-objectWords 1 [set wallWord true setxy -10 11]
  create-objectWords 1 [set waterWord true setxy -5 6]
  create-objectWords 1 [set rockWord true setxy 2 1]
  create-objectWords 1 [set flagWord true setxy 2 -2]
  create-adjectiveWords 1 [set youWord true setxy -11 9]
  create-adjectiveWords 1 [set haltWord true setxy -10 9]
  create-adjectiveWords 1 [set sinkWord true setxy -5 4]
  create-adjectiveWords 1 [set pushWord true setxy 4 1]
  create-adjectiveWords 1 [set winWord true setxy 4 -2]
  create-isWords 1 [setxy -11 10] create-isWords 1 [setxy -10 10] create-isWords 1 [setxy -5 5]
  create-isWords 1 [setxy 3 1] create-isWords 1 [setxy 3 -2]
end

to setupLevelFive
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelFive true
  setupBorder
  setupLevelFiveObjects
  setupLevelFiveWords
end

to setupLevelSixObjects
  create-objects 1 [set flag true setxy 5 -2] create-objects 1 [set baba true setxy -7 -10]
  create-objects 1 [set rock true setxy -7 -6] create-objects 1 [set rock true setxy -7 -7]
  create-objects 1 [set rock true setxy -7 -8] create-objects 1 [set skull true setxy -10 -11]
  create-objects 1 [set skull true setxy -10 -10] create-objects 1 [set skull true setxy -10 -9]
  create-objects 1 [set skull true setxy -10 -8] create-objects 1 [set skull true setxy -10 -7]
  create-objects 1 [set skull true setxy -9 -7] create-objects 1 [set skull true setxy -8 -7]
  create-objects 1 [set skull true setxy -8 -6] create-objects 1 [set skull true setxy -8 -5]
  create-objects 1 [set skull true setxy -6 -5] create-objects 1 [set skull true setxy -6 -6]
  create-objects 1 [set skull true setxy -6 -7] create-objects 1 [set skull true setxy -5 -7]
  create-objects 1 [set skull true setxy -4 -7] create-objects 1 [set skull true setxy -4 -8]
  create-objects 1 [set skull true setxy -4 -9] create-objects 1 [set skull true setxy -4 -10]
  create-objects 1 [set skull true setxy -4 -11] create-objects 1 [set skull true setxy 0 -4]
  create-objects 1 [set skull true setxy 0 -3] create-objects 1 [set skull true setxy 0 -2]
  create-objects 1 [set skull true setxy 0 -1] create-objects 1 [set skull true setxy 0 0]
  create-objects 1 [set skull true setxy 0 1] create-objects 1 [set skull true setxy 0 2]
  create-objects 1 [set skull true setxy 0 3] create-objects 1 [set skull true setxy 0 4]
  create-objects 1 [set skull true setxy 1 4] create-objects 1 [set skull true setxy 2 4]
  create-objects 1 [set skull true setxy 3 4] create-objects 1 [set skull true setxy 4 4]
  create-objects 1 [set skull true setxy 5 4] create-objects 1 [set skull true setxy 6 4]
  create-objects 1 [set skull true setxy 7 4] create-objects 1 [set skull true setxy 8 4]
  create-objects 1 [set skull true setxy 8 3] create-objects 1 [set skull true setxy 8 2]
  create-objects 1 [set skull true setxy 8 1] create-objects 1 [set skull true setxy 8 0]
  create-objects 1 [set skull true setxy 8 -1] create-objects 1 [set skull true setxy 8 -2]
  create-objects 1 [set skull true setxy 8 -3] create-objects 1 [set skull true setxy 8 -4]
  create-objects 1 [set skull true setxy 7 -4] create-objects 1 [set skull true setxy 6 -4]
  create-objects 1 [set skull true setxy 5 -4] create-objects 1 [set skull true setxy 4 -4]
  create-objects 1 [set skull true setxy 3 -4] create-objects 1 [set skull true setxy 2 -4]
  create-objects 1 [set skull true setxy 1 -4]
end

to setupLevelSixWords
  create-objectWords 1 [set flagWord true setxy -11 11]
  create-objectWords 1 [set babaWord true setxy -11 10]
  create-objectWords 1 [set rockWord true setxy -9 2]
  create-objectWords 1 [set skullWord true setxy 2 2]
  create-adjectiveWords 1 [set winWord true setxy -9 11]
  create-adjectiveWords 1 [set youWord true setxy -9 10]
  create-adjectiveWords 1 [set pushWord true setxy -7 2]
  create-adjectiveWords 1 [set defeatWord true setxy 2 0]
  create-isWords 1 [setxy -10 11] create-isWords 1 [setxy -10 10] create-isWords 1 [setxy -8 2]
  create-isWords 1 [setxy 2 1]
end

to setupLevelSix
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelSix true
  setupBorder
  setupLevelSixObjects
  setupLevelSixWords
end

to setupLevelSevenObjects
  create-objects 1 [set baba true setxy -3 0] create-objects 1 [set flag true setxy 6 5]
  create-objects 1 [set rock true setxy -7 11] create-objects 1 [set rock true setxy -7 10]
  create-objects 1 [set rock true setxy -7 9] create-objects 1 [set rock true setxy -7 8]
  create-objects 1 [set rock true setxy -7 7] create-objects 1 [set rock true setxy -7 6]
  create-objects 1 [set rock true setxy -7 5] create-objects 1 [set rock true setxy -8 5]
  create-objects 1 [set rock true setxy -9 5] create-objects 1 [set rock true setxy -10 5]
  create-objects 1 [set rock true setxy -11 5] create-objects 1 [set skull true setxy 1 11]
  create-objects 1 [set skull true setxy 1 10] create-objects 1 [set skull true setxy 1 9]
  create-objects 1 [set skull true setxy 1 8] create-objects 1 [set skull true setxy 1 7]
  create-objects 1 [set skull true setxy 1 6] create-objects 1 [set skull true setxy 1 5]
  create-objects 1 [set skull true setxy 1 4] create-objects 1 [set skull true setxy 1 3]
  create-objects 1 [set skull true setxy 1 2] create-objects 1 [set skull true setxy 1 1]
  create-objects 1 [set skull true setxy 1 0] create-objects 1 [set skull true setxy 1 -1]
  create-objects 1 [set skull true setxy 2 -1] create-objects 1 [set skull true setxy 3 -1]
  create-objects 1 [set skull true setxy 4 -1] create-objects 1 [set skull true setxy 5 -1]
  create-objects 1 [set skull true setxy 6 -1] create-objects 1 [set skull true setxy 7 -1]
  create-objects 1 [set skull true setxy 8 -1] create-objects 1 [set skull true setxy 9 -1]
  create-objects 1 [set skull true setxy 10 -1] create-objects 1 [set skull true setxy 11 -1]
  create-objects 1 [set wall true setxy -5 -2] create-objects 1 [set wall true setxy -6 -2]
  create-objects 1 [set wall true setxy -6 -1] create-objects 1 [set wall true setxy -6 0]
  create-objects 1 [set wall true setxy -6 1] create-objects 1 [set wall true setxy -6 2]
  create-objects 1 [set wall true setxy -6 3] create-objects 1 [set wall true setxy -5 3]
  create-objects 1 [set wall true setxy -4 3] create-objects 1 [set wall true setxy -3 3]
  create-objects 1 [set wall true setxy -2 3] create-objects 1 [set wall true setxy -1 3]
  create-objects 1 [set wall true setxy -1 2] create-objects 1 [set wall true setxy -1 4]
  create-objects 1 [set wall true setxy -1 5] create-objects 1 [set wall true setxy -1 6]
  create-objects 1 [set wall true setxy -1 7] create-objects 1 [set wall true setxy 0 7]
  create-objects 1 [set wall true setxy 2 7] create-objects 1 [set wall true setxy 3 7]
  create-objects 1 [set wall true setxy 4 7] create-objects 1 [set wall true setxy 4 6]
  create-objects 1 [set wall true setxy 5 7] create-objects 1 [set wall true setxy 6 7]
  create-objects 1 [set wall true setxy 7 7] create-objects 1 [set wall true setxy 8 7]
  create-objects 1 [set wall true setxy 8 6] create-objects 1 [set wall true setxy 8 5]
  create-objects 1 [set wall true setxy 8 4] create-objects 1 [set wall true setxy 8 3]
  create-objects 1 [set wall true setxy 7 3] create-objects 1 [set wall true setxy 6 3]
  create-objects 1 [set wall true setxy 5 3] create-objects 1 [set wall true setxy 4 3]
  create-objects 1 [set wall true setxy 4 4] create-objects 1 [set wall true setxy 4 2]
  create-objects 1 [set wall true setxy 3 2] create-objects 1 [set wall true setxy 2 2]
  create-objects 1 [set wall true setxy 4 1] create-objects 1 [set wall true setxy 4 0]
  create-objects 1 [set wall true setxy 4 -2] create-objects 1 [set wall true setxy 4 -3]
  create-objects 1 [set wall true setxy 4 -4] create-objects 1 [set wall true setxy 4 -5]
  create-objects 1 [set wall true setxy 3 -5] create-objects 1 [set wall true setxy 2 -5]
  create-objects 1 [set wall true setxy 1 -5] create-objects 1 [set wall true setxy 0 -5]
  create-objects 1 [set wall true setxy -1 -5] create-objects 1 [set wall true setxy -1 -4]
  create-objects 1 [set wall true setxy -1 -3] create-objects 1 [set wall true setxy -1 -2]
  create-objects 1 [set wall true setxy -1 -1] create-objects 1 [set wall true setxy -1 0]
  create-objects 1 [set wall true setxy -4 -2] create-objects 1 [set wall true setxy -3 -2]
  create-objects 1 [set wall true setxy -2 -2]
end

to setupLevelSevenWords
  create-objectWords 1 [set rockWord true setxy -11 11]
  create-objectWords 1 [set skullWord true setxy -11 9]
  create-objectWords 1 [set flagWord true setxy -11 7]
  create-objectWords 1 [set babaWord true setxy -3 -6]
  create-objectWords 1 [set wallWord true setxy 1 -3]
  create-adjectiveWords 1 [set haltWord true setxy -9 11]
  create-adjectiveWords 1 [set defeatWord true setxy -9 9]
  create-adjectiveWords 1 [set winWord true setxy -9 7]
  create-adjectiveWords 1 [set youWord true setxy -3 -8]
  create-adjectiveWords 1 [set haltWord true setxy 3 -3]
  create-isWords 1 [setxy -10 11] create-isWords 1 [setxy -10 9] create-isWords 1 [setxy -10 7]
  create-isWords 1 [setxy -3 -7] create-isWords 1 [setxy 2 -3]
end

to setupLevelSeven
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelSeven true
  setupBorder
  setupLevelSevenObjects
  setupLevelSevenWords
end

to setupLevelEightObjects
  create-objects 1 [set baba true setxy -3 0] create-objects 1 [set flag true setxy 4 3]
  create-objects 1 [set wall true setxy 6 5] create-objects 1 [set wall true setxy 5 5]
  create-objects 1 [set wall true setxy 4 5] create-objects 1 [set wall true setxy 3 5]
  create-objects 1 [set wall true setxy 2 5] create-objects 1 [set wall true setxy 1 5]
  create-objects 1 [set wall true setxy 0 5] create-objects 1 [set wall true setxy  -1 5]
  create-objects 1 [set wall true setxy -2 5] create-objects 1 [set wall true setxy -3 5]
  create-objects 1 [set wall true setxy -4 5] create-objects 1 [set wall true setxy -5 5]
  create-objects 1 [set wall true setxy -6 5] create-objects 1 [set wall true setxy -7 5]
  create-objects 1 [set wall true setxy -7 4] create-objects 1 [set wall true setxy -7 3]
  create-objects 1 [set wall true setxy -7 2] create-objects 1 [set wall true setxy -7 1]
  create-objects 1 [set wall true setxy -7 0] create-objects 1 [set wall true setxy -7 -1]
  create-objects 1 [set wall true setxy -7 -2] create-objects 1 [set wall true setxy -7 -3]
  create-objects 1 [set wall true setxy -7 -4] create-objects 1 [set wall true setxy -6 -4]
  create-objects 1 [set wall true setxy -5 -4] create-objects 1 [set wall true setxy  -4 -4]
  create-objects 1 [set wall true setxy -3 -4] create-objects 1 [set wall true setxy -2 -4]
  create-objects 1 [set wall true setxy -1 -4] create-objects 1 [set wall true setxy 0 -4]
  create-objects 1 [set wall true setxy 1 -4] create-objects 1 [set wall true setxy 2 -4]
  create-objects 1 [set wall true setxy 3 -4] create-objects 1 [set wall true setxy 4 -4]
  create-objects 1 [set wall true setxy 5 -4] create-objects 1 [set wall true setxy 6 -4]
  create-objects 1 [set wall true setxy 6 -3] create-objects 1 [set wall true setxy 6 -2]
  create-objects 1 [set wall true setxy 6 -1] create-objects 1 [set wall true setxy 6 0]
  create-objects 1 [set wall true setxy 6 1] create-objects 1 [set wall true setxy 6 2]
  create-objects 1 [set wall true setxy 6 3] create-objects 1 [set wall true setxy 6 4]
  create-objects 1 [set rock true setxy 9 0] create-objects 1 [set rock true setxy 9 1]
  create-objects 1 [set rock true setxy 9 2] create-objects 1 [set rock true setxy 10 2]
  create-objects 1 [set rock true setxy 11 2] create-objects 1 [set rock true setxy 11 1]
  create-objects 1 [set rock true setxy 11 0] create-objects 1 [set rock true setxy 11 -1]
  create-objects 1 [set rock true setxy 11 -2] create-objects 1 [set rock true setxy 10 -2]
  create-objects 1 [set rock true setxy 9 -2] create-objects 1 [set rock true setxy 9 -1]
  create-objects 1 [set rock true setxy 0 0] create-objects 1 [set rock true setxy 0 -1]
  create-objects 1 [set rock true setxy 0 -2] create-objects 1 [set rock true setxy 1 -3]
  create-objects 1 [set rock true setxy -6 2] create-objects 1 [set rock true setxy -6 -1]
  create-objects 1 [set rock true setxy -5 -2] create-objects 1 [set rock true setxy -2 4]
  create-objects 1 [set rock true setxy -2 -3] create-objects 1 [set rock true setxy 1 2]
  create-objects 1 [set rock true setxy 2 1] create-objects 1 [set rock true setxy 3 0]
  create-objects 1 [set rock true setxy 3 -2] create-objects 1 [set rock true setxy 4 1]
  create-objects 1 [set rock true setxy 5 0]
end

to setupLevelEightWords
  create-objectWords 1 [set babaWord true setxy -5 3]
  create-objectWords 1 [set flagWord true setxy 2 -1]
  create-objectWords 1 [set rockWord true setxy 10 1]
  create-adjectiveWords 1 [set youWord true setxy -3 3]
  create-adjectiveWords 1 [set winWord true setxy 4 -1]
  create-adjectiveWords 1 [set haltWord true setxy 10 -1]
  create-isWords 1 [setxy -4 3] create-isWords 1 [setxy 10 0]
end

to setupLevelEight
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelEight true
  setupBorder
  setupLevelEightObjects
  setupLevelEightWords
end

to setupLevelNineObjects
  create-objects 1 [set baba true setxy -3 3] create-objects 1 [set rock true setxy 2 3]
  create-objects 1 [set flag true setxy 0 -2] create-objects 1 [set crab true setxy -1 -2]
  create-objects 1 [set crab true setxy -2 -2] create-objects 1 [set wall true setxy 0 -4]
  create-objects 1 [set wall true setxy -1 -4] create-objects 1 [set wall true setxy -2 -4]
  create-objects 1 [set wall true setxy -3 -4] create-objects 1 [set wall true setxy -4 -4]
  create-objects 1 [set wall true setxy -5 -4] create-objects 1 [set wall true setxy -6 -4]
  create-objects 1 [set wall true setxy -7 -4] create-objects 1 [set wall true setxy -7 -3]
  create-objects 1 [set wall true setxy -7 -2] create-objects 1 [set wall true setxy -7 -1]
  create-objects 1 [set wall true setxy -7 0] create-objects 1 [set wall true setxy -7 1]
  create-objects 1 [set wall true setxy -7 2] create-objects 1 [set wall true setxy -7 3]
  create-objects 1 [set wall true setxy -7 4] create-objects 1 [set wall true setxy -7 5]
  create-objects 1 [set wall true setxy -6 5] create-objects 1 [set wall true setxy -5 5]
  create-objects 1 [set wall true setxy -4 5] create-objects 1 [set wall true setxy -3 5]
  create-objects 1 [set wall true setxy -2 5] create-objects 1 [set wall true setxy -1 5]
  create-objects 1 [set wall true setxy 0 5] create-objects 1 [set wall true setxy 1 5]
  create-objects 1 [set wall true setxy 2 5] create-objects 1 [set wall true setxy 2 4]
  create-objects 1 [set wall true setxy 3 4] create-objects 1 [set wall true setxy 4 4]
  create-objects 1 [set wall true setxy 5 4] create-objects 1 [set wall true setxy 6 4]
  create-objects 1 [set wall true setxy 7 4] create-objects 1 [set wall true setxy 8 4]
  create-objects 1 [set wall true setxy 8 3] create-objects 1 [set wall true setxy 8 2]
  create-objects 1 [set wall true setxy 8 1] create-objects 1 [set wall true setxy 8 0]
  create-objects 1 [set wall true setxy 8 -1] create-objects 1 [set wall true setxy 8 -2]
  create-objects 1 [set wall true setxy 8 -3] create-objects 1 [set wall true setxy 8 -4]
  create-objects 1 [set wall true setxy 7 -4] create-objects 1 [set wall true setxy 6 -4]
  create-objects 1 [set wall true setxy 5 -4] create-objects 1 [set wall true setxy 4 -4]
  create-objects 1 [set wall true setxy 3 -4] create-objects 1 [set wall true setxy 2 -4]
  create-objects 1 [set wall true setxy 1 -4] create-objects 1 [set wall true setxy -3 -3]
  create-objects 1 [set wall true setxy -2 -3] create-objects 1 [set wall true setxy -2 -1]
  create-objects 1 [set wall true setxy -2 0] create-objects 1 [set wall true setxy -1 0]
  create-objects 1 [set wall true setxy 0 0] create-objects 1 [set wall true setxy 1 0]
  create-objects 1 [set wall true setxy 2 0] create-objects 1 [set wall true setxy 2 1]
  create-objects 1 [set wall true setxy 2 2] create-objects 1 [set wall true setxy 2 -1]
  create-objects 1 [set wall true setxy 2 -2] create-objects 1 [set wall true setxy 2 -3]
  create-objects 1 [set wall true setxy 5 2] create-objects 1 [set wall true setxy 5 1]
  create-objects 1 [set wall true setxy 5 0] create-objects 1 [set wall true setxy 6 0]
  create-objects 1 [set wall true setxy 7 0]
end

to setupLevelNineWords
  create-objectWords 1 [set babaWord true setxy -4 2]
  create-objectWords 1 [set wallWord true setxy -6 -3]
  create-objectWords 1 [set crabWord true setxy 5 3]
  create-objectWords 1 [set flagWord true setxy 6 3]
  create-objectWords 1 [set rockWord true setxy 4 -2]
  create-adjectiveWords 1 [set youWord true setxy -2 2]
  create-adjectiveWords 1 [set haltWord true setxy -4 -3]
  create-adjectiveWords 1 [set pushWord true setxy 6 -2]
  create-adjectiveWords 1 [set defeatWord true setxy 6 1]
  create-adjectiveWords 1 [set winWord true setxy 7 1]
  create-isWords 1 [setxy -3 2] create-isWords 1 [setxy -5 -3] create-isWords 1 [setxy 5 -2]
  create-isWords 1 [setxy 6 2] create-isWords 1 [setxy 7 2]
end

to setupLevelNine
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelNine true
  setupBorder
  setupLevelNineObjects
  setupLevelNineWords
end

to setupLevelTenObjects
  create-objects 1 [set baba true setxy -8 5] create-objects 1 [set flag true setxy 9 5]
  create-objects 1 [set star true setxy 9 7] create-objects 1 [set star true setxy 10 7]
  create-objects 1 [set star true setxy 10 6] create-objects 1 [set star true setxy 11 6]
  create-objects 1 [set star true setxy 11 5] create-objects 1 [set star true setxy 11 4]
  create-objects 1 [set star true setxy 10 4] create-objects 1 [set star true setxy 10 3]
  create-objects 1 [set star true setxy 9 3] create-objects 1 [set star true setxy 8 3]
  create-objects 1 [set star true setxy 8 4] create-objects 1 [set star true setxy 7 4]
  create-objects 1 [set star true setxy 7 5] create-objects 1 [set star true setxy 7 6]
  create-objects 1 [set star true setxy 8 6] create-objects 1 [set star true setxy 8 7]
  create-objects 1 [set proxyA true setxy -9 3] create-objects 1 [set proxyA true setxy -10 3]
  create-objects 1 [set proxyA true setxy -10 4] create-objects 1 [set proxyA true setxy -10 5]
  create-objects 1 [set proxyA true setxy -10 6] create-objects 1 [set proxyA true setxy -10 7]
  create-objects 1 [set proxyA true setxy -9 7] create-objects 1 [set proxyA true setxy -8 7]
  create-objects 1 [set proxyA true setxy -7 7] create-objects 1 [set proxyA true setxy -6 7]
  create-objects 1 [set proxyA true setxy -6 6] create-objects 1 [set proxyA true setxy -6 5]
  create-objects 1 [set proxyA true setxy -6 4] create-objects 1 [set proxyA true setxy -6 3]
  create-objects 1 [set proxyA true setxy -7 3] create-objects 1 [set proxyA true setxy -10 -1]
  create-objects 1 [set proxyA true setxy -10 -2] create-objects 1 [set proxyA true setxy -9 -2]
  create-objects 1 [set proxyA true setxy -8 -2] create-objects 1 [set proxyA true setxy -7 -2]
  create-objects 1 [set proxyA true setxy -6 -2] create-objects 1 [set proxyA true setxy -5 -2]
  create-objects 1 [set proxyA true setxy -4 -2] create-objects 1 [set proxyA true setxy -4 0]
  create-objects 1 [set proxyA true setxy -5 0] create-objects 1 [set proxyA true setxy -6 0]
  create-objects 1 [set proxyA true setxy -7 0] create-objects 1 [set proxyA true setxy -2 -1]
end

to setupLevelTenWords
  create-objectWords 1 [set flagWord true setxy -11 11]
  create-objectWords 1 [set proxyAWord true setxy 9 -11]
  create-objectWords 1 [set starWord true setxy 9 11]
  create-objectWords 1 [set babaWord true setxy -7 -1]
  create-objectWords 1 [set proxyAWord true setxy 2 3]
  create-adjectiveWords 1 [set winWord true setxy -9 11]
  create-adjectiveWords 1 [set haltWord true setxy 11 -11]
  create-adjectiveWords 1 [set sinkWord true setxy 11 11]
  create-adjectiveWords 1 [set youWord true setxy -5 -1]
  create-adjectiveWords 1 [set sinkWord true setxy -3 -1]
  create-isWords 1 [setxy -10 11] create-isWords 1 [setxy 10 -11] create-isWords 1 [setxy 10 11]
  create-isWords 1 [setxy -6 -1] create-andWords 1 [setxy -4 -1]
end

to setupLevelTen
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelTen true
  set proxyAShape 1
  setupBorder
  setupLevelTenObjects
  setupLevelTenWords
end

to setupLevelElevenObjects
  create-objects 1 [set proxyB true setxy 0 9] create-objects 1 [set rock true setxy -2 5]
  create-objects 1 [set flag true setxy 9 -7] create-objects 1 [set wall true setxy -2 11]
  create-objects 1 [set wall true setxy -2 10] create-objects 1 [set wall true setxy 2 11]
  create-objects 1 [set wall true setxy 2 10] create-objects 1 [set wall true setxy 2 9]
  create-objects 1 [set wall true setxy 2 8] create-objects 1 [set wall true setxy 2 7]
  create-objects 1 [set wall true setxy 1 7] create-objects 1 [set wall true setxy 0 7]
  create-objects 1 [set wall true setxy -1 7] create-objects 1 [set wall true setxy -2 7]
  create-objects 1 [set wall true setxy -2 8] create-objects 1 [set wall true setxy -2 6]
  create-objects 1 [set wall true setxy -3 6] create-objects 1 [set wall true setxy -8 11]
  create-objects 1 [set wall true setxy -8 10] create-objects 1 [set wall true setxy -8 9]
  create-objects 1 [set wall true setxy -8 8] create-objects 1 [set wall true setxy -8 7]
  create-objects 1 [set wall true setxy -8 6] create-objects 1 [set wall true setxy -7 6]
  create-objects 1 [set wall true setxy -8 5] create-objects 1 [set wall true setxy -8 4]
  create-objects 1 [set wall true setxy -8 3] create-objects 1 [set wall true setxy -7 4]
  create-objects 1 [set wall true setxy -6 4] create-objects 1 [set wall true setxy -6 3]
  create-objects 1 [set wall true setxy -5 4] create-objects 1 [set wall true setxy -4 4]
  create-objects 1 [set wall true setxy -3 4] create-objects 1 [set wall true setxy -2 4]
  create-objects 1 [set wall true setxy -7 -2] create-objects 1 [set wall true setxy -3 -2]
  create-objects 1 [set wall true setxy -7 -3] create-objects 1 [set wall true setxy -7 -4]
  create-objects 1 [set wall true setxy -7 -5] create-objects 1 [set wall true setxy -6 -5]
  create-objects 1 [set wall true setxy -5 -5] create-objects 1 [set wall true setxy -4 -5]
  create-objects 1 [set wall true setxy -3 -5] create-objects 1 [set wall true setxy -3 -4]
  create-objects 1 [set wall true setxy -3 -3] create-objects 1 [set wall true setxy -4 -3]
  create-objects 1 [set wall true setxy -5 -3] create-objects 1 [set wall true setxy -6 -3]
  create-objects 1 [set proxyA true setxy -11 10] create-objects 1 [set proxyA true setxy -10 10]
  create-objects 1 [set proxyA true setxy -9 10] create-objects 1 [set proxyA true setxy 7 11]
  create-objects 1 [set proxyA true setxy 8 11] create-objects 1 [set proxyA true setxy 9 11]
  create-objects 1 [set proxyA true setxy 10 11] create-objects 1 [set proxyA true setxy 6 10]
  create-objects 1 [set proxyA true setxy 7 10] create-objects 1 [set proxyA true setxy 8 10]
  create-objects 1 [set proxyA true setxy 9 10] create-objects 1 [set proxyA true setxy 10 10]
  create-objects 1 [set proxyA true setxy 6 9] create-objects 1 [set proxyA true setxy 7 9]
  create-objects 1 [set proxyA true setxy 8 9] create-objects 1 [set proxyA true setxy 5 8]
  create-objects 1 [set proxyA true setxy 6 8] create-objects 1 [set proxyA true setxy 7 8]
  create-objects 1 [set proxyA true setxy 4 7] create-objects 1 [set proxyA true setxy 5 7]
  create-objects 1 [set proxyA true setxy 6 7] create-objects 1 [set proxyA true setxy 7 7]
  create-objects 1 [set proxyA true setxy 3 4] create-objects 1 [set proxyA true setxy 4 6]
  create-objects 1 [set proxyA true setxy 5 6] create-objects 1 [set proxyA true setxy 6 6]
  create-objects 1 [set proxyA true setxy 3 5] create-objects 1 [set proxyA true setxy 4 5]
  create-objects 1 [set proxyA true setxy 5 5] create-objects 1 [set proxyA true setxy 6 5]
  create-objects 1 [set proxyA true setxy 3 4] create-objects 1 [set proxyA true setxy 4 4]
  create-objects 1 [set proxyA true setxy 5 4] create-objects 1 [set proxyA true setxy 6 4]
  create-objects 1 [set proxyA true setxy 2 3] create-objects 1 [set proxyA true setxy 3 3]
  create-objects 1 [set proxyA true setxy 4 3] create-objects 1 [set proxyA true setxy 5 3]
  create-objects 1 [set proxyA true setxy 2 2] create-objects 1 [set proxyA true setxy 3 2]
  create-objects 1 [set proxyA true setxy 4 2] create-objects 1 [set proxyA true setxy 5 2]
  create-objects 1 [set proxyA true setxy 2 1] create-objects 1 [set proxyA true setxy 3 1]
  create-objects 1 [set proxyA true setxy 4 1] create-objects 1 [set proxyA true setxy 5 1]
  create-objects 1 [set proxyA true setxy 1 0] create-objects 1 [set proxyA true setxy 2 0]
  create-objects 1 [set proxyA true setxy 3 0] create-objects 1 [set proxyA true setxy 4 0]
  create-objects 1 [set proxyA true setxy 1 -1] create-objects 1 [set proxyA true setxy 2 -1]
  create-objects 1 [set proxyA true setxy 3 -1] create-objects 1 [set proxyA true setxy 4 -1]
  create-objects 1 [set proxyA true setxy 0 -2] create-objects 1 [set proxyA true setxy 1 -2]
  create-objects 1 [set proxyA true setxy 2 -2] create-objects 1 [set proxyA true setxy 3 -2]
  create-objects 1 [set proxyA true setxy 4 -2] create-objects 1 [set proxyA true setxy 0 -3]
  create-objects 1 [set proxyA true setxy 1 -3] create-objects 1 [set proxyA true setxy 2 -3]
  create-objects 1 [set proxyA true setxy 3 -3] create-objects 1 [set proxyA true setxy 0 -4]
  create-objects 1 [set proxyA true setxy 1 -4] create-objects 1 [set proxyA true setxy 2 -4]
  create-objects 1 [set proxyA true setxy 3 -4] create-objects 1 [set proxyA true setxy -1 -5]
  create-objects 1 [set proxyA true setxy 0 -5] create-objects 1 [set proxyA true setxy 1 -5]
  create-objects 1 [set proxyA true setxy 2 -5] create-objects 1 [set proxyA true setxy -1 -6]
  create-objects 1 [set proxyA true setxy 0 -6] create-objects 1 [set proxyA true setxy 1 -6]
  create-objects 1 [set proxyA true setxy 2 -6] create-objects 1 [set proxyA true setxy -1 -7]
  create-objects 1 [set proxyA true setxy 0 -7] create-objects 1 [set proxyA true setxy 1 -7]
  create-objects 1 [set proxyA true setxy 2 -7] create-objects 1 [set proxyA true setxy -2 -8]
  create-objects 1 [set proxyA true setxy -1 -8] create-objects 1 [set proxyA true setxy 0 -8]
  create-objects 1 [set proxyA true setxy 1 -8] create-objects 1 [set proxyA true setxy -3 -9]
  create-objects 1 [set proxyA true setxy -2 -9] create-objects 1 [set proxyA true setxy -1 -9]
  create-objects 1 [set proxyA true setxy 0 -9] create-objects 1 [set proxyA true setxy -4 -10]
  create-objects 1 [set proxyA true setxy -3 -10] create-objects 1 [set proxyA true setxy -2 -10]
  create-objects 1 [set proxyA true setxy -1 -10] create-objects 1 [set proxyA true setxy -5 -11]
  create-objects 1 [set proxyA true setxy -4 -11] create-objects 1 [set proxyA true setxy -3 -11]
  create-objects 1 [set proxyA true setxy -2 -11] create-objects 1 [set proxyA true setxy -1 -11]
end

to setupLevelElevenWords
  create-objectWords 1 [set wallWord true setxy -11 11]
  create-objectWords 1 [set proxyBWord true setxy -6 7]
  create-objectWords 1 [set rockWord true setxy -7 3]
  create-objectWords 1 [set proxyAWord true setxy -2 0]
  create-objectWords 1 [set proxyBWord true setxy -6 -2]
  create-objectWords 1 [set proxyAWord true setxy -6 -4]
  create-objectWords 1 [set flagWord true setxy 8 -8]
  create-adjectiveWords 1 [set haltWord true setxy -9 11]
  create-adjectiveWords 1 [set youWord true setxy -4 7]
  create-adjectiveWords 1 [set pushWord true setxy -7 1]
  create-adjectiveWords 1 [set meltWord true setxy -4 -2]
  create-adjectiveWords 1 [set hotWord true setxy -4 -4]
  create-adjectiveWords 1 [set winWord true setxy 10 -8]
  create-isWords 1 [setxy -10 11] create-isWords 1 [setxy -5 7] create-isWords 1 [setxy -7 2]
  create-isWords 1 [setxy -5 -2] create-isWords 1 [setxy -5 -4] create-isWords 1 [setxy 9 -8]
end

to setupLevelEleven
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelEleven true
  set proxyAShape 2
  set proxyBShape 0
  setupBorder
  setupLevelElevenObjects
  setupLevelElevenWords
end

to setupLevelTwelveObjects
  create-objects 1 [set baba true setxy 8 0] create-objects 1 [set flag true setxy -9 -8]
  create-objects 1 [set wall true setxy 10 0] create-objects 1 [set wall true setxy 10 1]
  create-objects 1 [set wall true setxy 10 -1] create-objects 1 [set wall true setxy 10 2]
  create-objects 1 [set wall true setxy 10 -2] create-objects 1 [set wall true setxy 9 2]
  create-objects 1 [set wall true setxy 9 -2] create-objects 1 [set wall true setxy 8 2]
  create-objects 1 [set wall true setxy 8 -2] create-objects 1 [set wall true setxy 7 2]
  create-objects 1 [set wall true setxy 7 -2] create-objects 1 [set wall true setxy 6 2]
  create-objects 1 [set wall true setxy 6 -2] create-objects 1 [set wall true setxy 6 1]
  create-objects 1 [set wall true setxy 6 -1] create-objects 1 [set wall true setxy 6 3]
  create-objects 1 [set wall true setxy 6 -3] create-objects 1 [set wall true setxy 6 4]
  create-objects 1 [set wall true setxy 6 -4] create-objects 1 [set wall true setxy 6 5]
  create-objects 1 [set wall true setxy 6 -5] create-objects 1 [set wall true setxy 6 6]
  create-objects 1 [set wall true setxy 6 -6] create-objects 1 [set wall true setxy 6 7]
  create-objects 1 [set wall true setxy 6 -7] create-objects 1 [set wall true setxy 5 7]
  create-objects 1 [set wall true setxy 5 -7] create-objects 1 [set wall true setxy 4 7]
  create-objects 1 [set wall true setxy 4 -7] create-objects 1 [set wall true setxy 3 7]
  create-objects 1 [set wall true setxy 3 -7] create-objects 1 [set wall true setxy 2 7]
  create-objects 1 [set wall true setxy 2 -7] create-objects 1 [set wall true setxy 1 7]
  create-objects 1 [set wall true setxy 1 -7] create-objects 1 [set wall true setxy 0 7]
  create-objects 1 [set wall true setxy 0 -7] create-objects 1 [set wall true setxy -1 7]
  create-objects 1 [set wall true setxy -1 -7] create-objects 1 [set wall true setxy -2 7]
  create-objects 1 [set wall true setxy -2 -7] create-objects 1 [set wall true setxy -3 7]
  create-objects 1 [set wall true setxy -3 -7] create-objects 1 [set wall true setxy -4 7]
  create-objects 1 [set wall true setxy -4 -7] create-objects 1 [set wall true setxy -5 7]
  create-objects 1 [set wall true setxy -5 -7] create-objects 1 [set wall true setxy -5 6]
  create-objects 1 [set wall true setxy -5 -6] create-objects 1 [set wall true setxy -5 5]
  create-objects 1 [set wall true setxy -5 -5] create-objects 1 [set wall true setxy -5 4]
  create-objects 1 [set wall true setxy -5 -4] create-objects 1 [set wall true setxy -5 3]
  create-objects 1 [set wall true setxy -5 -3] create-objects 1 [set wall true setxy -4 3]
  create-objects 1 [set wall true setxy -5 -2] create-objects 1 [set wall true setxy -3 3]
  create-objects 1 [set wall true setxy -5 -1] create-objects 1 [set wall true setxy -6 5]
  create-objects 1 [set wall true setxy -5 0] create-objects 1 [set wall true setxy -7 5]
  create-objects 1 [set wall true setxy -5 1] create-objects 1 [set wall true setxy -8 5]
  create-objects 1 [set wall true setxy -4 1] create-objects 1 [set wall true setxy -9 5]
  create-objects 1 [set wall true setxy -3 1] create-objects 1 [set wall true setxy -9 4]
  create-objects 1 [set wall true setxy -9 3] create-objects 1 [set wall true setxy -9 2]
  create-objects 1 [set wall true setxy -9 1] create-objects 1 [set wall true setxy -9 0]
  create-objects 1 [set wall true setxy -9 -1] create-objects 1 [set wall true setxy -8 -1]
  create-objects 1 [set wall true setxy -8 -2] create-objects 1 [set wall true setxy -8 -3]
  create-objects 1 [set wall true setxy -8 -4] create-objects 1 [set wall true setxy -7 -4]
  create-objects 1 [set wall true setxy -6 -4] create-objects 1 [set wall true setxy -6 -3]
  create-objects 1 [set wall true setxy -6 -2] create-objects 1 [set wall true setxy -6 -1]
  create-objects 1 [set skull true setxy -5 2] create-objects 1 [set star true setxy -3 2]
  create-objects 1 [set rock true setxy 6 0] create-objects 1 [set rock true setxy 0 -2]
  create-objects 1 [set crab true setxy -10 -1]
end

to setupLevelTwelveWords
  create-objectWords 1 [set flagWord true setxy -11 11]
  create-objectWords 1 [set babaWord true setxy -7 -1]
  create-objectWords 1 [set rockWord true setxy 0 1]
  create-objectWords 1 [set starWord true setxy 0 3]
  create-objectWords 1 [set wallWord true setxy 9 11]
  create-objectWords 1 [set crabWord true setxy -7 2]
  create-objectWords 1 [set skullWord true setxy 9 -11]
  create-adjectiveWords 1 [set winWord true setxy -9 11]
  create-adjectiveWords 1 [set youWord true setxy -7 -3]
  create-adjectiveWords 1 [set sinkWord true setxy 2 3]
  create-adjectiveWords 1 [set pushWord true setxy 2 1]
  create-adjectiveWords 1 [set haltWord true setxy 11 11]
  create-adjectiveWords 1 [set defeatWord true setxy 11 -11]
  create-isWords 1 [setxy -10 11]  create-isWords 1 [setxy -7 -2]  create-isWords 1 [setxy 1 3]
  create-isWords 1 [setxy 1 1] create-isWords 1 [setxy 10 11]  create-isWords 1 [setxy 10 -11]
  create-andWords 1 [setxy 2 -2]
end

to setupLevelTwelve
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelTwelve true
  setupBorder
  setupLevelTwelveObjects
  setupLevelTwelveWords
end

to setupLevelThirteenObjects
  create-objects 1 [set baba true setxy -6 0] create-objects 1 [set flag true setxy 6 0]
  create-objects 1 [set wall true setxy -4 1] create-objects 1 [set wall true setxy -4 2]
  create-objects 1 [set wall true setxy -5 2] create-objects 1 [set wall true setxy -6 2]
  create-objects 1 [set wall true setxy -7 2] create-objects 1 [set wall true setxy -8 2]
  create-objects 1 [set wall true setxy -8 1] create-objects 1 [set wall true setxy -8 0]
  create-objects 1 [set wall true setxy -8 -1] create-objects 1 [set wall true setxy -8 -2]
  create-objects 1 [set wall true setxy -7 -2] create-objects 1 [set wall true setxy -6 -2]
  create-objects 1 [set wall true setxy -5 -2] create-objects 1 [set wall true setxy -4 -2]
  create-objects 1 [set wall true setxy -4 -1] create-objects 1 [set star true setxy 4 0]
  create-objects 1 [set star true setxy 4 1] create-objects 1 [set star true setxy 4 2]
  create-objects 1 [set star true setxy 5 2] create-objects 1 [set star true setxy 6 2]
  create-objects 1 [set star true setxy 7 2] create-objects 1 [set star true setxy 8 2]
  create-objects 1 [set star true setxy 8 1] create-objects 1 [set star true setxy 8 0]
  create-objects 1 [set star true setxy 8 -1] create-objects 1 [set star true setxy 8 -2]
  create-objects 1 [set star true setxy 7 -2] create-objects 1 [set star true setxy 6 -2]
  create-objects 1 [set star true setxy 5 -2] create-objects 1 [set star true setxy 4 -2]
  create-objects 1 [set star true setxy 4 -1] create-objects 1 [set pillar true setxy -4 0]
  create-objects 1 [set pillar true setxy 6 -5] create-objects 1 [set pillar true setxy 7 6]
  create-objects 1 [set pillar true setxy 1 4] create-objects 1 [set pillar true setxy -1 5]
  create-objects 1 [set pillar true setxy 0 -5]
end

to setupLevelThirteenWords
  create-objectWords 1 [set flagWord true setxy -11 11]
  create-objectWords 1 [set wallWord true setxy -11 1]
  create-objectWords 1 [set pillarWord true setxy -7 6]
  create-objectWords 1 [set babaWord true setxy -7 -6]
  create-objectWords 1 [set starWord true setxy 9 -11]
  create-adjectiveWords 1 [set winWord true setxy -9 11]
  create-adjectiveWords 1 [set haltWord true setxy -11 -1]
  create-adjectiveWords 1 [set pushWord true setxy -5 6]
  create-adjectiveWords 1 [set youWord true setxy -5 -6]
  create-adjectiveWords 1 [set defeatWord true setxy 11 -11]
  create-isWords 1 [setxy -10 11] create-isWords 1 [setxy -11 0] create-isWords 1 [setxy -6 6]
  create-isWords 1 [setxy -6 -6] create-isWords 1 [setxy 10 -11]
end

to setupLevelThirteen
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelThirteen true
  setupBorder
  setupLevelThirteenObjects
  setupLevelThirteenWords
end

to setupLevelFourteenObjects
  create-objects 1 [set baba true setxy -2 4] create-objects 1 [set star true setxy -2 2]
  create-objects 1 [set star true setxy -1 2] create-objects 1 [set star true setxy 0 2]
  create-objects 1 [set star true setxy 0 3] create-objects 1 [set proxyA true setxy -2 5]
  create-objects 1 [set proxyA true setxy -1 5] create-objects 1 [set proxyA true setxy 0 5]
  create-objects 1 [set proxyA true setxy 1 5] create-objects 1 [set proxyA true setxy 2 5]
  create-objects 1 [set proxyA true setxy 3 5] create-objects 1 [set proxyA true setxy 4 5]
  create-objects 1 [set proxyA true setxy 5 5] create-objects 1 [set proxyA true setxy 5 4]
  create-objects 1 [set proxyA true setxy 5 3] create-objects 1 [set proxyA true setxy 5 2]
  create-objects 1 [set proxyA true setxy 5 1] create-objects 1 [set proxyA true setxy 5 0]
  create-objects 1 [set proxyA true setxy 5 -1] create-objects 1 [set proxyA true setxy 5 -2]
  create-objects 1 [set proxyA true setxy 5 -3] create-objects 1 [set proxyA true setxy 5 -4]
  create-objects 1 [set proxyA true setxy 4 -4] create-objects 1 [set proxyA true setxy 3 -4]
  create-objects 1 [set proxyA true setxy 2 -4] create-objects 1 [set proxyA true setxy 1 -4]
  create-objects 1 [set proxyA true setxy 0 -4] create-objects 1 [set proxyA true setxy -1 -4]
  create-objects 1 [set proxyA true setxy -2 -4] create-objects 1 [set proxyA true setxy -3 -4]
  create-objects 1 [set proxyA true setxy -3 -3] create-objects 1 [set proxyA true setxy -3 -2]
  create-objects 1 [set proxyA true setxy -3 -1] create-objects 1 [set proxyA true setxy -3 0]
  create-objects 1 [set proxyA true setxy -3 1] create-objects 1 [set proxyA true setxy -3 2]
  create-objects 1 [set proxyA true setxy -3 3] create-objects 1 [set proxyA true setxy -3 4]
  create-objects 1 [set proxyA true setxy -3 5]
end

to setupLevelFourteenWords
  create-objectWords 1 [set proxyAWord true setxy 3 3]
  create-objectWords 1 [set starWord true setxy -1 -1]
  create-objectWords 1 [set proxyAWord true setxy -11 -11]
  create-objectWords 1 [set flagWord true setxy -8 3]
  create-objectWords 1 [set babaWord true setxy -8 -3]
  create-adjectiveWords 1 [set haltWord true setxy 3 1]
  create-adjectiveWords 1 [set haltWord true setxy 1 -1]
  create-adjectiveWords 1 [set defeatWord true setxy -9 -11]
  create-adjectiveWords 1 [set winWord true setxy -6 3]
  create-adjectiveWords 1 [set youWord true setxy -6 -3]
  create-isWords 1 [setxy 3 2] create-isWords 1 [setxy 0 -1] create-isWords 1 [setxy -10 -11]
  create-isWords 1 [setxy -7 3] create-isWords 1 [setxy -7 -3]
end

to setupLevelFourteen
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelFourteen true
  set proxyAShape 1
  setupBorder
  setupLevelFourteenObjects
  setupLevelFourteenWords
end

to setupLevelFifteenObjects
  create-objects 1 [set skull true setxy -5 3] create-objects 1 [set skull true setxy -4 3]
  create-objects 1 [set skull true setxy -3 3] create-objects 1 [set baba true setxy -2 0]
  create-objects 1 [set flag true setxy 4 -1] create-objects 1 [set rock true setxy 3 2]
  create-objects 1 [set wall true setxy -7 0] create-objects 1 [set wall true setxy 2 4]
  create-objects 1 [set pillar true setxy -8 0] create-objects 1 [set pillar true setxy -8 1]
  create-objects 1 [set pillar true setxy -8 2] create-objects 1 [set pillar true setxy -8 3]
  create-objects 1 [set pillar true setxy -8 4] create-objects 1 [set pillar true setxy -8 5]
  create-objects 1 [set pillar true setxy -7 5] create-objects 1 [set pillar true setxy -6 5]
  create-objects 1 [set pillar true setxy -5 5] create-objects 1 [set pillar true setxy -4 5]
  create-objects 1 [set pillar true setxy -3 5] create-objects 1 [set pillar true setxy -2 5]
  create-objects 1 [set pillar true setxy -1 5] create-objects 1 [set pillar true setxy 0 5]
  create-objects 1 [set pillar true setxy 1 5] create-objects 1 [set pillar true setxy 2 5]
  create-objects 1 [set pillar true setxy 3 5] create-objects 1 [set pillar true setxy 4 5]
  create-objects 1 [set pillar true setxy 5 5] create-objects 1 [set pillar true setxy 6 5]
  create-objects 1 [set pillar true setxy 7 5] create-objects 1 [set pillar true setxy 8 5]
  create-objects 1 [set pillar true setxy 8 4] create-objects 1 [set pillar true setxy 8 3]
  create-objects 1 [set pillar true setxy 8 2] create-objects 1 [set pillar true setxy 8 1]
  create-objects 1 [set pillar true setxy 8 0] create-objects 1 [set pillar true setxy 8 -1]
  create-objects 1 [set pillar true setxy 8 -2] create-objects 1 [set pillar true setxy 8 -3]
  create-objects 1 [set pillar true setxy 7 -4] create-objects 1 [set pillar true setxy 6 -4]
  create-objects 1 [set pillar true setxy 5 -4] create-objects 1 [set pillar true setxy 4 -4]
  create-objects 1 [set pillar true setxy 3 -4] create-objects 1 [set pillar true setxy 2 -4]
  create-objects 1 [set pillar true setxy 1 -4] create-objects 1 [set pillar true setxy 0 -4]
  create-objects 1 [set pillar true setxy -1 -4] create-objects 1 [set pillar true setxy -2 -4]
  create-objects 1 [set pillar true setxy -3 -4] create-objects 1 [set pillar true setxy -4 -4]
  create-objects 1 [set pillar true setxy -5 -4] create-objects 1 [set pillar true setxy -6 -4]
  create-objects 1 [set pillar true setxy -7 -4] create-objects 1 [set pillar true setxy -8 -4]
  create-objects 1 [set pillar true setxy -8 -3] create-objects 1 [set pillar true setxy -8 -2]
  create-objects 1 [set pillar true setxy -8 -1] create-objects 1 [set proxyA true setxy 0 -3]
  create-objects 1 [set proxyA true setxy 0 -2] create-objects 1 [set proxyA true setxy 0 -1]
  create-objects 1 [set proxyA true setxy 0 0] create-objects 1 [set proxyA true setxy 0 1]
  create-objects 1 [set proxyA true setxy 0 2] create-objects 1 [set proxyA true setxy 0 3]
  create-objects 1 [set proxyA true setxy 0 4] create-objects 1 [set pillar true setxy 8 -4]
end

to setupLevelFifteenWords
  create-objectWords 1 [set babaWord true setxy -7 4]
  create-objectWords 1 [set flagWord true setxy -6 3]
  create-objectWords 1 [set proxyAWord true setxy -4 1]
  create-objectWords 1 [set wallWord true setxy -7 -3]
  create-objectWords 1 [set rockWord true setxy 3 4]
  create-objectWords 1 [set skullWord true setxy 7 3]
  create-objectWords 1 [set proxyAWord true setxy 5 -3]
  create-objectWords 1  [set pillarWord true setxy -1 11]
  create-adjectiveWords 1 [set youWord true setxy -5 4]
  create-adjectiveWords 1 [set winWord true setxy -7 1]
  create-adjectiveWords 1 [set haltWord true setxy -5 -3]
  create-adjectiveWords 1 [set sinkWord true setxy -4 -1]
  create-adjectiveWords 1 [set pushWord true setxy 5 4]
  create-adjectiveWords 1 [set meltWord true setxy 7 4]
  create-adjectiveWords 1 [set defeatWord true setxy 7 1]
  create-adjectiveWords 1 [set hotWord true setxy 7 -3]
  create-adjectiveWords 1 [set haltWord true setxy 1 11]
  create-isWords 1 [setxy -6 4] create-isWords 1 [setxy -7 2] create-isWords 1 [setxy -6 -3]
  create-isWords 1 [setxy -4 0] create-isWords 1 [setxy 4 4] create-isWords 1 [setxy 7 2]
  create-isWords 1 [setxy 6 -3] create-isWords 1 [setxy 0 11] create-andWords 1 [setxy 6 4]
end

to setupLevelFifteen
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelFifteen true
  set proxyAShape 2
  setupBorder
  setupLevelFifteenObjects
  setupLevelFifteenWords
end

to setupLevelSixteenObjects
  create-objects 1 [set wall true setxy -10 -10] create-objects 1 [set wall true setxy -9 -10]
  create-objects 1 [set wall true setxy -8 -10] create-objects 1 [set wall true setxy -7 -10]
  create-objects 1 [set wall true setxy -6 -10] create-objects 1 [set wall true setxy -5 -10]
  create-objects 1 [set wall true setxy -5 -9] create-objects 1 [set wall true setxy -5 -8]
  create-objects 1 [set wall true setxy -4 -8] create-objects 1 [set wall true setxy -3 -8]
  create-objects 1 [set wall true setxy -3 -7] create-objects 1 [set wall true setxy -3 -6]
  create-objects 1 [set wall true setxy -3 -5] create-objects 1 [set wall true setxy -3 -4]
  create-objects 1 [set wall true setxy -3 -3] create-objects 1 [set wall true setxy -3 -2]
  create-objects 1 [set wall true setxy -4 -2] create-objects 1 [set wall true setxy -5 -2]
  create-objects 1 [set wall true setxy -6 -2] create-objects 1 [set wall true setxy -7 -2]
  create-objects 1 [set wall true setxy -8 -2] create-objects 1 [set wall true setxy -8 -3]
  create-objects 1 [set wall true setxy -8 -4] create-objects 1 [set wall true setxy -9 -4]
  create-objects 1 [set wall true setxy -10 -4] create-objects 1 [set wall true setxy -10 -5]
  create-objects 1 [set wall true setxy -10 -6] create-objects 1 [set wall true setxy -10 -7]
  create-objects 1 [set wall true setxy -10 -8] create-objects 1 [set wall true setxy -10 -9]
  create-objects 1 [set wall true setxy -9 -6] create-objects 1 [set wall true setxy -8 -6]
  create-objects 1 [set wall true setxy -7 -6] create-objects 1 [set pillar true setxy -11 9]
  create-objects 1 [set pillar true setxy -10 9] create-objects 1 [ set pillar true setxy 3 10]
  create-objects 1 [set pillar true setxy -9 9] create-objects 1 [set pillar true setxy -8 9]
  create-objects 1 [set pillar true setxy -7 9] create-objects 1 [set pillar true setxy -6 9]
  create-objects 1 [set pillar true setxy -5 9] create-objects 1 [set pillar true setxy -4 9]
  create-objects 1 [set pillar true setxy -2 8] create-objects 1 [set pillar true setxy 8 9]
  create-objects 1 [set pillar true setxy -4 10] create-objects 1 [set pillar true setxy -4 11]
  create-objects 1 [set pillar true setxy -4 8] create-objects 1 [set pillar true setxy -4 7]
  create-objects 1 [set pillar true setxy -4 6] create-objects 1 [set pillar true setxy -4 5]
  create-objects 1 [set pillar true setxy -4 4] create-objects 1 [set pillar true setxy -4 3]
  create-objects 1 [set pillar true setxy -4 2] create-objects 1 [set pillar true setxy -4 1]
  create-objects 1 [set pillar true setxy -3 1] create-objects 1 [set pillar true setxy -2 1]
  create-objects 1 [set pillar true setxy -1 1] create-objects 1 [set pillar true setxy 1 1]
  create-objects 1 [set pillar true setxy 2 1] create-objects 1 [set pillar true setxy 2 -1]
  create-objects 1 [set pillar true setxy 2 -2] create-objects 1 [set pillar true setxy 2 -3]
  create-objects 1 [set pillar true setxy 2 -4] create-objects 1 [set pillar true setxy 2 -5]
  create-objects 1 [set pillar true setxy 2 -6] create-objects 1 [set pillar true setxy 2 -7]
  create-objects 1 [set pillar true setxy 3 -7] create-objects 1 [set pillar true setxy 4 -7]
  create-objects 1 [set pillar true setxy 5 -7] create-objects 1 [set pillar true setxy 6 -7]
  create-objects 1 [set pillar true setxy 7 -7] create-objects 1 [set pillar true setxy 8 -7]
  create-objects 1 [set pillar true setxy 9 -7] create-objects 1 [set pillar true setxy 10 -7]
  create-objects 1 [set pillar true setxy 11 -7] create-objects 1 [set wall true setxy -3 8]
  create-objects 1 [set pillar true setxy -1 8] create-objects 1 [set pillar true setxy 1 8]
  create-objects 1 [set pillar true setxy 2 8] create-objects 1 [set pillar true setxy 3 8]
  create-objects 1 [set pillar true setxy 3 7] create-objects 1 [set pillar true setxy 4 7]
  create-objects 1 [set pillar true setxy 5 7] create-objects 1 [set pillar true setxy 6 7]
  create-objects 1 [set pillar true setxy 7 8] create-objects 1 [set pillar true setxy 7 9]
  create-objects 1 [set pillar true setxy 9 10] create-objects 1 [set pillar true setxy 8 11]
  create-objects 1 [set pillar true setxy 7 11] create-objects 1 [set pillar true setxy 6 11]
  create-objects 1 [set pillar true setxy 5 11] create-objects 1 [set pillar true setxy 4 11]
  create-objects 1 [set pillar true setxy 3 11] create-objects 1 [set pillar true setxy 2 11]
  create-objects 1 [set pillar true setxy 1 11] create-objects 1 [set pillar true setxy -1 11]
  create-objects 1 [set pillar true setxy -2 11] create-objects 1 [set wall true setxy -3 11]
  create-objects 1 [set wall true setxy -3 10] create-objects 1 [set wall true setxy -3 9]
  create-objects 1 [set wall true setxy -3 7] create-objects 1 [set wall true setxy 11 -6]
  create-objects 1 [set wall true setxy -3 6] create-objects 1 [set wall true setxy -3 6]
  create-objects 1 [set wall true setxy -3 4] create-objects 1 [set wall true setxy -3 3]
  create-objects 1 [set wall true setxy -3 2] create-objects 1 [set wall true setxy -2 2]
  create-objects 1 [set wall true setxy -1 2] create-objects 1 [set wall true setxy 1 2]
  create-objects 1 [set wall true setxy 2 2] create-objects 1 [set wall true setxy 3 2]
  create-objects 1 [set wall true setxy 3 1] create-objects 1 [set wall true setxy 3 -1]
  create-objects 1 [set wall true setxy 3 -2] create-objects 1 [set wall true setxy 3 -3]
  create-objects 1 [set wall true setxy 3 -4] create-objects 1 [set wall true setxy 3 -5]
  create-objects 1 [set wall true setxy 3 -6] create-objects 1 [set wall true setxy 4 -6]
  create-objects 1 [set wall true setxy 5 -6] create-objects 1 [set wall true setxy 6 -6]
  create-objects 1 [set wall true setxy 7 -6] create-objects 1 [set wall true setxy 8 -6]
  create-objects 1 [set wall true setxy 9 -6] create-objects 1 [set wall true setxy 10 -6]
  create-objects 1 [set pillar true setxy 7 9] create-objects 1 [set wall true setxy 5 9]
  create-objects 1 [set skull true setxy 6 2] create-objects 1 [set skull true setxy 5 2]
  create-objects 1 [set skull true setxy 7 2] create-objects 1 [set skull true setxy 8 3]
  create-objects 1 [set skull true setxy 8 4] create-objects 1 [set skull true setxy 8 2]
  create-objects 1 [set crab true setxy -7 -8] create-objects 1 [set baba true setxy -2 10]
  create-objects 1 [set flag true setxy 8 -4] create-objects 1 [set star true setxy -2 -11]
  create-objects 1 [set water true setxy 3 3] create-objects 1 [set skull true setxy 4 2]
  create-objects 1 [set water true setxy 4 3] create-objects 1 [set water true setxy 5 3]
  create-objects 1 [set water true setxy 4 4] create-objects 1 [set water true setxy 5 4]
  create-objects 1 [set water true setxy 6 4] create-objects 1 [set water true setxy 5 5]
  create-objects 1 [set water true setxy 6 5 ] create-objects 1 [set water true setxy 6 6]
  create-objects 1 [set water true setxy 7 5] create-objects 1 [set water true setxy 7 6]
  create-objects 1 [set water true setxy 8 6] create-objects 1 [set water true setxy 8 7]
  create-objects 1 [set water true setxy 8 8] create-objects 1 [set water true setxy 9 7]
  create-objects 1 [set water true setxy 9 8] create-objects 1 [set water true setxy 9 9]
  create-objects 1 [set water true setxy 10 8] create-objects 1 [set water true setxy 10 9]
  create-objects 1 [set water true setxy 10 10] create-objects 1 [set water true setxy 11 9]
  create-objects 1 [set water true setxy 11 10] create-objects 1 [set water true setxy 11 11]
  create-objects 1 [set water true setxy 10 11] create-objects 1 [set lava true setxy 9 1]
  create-objects 1 [set lava true setxy 10 1] create-objects 1 [set lava true setxy 11 1]
  create-objects 1 [set lava true setxy 9 2] create-objects 1 [set lava true setxy 9 3]
  create-objects 1 [set lava true setxy 9 4] create-objects 1 [set lava true setxy 9 5]
  create-objects 1 [set lava true setxy 10 5] create-objects 1 [set lava true setxy 11 5]
  create-objects 1 [set wall true setxy 0 2] create-objects 1 [set pillar true setxy 0 1]
  create-objects 1 [set pillar true setxy 0 8] create-objects 1 [set pillar true setxy 0 11]
  create-objects 1 [set pillar true setxy 2 0] create-objects 1 [set wall true setxy 3 0]
  create-objects 1 [set wall true setxy -3 5]
end

to setupLevelSixteenWords
  create-objectWords 1 [set wallWord true setxy -9 -5]
  create-objectWords 1 [set crabWord true setxy -8 -7]
  create-objectWords 1 [set lavaWord true setxy -9 10]
  create-objectWords 1 [set pillarWord true setxy 6 10]
  create-objectWords 1 [set waterWord true setxy 0 -1]
  create-objectWords 1 [set flagWord true setxy 5 -3]
  create-objectWords 1 [set skullWord true setxy 10 4]
  create-objectWords 1 [set babaWord true setxy -10 7]
  create-objectWords 1 [set starWord true setxy -6 -4]
  create-adjectiveWords 1 [set haltWord true setxy -7 -5]
  create-adjectiveWords 1 [set sinkWord true setxy 0 -3]
  create-adjectiveWords 1 [set winWord true setxy 6 3]
  create-adjectiveWords 1 [set defeatWord true setxy 10 2]
  create-adjectiveWords 1 [set defeatWord true setxy 6 8]
  create-adjectiveWords 1 [set defeatWord true setxy -7 10]
  create-adjectiveWords 1 [set youWord true setxy -10 4]
  create-adjectiveWords 1 [set youWord true setxy -8 -9]
  create-isWords 1 [setxy -8 -8] create-isWords 1 [setxy -2 -10] create-isWords 1 [setxy 5 -4]
  create-isWords 1 [setxy -8 -5] create-isWords 1 [setxy 0 -2]  create-isWords 1 [setxy 10 3]
  create-isWords 1 [setxy 6 9]  create-isWords 1 [setxy -8 10]
end

to setupLevelSixteen
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelSixteen true
  setupBorder
  setupLevelSixteenObjects
  setupLevelSixteenWords
end

to setupLevelSeventeenObjects
  create-objects 1 [set baba true setxy -3 3] create-objects 1 [set rock true setxy 2 3]
  create-objects 1 [set flag true setxy 0 -2] create-objects 1 [set crab true setxy -2 -2]
  create-objects 1 [set wall true setxy 0 -4] create-objects 1 [set wall true setxy 9 4]
  create-objects 1 [set wall true setxy -1 -4] create-objects 1 [set wall true setxy -2 -4]
  create-objects 1 [set wall true setxy -3 -4] create-objects 1 [set wall true setxy -4 -4]
  create-objects 1 [set wall true setxy -5 -4] create-objects 1 [set wall true setxy -6 -4]
  create-objects 1 [set wall true setxy -7 -4] create-objects 1 [set wall true setxy -7 -3]
  create-objects 1 [set wall true setxy -7 -2] create-objects 1 [set wall true setxy -7 -1]
  create-objects 1 [set wall true setxy -7 0] create-objects 1 [set wall true setxy -7 1]
  create-objects 1 [set wall true setxy -7 2] create-objects 1 [set wall true setxy -7 3]
  create-objects 1 [set wall true setxy -7 4] create-objects 1 [set wall true setxy -7 5]
  create-objects 1 [set wall true setxy -6 5] create-objects 1 [set wall true setxy -5 5]
  create-objects 1 [set wall true setxy -4 5] create-objects 1 [set wall true setxy -3 5]
  create-objects 1 [set wall true setxy -2 5] create-objects 1 [set wall true setxy -1 5]
  create-objects 1 [set wall true setxy 0 5] create-objects 1 [set wall true setxy 1 5]
  create-objects 1 [set wall true setxy 2 5] create-objects 1 [set wall true setxy 2 4]
  create-objects 1 [set wall true setxy 3 4] create-objects 1 [set wall true setxy 4 4]
  create-objects 1 [set wall true setxy 5 4] create-objects 1 [set wall true setxy 6 4]
  create-objects 1 [set wall true setxy 7 4] create-objects 1 [set wall true setxy 8 4]
  create-objects 1 [set wall true setxy 9 3] create-objects 1 [set wall true setxy 9 2]
  create-objects 1 [set wall true setxy 9 1] create-objects 1 [set wall true setxy 9 0]
  create-objects 1 [set wall true setxy 9 -1] create-objects 1 [set wall true setxy 9 -2]
  create-objects 1 [set wall true setxy 9 -3] create-objects 1 [set wall true setxy 9 -4]
  create-objects 1 [set wall true setxy 8 -4] create-objects 1 [set wall true setxy 7 -4]
  create-objects 1 [set wall true setxy 6 -4] create-objects 1 [set wall true setxy 5 -4]
  create-objects 1 [set wall true setxy 4 -4] create-objects 1 [set wall true setxy 3 -4]
  create-objects 1 [set wall true setxy 2 -4] create-objects 1 [set wall true setxy -3 -3]
  create-objects 1 [set wall true setxy -2 -3] create-objects 1 [set wall true setxy -2 -1]
  create-objects 1 [set wall true setxy -2 0] create-objects 1 [set wall true setxy -1 0]
  create-objects 1 [set wall true setxy 0 0] create-objects 1 [set wall true setxy 1 0]
  create-objects 1 [set wall true setxy 2 0] create-objects 1 [set wall true setxy 2 1]
  create-objects 1 [set wall true setxy 2 2] create-objects 1 [set wall true setxy 2 -1]
  create-objects 1 [set wall true setxy 2 -2] create-objects 1 [set wall true setxy 2 -3]
  create-objects 1 [set wall true setxy 5 2] create-objects 1 [set wall true setxy 5 1]
  create-objects 1 [set wall true setxy 5 0] create-objects 1 [set wall true setxy 6 0]
  create-objects 1 [set wall true setxy 7 0] create-objects 1 [set wall true setxy 1 -4]
  create-objects 1 [set wall true setxy 8 0] create-objects 1 [set star true setxy 3 3]
end

to setupLevelSeventeenWords
  create-objectWords 1 [set babaWord true setxy -4 2]
  create-objectWords 1 [set wallWord true setxy -6 -3]
  create-objectWords 1 [set crabWord true setxy 5 3]
  create-objectWords 1 [set flagWord true setxy 6 3]
  create-objectWords 1 [set rockWord true setxy 4 -2]
  create-objectWords 1 [set starWord true setxy 8 3]
  create-adjectiveWords 1 [set youWord true setxy -2 2]
  create-adjectiveWords 1 [set haltWord true setxy -4 -3]
  create-adjectiveWords 1 [set pushWord true setxy 6 -2]
  create-adjectiveWords 1 [set defeatWord true setxy 6 1]
  create-adjectiveWords 1 [set winWord true setxy 7 1]
  create-adjectiveWords 1 [set pushWord true setxy 8 1]
  create-isWords 1 [setxy -3 2] create-isWords 1 [setxy -5 -3] create-isWords 1 [setxy 5 -2]
  create-isWords 1 [setxy 6 2] create-isWords 1 [setxy 7 2] create-isWords 1 [setxy 8 2]
end

to setupLevelSeventeen
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelSeventeen true
  setupBorder
  setupLevelSeventeenObjects
  setupLevelSeventeenWords
end

to setupLevelEighteenObjects
  create-objects 1 [set baba true setxy -4 0] create-objects 1 [set proxyB true setxy -2 0]
  create-objects 1 [set flag true setxy 5 6] create-objects 1 [set flag true setxy 5 7]
  create-objects 1 [set flag true setxy 5 8] create-objects 1 [set flag true setxy 6 7]
  create-objects 1 [set flag true setxy 7 7] create-objects 1 [set flag true setxy  8 7]
  create-objects 1 [set flag true setxy 9 7] create-objects 1 [set flag true setxy 9 8]
  create-objects 1 [set flag true setxy 9 6] create-objects 1 [set proxyA true setxy -7 0]
  create-objects 1 [set proxyA true setxy -7 1] create-objects 1 [set proxyA true setxy -7 2]
  create-objects 1 [set proxyA true setxy -7 3] create-objects 1 [set proxyA true setxy -6 3]
  create-objects 1 [set proxyA true setxy -5 3] create-objects 1 [set proxyA true setxy -4 3]
  create-objects 1 [set proxyA true setxy -3 3] create-objects 1 [set proxyA true setxy -2 3]
  create-objects 1 [set proxyA true setxy -1 3] create-objects 1 [set proxyA true setxy 0 3]
  create-objects 1 [set proxyA true setxy 1 3] create-objects 1 [set proxyA true setxy 2 3]
  create-objects 1 [set proxyA true setxy 3 3] create-objects 1 [set proxyA true setxy 4 3]
  create-objects 1 [set proxyA true setxy 5 3] create-objects 1 [set proxyA true setxy 6 3]
  create-objects 1 [set proxyA true setxy 7 3] create-objects 1 [set proxyA true setxy 7 2]
  create-objects 1 [set proxyA true setxy 7 1] create-objects 1 [set proxyA true setxy 7 0]
  create-objects 1 [set proxyA true setxy 7 -1] create-objects 1 [set proxyA true setxy 7 -2]
  create-objects 1 [set proxyA true setxy 7 -3] create-objects 1 [set proxyA true setxy 6 -3]
  create-objects 1 [set proxyA true setxy 5 -3] create-objects 1 [set proxyA true setxy 4 -3]
  create-objects 1 [set proxyA true setxy 3 -3] create-objects 1 [set proxyA true setxy 2 -3]
  create-objects 1 [set proxyA true setxy 1 -3] create-objects 1 [set proxyA true setxy 0 -3]
  create-objects 1 [set proxyA true setxy -1 -3] create-objects 1 [set proxyA true setxy -2 -3]
  create-objects 1 [set proxyA true setxy -3 -3] create-objects 1 [set proxyA true setxy -4 -3]
  create-objects 1 [set proxyA true setxy -5 -3] create-objects 1 [set proxyA true setxy -6 -3]
  create-objects 1 [set proxyA true setxy -7 -3] create-objects 1 [set proxyA true setxy -7 -2]
  create-objects 1 [set proxyA true setxy -7 -1]
end


to setupLevelEighteenWords
  create-objectWords 1 [set proxyAWord true setxy -11 -11]
  create-objectWords 1 [set flagWord true setxy -9 -11]
  create-objectWords 1 [set proxyBWord true setxy 2 -1]
  create-objectWords 1 [set proxyAWord true setxy 4 1]
  create-objectWords 1 [set babaWord true setxy 6 8]
  create-objectWords 1 [set proxyBWord true setxy 6 6]
  create-adjectiveWords 1 [set haltWord true setxy -7 -11]
  create-adjectiveWords 1 [set winWord true setxy 4 -1]
  create-adjectiveWords 1 [set youWord true setxy 8 8]
  create-adjectiveWords 1 [set pushWord true setxy 8 6]
  create-isWords 1 [setxy -8 -11] create-isWords 1 [setxy 3 -1] create-isWords 1 [setxy 4 0]
  create-isWords 1 [setxy 7 8] create-isWords 1 [setxy 7 6] create-andWords 1 [setxy -10 -11]
end

to setupLevelEighteen
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  set inLevel true
  set inLevelEighteen true
  set proxyAShape 1
  set proxyBShape 3
  setupBorder
  setupLevelEighteenObjects
  setupLevelEighteenWords
end


to enterLevel
  if inWorldOne [
    if mouse-down? and (round mouse-xcor) < -5 and (round mouse-xcor) > -9 and (round mouse-ycor) = 3
      and inLevel = false [setupLevelOne]
    if mouse-down? and (round mouse-xcor) < 2 and (round mouse-xcor) > -2 and (round mouse-ycor) = 3
      and inLevel = false and levelOneBeaten [setupLevelTwo]
    if mouse-down? and (round mouse-xcor) < 9 and (round mouse-xcor) > 5 and (round mouse-ycor) = 3
      and inLevel = false and levelTwoBeaten [setupLevelThree]
    if mouse-down? and (round mouse-xcor) < -5 and (round mouse-xcor) > -9 and (round mouse-ycor) = 0
      and inLevel = false and levelThreeBeaten [setupLevelFour]
    if mouse-down? and (round mouse-xcor) < 2 and (round mouse-xcor) > -2 and (round mouse-ycor) = 0
      and inLevel = false and levelFourBeaten [setupLevelFive]
    if mouse-down? and (round mouse-xcor) < 9 and (round mouse-xcor) > 5 and (round mouse-ycor) = 0
      and inLevel = false and levelFiveBeaten [setupLevelSix]
    if mouse-down? and (round mouse-xcor) < -5 and (round mouse-xcor) > -9 and (round mouse-ycor) = -3
      and inLevel = false and levelSixBeaten [setupLevelSeven]
    if mouse-down? and (round mouse-xcor) < 2 and (round mouse-xcor) > -2 and (round mouse-ycor) = -3
      and inLevel = false and levelSevenBeaten [setupLevelEight]
    if mouse-down? and (round mouse-xcor) < 9 and (round mouse-xcor) > 5 and (round mouse-ycor) = -3
      and inLevel = false and levelEightBeaten [setupLevelNine]
    if mouse-down? and (round mouse-xcor) < 2 and (round mouse-xcor) > -2 and (round mouse-ycor) = -5
      and inLevel = false and levelNineBeaten [set inWorldOne false set inWorldTwo true setup]
  ]
  if inWorldTwo [
    if mouse-down? and (round mouse-xcor) < -5 and (round mouse-xcor) > -9 and (round mouse-ycor) = 3
      and inLevel = false [setupLevelTen]
    if mouse-down? and (round mouse-xcor) < 2 and (round mouse-xcor) > -2 and (round mouse-ycor) = 3
      and inLevel = false and levelTenBeaten [setupLevelEleven]
    if mouse-down? and (round mouse-xcor) < 9 and (round mouse-xcor) > 5 and (round mouse-ycor) = 3
      and inLevel = false and levelElevenBeaten [setupLevelTwelve]
    if mouse-down? and (round mouse-xcor) < -5 and (round mouse-xcor) > -9 and (round mouse-ycor) = 0
      and inLevel = false and levelTwelveBeaten [setupLevelThirteen]
    if mouse-down? and (round mouse-xcor) < 2 and (round mouse-xcor) > -2 and (round mouse-ycor) = 0
      and inLevel = false and levelThirteenBeaten [setupLevelFourteen]
    if mouse-down? and (round mouse-xcor) < 9 and (round mouse-xcor) > 5 and (round mouse-ycor) = 0
      and inLevel = false and levelFourteenBeaten [setupLevelFifteen]
    if mouse-down? and (round mouse-xcor) < -5 and (round mouse-xcor) > -9 and (round mouse-ycor) = -3
      and inLevel = false and levelFifteenBeaten [setupLevelSixteen]
    if mouse-down? and (round mouse-xcor) < 2 and (round mouse-xcor) > -2 and (round mouse-ycor) = -3
      and inLevel = false and levelSixteenBeaten [setupLevelSeventeen]
    if mouse-down? and (round mouse-xcor) < 9 and (round mouse-xcor) > 5 and (round mouse-ycor) = -3
      and inLevel = false and levelSeventeenBeaten [setupLevelEighteen]
    if mouse-down? and (round mouse-xcor) < -1 and (round mouse-xcor) > -5 and (round mouse-ycor) = -5
      and inLevel = false [set inWorldTwo false set inWorldOne true setup]
    if mouse-down? and (round mouse-xcor) < 5 and (round mouse-xcor) > 1 and (round mouse-ycor) = -5
      and inLevel = false and levelEighteenBeaten [set inWorldTwo false credits]
  ]
  if inWorldCredits [
    if mouse-down? and (round mouse-xcor) < 3 and (round mouse-xcor) > -3 and (round mouse-ycor) = -10
      and inLevel = false [set inWorldCredits false set inWorldTwo true setup]
  ]

end

to refresh
  let x 0
  let y 0
  ask adjectiveWords [set push true set halt false set win false set you false]
  ask isWords [set push true set halt false]
  ask andWords [set push true set halt false]
  ask objectWords [
    set x xcor
    set y ycor
    set push true set halt false set change false
    set tempHot false set tempMelt false set tempSink false
    set tempDefeat false set tempHalt false set tempPush false
    set tempWin false set tempYou false set tempBaba false
    set tempWall false set tempFlag false set tempRock false
    set tempWater false set tempSkull false set tempPillar false
    set tempStar false set tempCrab false set tempLava false
    set tempProxyA false set tempProxyB false
    if count isWords with [pxcor = (x + 1) and pycor = y] = 1 [
      if count objectWords with [pxcor = (x + 2) and pycor = y] = 1
      or count adjectiveWords with [pxcor = (x + 2) and pycor = y] = 1 [
        if [babaWord] of objectWords-on patch (x + 2) y = [true] [set tempBaba true set change true]
        if [wallWord] of objectWords-on patch (x + 2) y = [true] [set tempWall true set change true]
        if [flagWord] of objectWords-on patch (x + 2) y = [true] [set tempFlag true set change true]
        if [rockWord] of objectWords-on patch (x + 2) y = [true] [set tempRock true set change true]
        if [waterWord] of objectWords-on patch (x + 2) y = [true] [set tempWater true set change true]
        if [skullWord] of objectWords-on patch (x + 2) y = [true] [set tempSkull true set change true]
        if [pillarWord] of objectWords-on patch (x + 2) y = [true] [set tempPillar true set change true]
        if [starWord] of objectWords-on patch (x + 2) y = [true] [set tempStar true set change true]
        if [crabWord] of objectWords-on patch (x + 2) y = [true] [set tempCrab true set change true]
        if [lavaWord] of objectWords-on patch (x + 2) y = [true] [set tempLava true set change true]
        if [proxyAWord] of objectWords-on patch (x + 2) y = [true] [set tempProxyA true set change true]
        if [proxyBWord] of objectWords-on patch (x + 2) y = [true] [set tempProxyB true set change true]
        if [hotWord] of adjectiveWords-on patch (x + 2) y = [true] [set tempHot true]
        if [meltWord] of adjectiveWords-on patch (x + 2) y = [true] [set tempMelt true]
        if [sinkWord] of adjectiveWords-on patch (x + 2) y = [true] [set tempSink true]
        if [defeatWord] of adjectiveWords-on patch (x + 2) y = [true] [set tempDefeat true]
        if [haltWord] of adjectiveWords-on patch (x + 2) y = [true] [set tempHalt true]
        if [pushWord] of adjectiveWords-on patch (x + 2) y = [true] [set tempPush true]
        if [winWord] of adjectiveWords-on patch (x + 2) y = [true] [set tempWin true]
        if [youWord] of adjectiveWords-on patch (x + 2) y = [true] [set tempYou true]
        if count andWords with [pxcor = (x + 3) and pycor = y] = 1 [
          if count adjectiveWords with [pxcor = (x + 4) and pycor = y] = 1
          or count objectWords with [pxcor = (x + 4) and pycor = y] = 1 [
            if [hotWord] of adjectiveWords-on patch (x + 4) y = [true] [set tempHot true]
            if [meltWord] of adjectiveWords-on patch (x + 4) y = [true] [set tempMelt true]
            if [sinkWord] of adjectiveWords-on patch (x + 4) y = [true] [set tempSink true]
            if [defeatWord] of adjectiveWords-on patch (x + 4) y = [true] [set tempDefeat true]
            if [haltWord] of adjectiveWords-on patch (x + 4) y = [true] [set tempHalt true]
            if [pushWord] of adjectiveWords-on patch (x + 4) y = [true] [set tempPush true]
            if [winWord] of adjectiveWords-on patch (x + 4) y = [true] [set tempWin true]
            if [youWord] of adjectiveWords-on patch (x + 4) y = [true] [set tempYou true]
            if [babaWord] of objectWords-on patch (x + 4) y = [true] [set tempBaba true set change true]
            if [wallWord] of objectWords-on patch (x + 4) y = [true] [set tempWall true set change true]
            if [flagWord] of objectWords-on patch (x + 4) y = [true] [set tempFlag true set change true]
            if [rockWord] of objectWords-on patch (x + 4) y = [true] [set tempRock true set change true]
            if [waterWord] of objectWords-on patch (x + 4) y = [true] [set tempWater true set change true]
            if [skullWord] of objectWords-on patch (x + 4) y = [true] [set tempSkull true set change true]
            if [pillarWord] of objectWords-on patch (x + 4) y = [true] [set tempPillar true set change true]
            if [starWord] of objectWords-on patch (x + 4) y = [true] [set tempStar true set change true]
            if [crabWord] of objectWords-on patch (x + 4) y = [true] [set tempCrab true set change true]
            if [lavaWord] of objectWords-on patch (x + 4) y = [true] [set tempLava true set change true]
            if [proxyAWord] of objectWords-on patch (x + 4) y = [true] [set tempProxyA true set change true]
            if [proxyBWord] of objectWords-on patch (x + 4) y = [true] [set tempProxyB true set change true]
          ]
        ]
      ]
    ]
    if count isWords with [pxcor = x and pycor = (y - 1)] = 1 [
      if count objectWords with [pxcor = x and pycor = (y - 2)] = 1
      or count adjectiveWords with [pxcor = x and pycor = (y - 2)] = 1 [
        if [babaWord] of objectWords-on patch x (y - 2) = [true] [set tempBaba true set change true]
        if [wallWord] of objectWords-on patch x (y - 2) = [true] [set tempWall true set change true]
        if [flagWord] of objectWords-on patch x (y - 2) = [true] [set tempFlag true set change true]
        if [rockWord] of objectWords-on patch x (y - 2) = [true] [set tempRock true set change true]
        if [waterWord] of objectWords-on patch x (y - 2) = [true] [set tempWater true set change true]
        if [skullWord] of objectWords-on patch x (y - 2) = [true] [set tempSkull true set change true]
        if [pillarWord] of objectWords-on patch x (y - 2) = [true] [set tempPillar true set change true]
        if [starWord] of objectWords-on patch x (y - 2) = [true] [set tempStar true set change true]
        if [crabWord] of objectWords-on patch x (y - 2) = [true] [set tempCrab true set change true]
        if [lavaWord] of objectWords-on patch x (y - 2) = [true] [set tempLava true set change true]
        if [proxyAWord] of objectWords-on patch x (y - 2) = [true] [set tempProxyA true set change true]
        if [proxyBWord] of objectWords-on patch x (y - 2) = [true] [set tempProxyB true set change true]
        if [hotWord] of adjectiveWords-on patch x (y - 2) = [true] [set tempHot true]
        if [meltWord] of adjectiveWords-on patch x (y - 2) = [true] [set tempMelt true]
        if [sinkWord] of adjectiveWords-on patch x (y - 2) = [true] [set tempSink true]
        if [defeatWord] of adjectiveWords-on patch x (y - 2) = [true] [set tempDefeat true]
        if [haltWord] of adjectiveWords-on patch x (y - 2) = [true] [set tempHalt true]
        if [pushWord] of adjectiveWords-on patch x (y - 2) = [true] [set tempPush true]
        if [winWord] of adjectiveWords-on patch x (y - 2) = [true] [set tempWin true]
        if [youWord] of adjectiveWords-on patch x (y - 2) = [true] [set tempYou true]
        if count andWords with [pxcor = x and pycor = (y - 3)] = 1 [
          if count adjectiveWords with [pxcor = x and pycor = (y - 4)] = 1
          or count objectWords with [pxcor = x and pycor = (y - 4)] = 1 [
            if [hotWord] of adjectiveWords-on patch x (y - 4) = [true] [set tempHot true]
            if [meltWord] of adjectiveWords-on patch x (y - 4) = [true] [set tempMelt true]
            if [sinkWord] of adjectiveWords-on patch x (y - 4) = [true] [set tempSink true]
            if [defeatWord] of adjectiveWords-on patch x (y - 4) = [true] [set tempDefeat true]
            if [haltWord] of adjectiveWords-on patch x (y - 4) = [true] [set tempHalt true]
            if [pushWord] of adjectiveWords-on patch x (y - 4) = [true] [set tempPush true]
            if [winWord] of adjectiveWords-on patch x (y - 4) = [true] [set tempWin true]
            if [youWord] of adjectiveWords-on patch x (y - 4) = [true] [set tempYou true]
            if [babaWord] of objectWords-on patch x (y - 4) = [true] [set tempBaba true set change true]
            if [wallWord] of objectWords-on patch x (y - 4) = [true] [set tempWall true set change true]
            if [flagWord] of objectWords-on patch x (y - 4) = [true] [set tempFlag true set change true]
            if [rockWord] of objectWords-on patch x (y - 4) = [true] [set tempRock true set change true]
            if [waterWord] of objectWords-on patch x (y - 4) = [true] [set tempWater true set change true]
            if [skullWord] of objectWords-on patch x (y - 4) = [true] [set tempSkull true set change true]
            if [pillarWord] of objectWords-on patch x (y - 4) = [true] [set tempPillar true set change true]
            if [starWord] of objectWords-on patch x (y - 4) = [true] [set tempStar true set change true]
            if [crabWord] of objectWords-on patch x (y - 4) = [true] [set tempCrab true set change true]
            if [lavaWord] of objectWords-on patch x (y - 4) = [true] [set tempLava true set change true]
            if [proxyAWord] of objectWords-on patch x (y - 4) = [true] [set tempProxyA true set change true]
            if [proxyBWord] of objectWords-on patch x (y - 4) = [true] [set tempProxyB true set change true]
          ]
        ]
      ]
    ]
    if count andWords with [pxcor = (x + 1) and pycor = y] = 1 [
      if count objectWords with [pxcor = (x + 2) and pycor = y] = 1 [
        if count isWords with [pxcor = (x + 3) and pycor = y] = 1 [
          if count adjectiveWords with [pxcor = (x + 4) and pycor = y] = 1
          or count objectWords with [pxcor = (x + 4) and pycor = y] = 1 [
            if [hotWord] of adjectiveWords-on patch (x + 4) y = [true] [set tempHot true]
            if [meltWord] of adjectiveWords-on patch (x + 4) y = [true] [set tempMelt true]
            if [sinkWord] of adjectiveWords-on patch (x + 4) y = [true] [set tempSink true]
            if [defeatWord] of adjectiveWords-on patch (x + 4) y = [true] [set tempDefeat true]
            if [haltWord] of adjectiveWords-on patch (x + 4) y = [true] [set tempHalt true]
            if [pushWord] of adjectiveWords-on patch (x + 4) y = [true] [set tempPush true]
            if [winWord] of adjectiveWords-on patch (x + 4) y = [true] [set tempWin true]
            if [youWord] of adjectiveWords-on patch (x + 4) y = [true] [set tempYou true]
            if [babaWord] of objectWords-on patch (x + 4) y = [true] [set tempBaba true set change true]
            if [wallWord] of objectWords-on patch (x + 4) y = [true] [set tempWall true set change true]
            if [flagWord] of objectWords-on patch (x + 4) y = [true] [set tempFlag true set change true]
            if [rockWord] of objectWords-on patch (x + 4) y = [true] [set tempRock true set change true]
            if [waterWord] of objectWords-on patch (x + 4) y = [true] [set tempWater true set change true]
            if [skullWord] of objectWords-on patch (x + 4) y = [true] [set tempSkull true set change true]
            if [pillarWord] of objectWords-on patch (x + 4) y = [true] [set tempPillar true set change true]
            if [starWord] of objectWords-on patch (x + 4) y = [true] [set tempStar true set change true]
            if [crabWord] of objectWords-on patch (x + 4) y = [true] [set tempCrab true set change true]
            if [lavaWord] of objectWords-on patch (x + 4) y = [true] [set tempLava true set change true]
            if [proxyAWord] of objectWords-on patch (x + 4) y = [true] [set tempProxyA true set change true]
            if [proxyBWord] of objectWords-on patch (x + 4) y = [true] [set tempProxyB true set change true]
          ]
        ]
      ]
    ]
    if count andWords with [pxcor = x and pycor = (y - 1)] = 1 [
      if count objectWords with [pxcor = x and pycor = (y - 2)] = 1 [
        if count isWords with [pxcor = x and pycor = (y - 3)] = 1 [
          if count adjectiveWords with [pxcor = x and pycor = (y - 4)] = 1
          or count objectWords with [pxcor = x and pycor = (y - 4)] = 1 [
            if [hotWord] of adjectiveWords-on patch x (y - 4) = [true] [set tempHot true]
            if [meltWord] of adjectiveWords-on patch x (y - 4) = [true] [set tempMelt true]
            if [sinkWord] of adjectiveWords-on patch x (y - 4) = [true] [set tempSink true]
            if [defeatWord] of adjectiveWords-on patch x (y - 4) = [true] [set tempDefeat true]
            if [haltWord] of adjectiveWords-on patch x (y - 4) = [true] [set tempHalt true]
            if [pushWord] of adjectiveWords-on patch x (y - 4) = [true] [set tempPush true]
            if [winWord] of adjectiveWords-on patch x (y - 4) = [true] [set tempWin true]
            if [youWord] of adjectiveWords-on patch x (y - 4) = [true] [set tempYou true]
            if [babaWord] of objectWords-on patch x (y - 4) = [true] [set tempBaba true set change true]
            if [wallWord] of objectWords-on patch x (y - 4) = [true] [set tempWall true set change true]
            if [flagWord] of objectWords-on patch x (y - 4) = [true] [set tempFlag true set change true]
            if [rockWord] of objectWords-on patch x (y - 4) = [true] [set tempRock true set change true]
            if [waterWord] of objectWords-on patch x (y - 4) = [true] [set tempWater true set change true]
            if [skullWord] of objectWords-on patch x (y - 4) = [true] [set tempSkull true set change true]
            if [pillarWord] of objectWords-on patch x (y - 4) = [true] [set tempPillar true set change true]
            if [starWord] of objectWords-on patch x (y - 4) = [true] [set tempStar true set change true]
            if [crabWord] of objectWords-on patch x (y - 4) = [true] [set tempCrab true set change true]
            if [lavaWord] of objectWords-on patch x (y - 4) = [true] [set tempLava true set change true]
            if [proxyAWord] of objectWords-on patch (x + 4) y = [true] [set tempProxyA true set change true]
            if [proxyBWord] of objectWords-on patch (x + 4) y = [true] [set tempProxyB true set change true]
          ]
        ]
      ]
    ]
  ]
  ask objects with [border = true] [
    set halt true set push false set win false set you false
  ]
  ask objects with [baba = true] [
    ifelse [tempHot] of objectWords with [babaWord = true] = [true] [set hot true] [set hot false]
    ifelse [tempMelt] of objectWords with [babaWord = true] = [true] [set melt true] [set melt false]
    ifelse [tempSink] of objectWords with [babaWord = true] = [true] [set sink true] [set sink false]
    ifelse [tempDefeat] of objectWords with [babaWord = true] = [true] [set defeat true] [set defeat false]
    ifelse [tempHalt] of objectWords with [babaWord = true] = [true] [set halt true] [set halt false]
    ifelse [tempPush] of objectWords with [babaWord = true] = [true] [set push true] [set push false]
    ifelse [tempWin] of objectWords with [babaWord = true] = [true] [set win true] [set win false]
    ifelse [tempYou] of objectWords with [babaWord = true] = [true] [set you true] [set you false]
    if [change] of objectWords with [babaWord = true] = [true] [
      if [tempWall] of objectWords with [babaWord = true] = [true] [ask patch-here [sprout-objects 1 [set wall true]]]
      if [tempFlag] of objectWords with [babaWord = true] = [true] [ask patch-here [sprout-objects 1 [set flag true]]]
      if [tempRock] of objectWords with [babaWord = true] = [true] [ask patch-here [sprout-objects 1 [set rock true]]]
      if [tempWater] of objectWords with [babaWord = true] = [true] [ask patch-here [sprout-objects 1 [set water true]]]
      if [tempSkull] of objectWords with [babaWord = true] = [true] [ask patch-here [sprout-objects 1 [set skull true]]]
      if [tempPillar] of objectWords with [babaWord = true] = [true] [ask patch-here [sprout-objects 1 [set pillar true]]]
      if [tempStar] of objectWords with [babaWord = true] = [true] [ask patch-here [sprout-objects 1 [set star true]]]
      if [tempCrab] of objectWords with [babaWord = true] = [true] [ask patch-here [sprout-objects 1 [set crab true]]]
      if [tempLava] of objectWords with [babaWord = true] = [true] [ask patch-here [sprout-objects 1 [set lava true]]]
      if [tempProxyA] of objectWords with [babaWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyA true]]]
      if [tempProxyB] of objectWords with [babaWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyB true]]]
      die
    ]
  ]
  ask objects with [wall = true] [
    ifelse [tempHot] of objectWords with [wallWord = true] = [true] [set hot true] [set hot false]
    ifelse [tempMelt] of objectWords with [wallWord = true] = [true] [set melt true] [set melt false]
    ifelse [tempSink] of objectWords with [wallWord = true] = [true] [set sink true] [set sink false]
    ifelse [tempDefeat] of objectWords with [wallWord = true] = [true] [set defeat true] [set defeat false]
    ifelse [tempHalt] of objectWords with [wallWord = true] = [true] [set halt true] [set halt false]
    ifelse [tempPush] of objectWords with [wallWord = true] = [true] [set push true] [set push false]
    ifelse [tempWin] of objectWords with [wallWord = true] = [true] [set win true] [set win false]
    ifelse [tempYou] of objectWords with [wallWord = true] = [true] [set you true] [set you false]
     if [change] of objectWords with [wallWord = true] = [true] [
      if [tempBaba] of objectWords with [wallWord = true] = [true] [ask patch-here [sprout-objects 1 [set baba true]]]
      if [tempFlag] of objectWords with [wallWord = true] = [true] [ask patch-here [sprout-objects 1 [set flag true]]]
      if [tempRock] of objectWords with [wallWord = true] = [true] [ask patch-here [sprout-objects 1 [set rock true]]]
      if [tempWater] of objectWords with [wallWord = true] = [true] [ask patch-here [sprout-objects 1 [set water true]]]
      if [tempSkull] of objectWords with [wallWord = true] = [true] [ask patch-here [sprout-objects 1 [set skull true]]]
      if [tempPillar] of objectWords with [wallWord = true] = [true] [ask patch-here [sprout-objects 1 [set pillar true]]]
      if [tempStar] of objectWords with [wallWord = true] = [true] [ask patch-here [sprout-objects 1 [set star true]]]
      if [tempCrab] of objectWords with [wallWord = true] = [true] [ask patch-here [sprout-objects 1 [set crab true]]]
      if [tempLava] of objectWords with [wallWord = true] = [true] [ask patch-here [sprout-objects 1 [set lava true]]]
      if [tempProxyA] of objectWords with [wallWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyA true]]]
      if [tempProxyB] of objectWords with [wallWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyB true]]]
      die
    ]
  ]
  ask objects with [flag = true] [
    ifelse [tempHot] of objectWords with [flagWord = true] = [true] [set hot true] [set hot false]
    ifelse [tempMelt] of objectWords with [flagWord = true] = [true] [set melt true] [set melt false]
    ifelse [tempSink] of objectWords with [flagWord = true] = [true] [set sink true] [set sink false]
    ifelse [tempDefeat] of objectWords with [flagWord = true] = [true] [set defeat true] [set defeat false]
    ifelse [tempHalt] of objectWords with [flagWord = true] = [true] [set halt true] [set halt false]
    ifelse [tempPush] of objectWords with [flagWord = true] = [true] [set push true] [set push false]
    ifelse [tempWin] of objectWords with [flagWord = true] = [true] [set win true] [set win false]
    ifelse [tempYou] of objectWords with [flagWord = true] = [true] [set you true] [set you false]
     if [change] of objectWords with [flagWord = true] = [true] [
      if [tempBaba] of objectWords with [flagWord = true] = [true] [ask patch-here [sprout-objects 1 [set baba true]]]
      if [tempWall] of objectWords with [flagWord = true] = [true] [ask patch-here [sprout-objects 1 [set wall true]]]
      if [tempRock] of objectWords with [flagWord = true] = [true] [ask patch-here [sprout-objects 1 [set rock true]]]
      if [tempWater] of objectWords with [flagWord = true] = [true] [ask patch-here [sprout-objects 1 [set water true]]]
      if [tempSkull] of objectWords with [flagWord = true] = [true] [ask patch-here [sprout-objects 1 [set skull true]]]
      if [tempPillar] of objectWords with [flagWord = true] = [true] [ask patch-here [sprout-objects 1 [set pillar true]]]
      if [tempStar] of objectWords with [flagWord = true] = [true] [ask patch-here [sprout-objects 1 [set star true]]]
      if [tempCrab] of objectWords with [flagWord = true] = [true] [ask patch-here [sprout-objects 1 [set crab true]]]
      if [tempLava] of objectWords with [flagWord = true] = [true] [ask patch-here [sprout-objects 1 [set lava true]]]
      if [tempProxyA] of objectWords with [flagWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyA true]]]
      if [tempProxyB] of objectWords with [flagWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyB true]]]
      die
    ]
  ]
  ask objects with [rock = true] [
    ifelse [tempHot] of objectWords with [rockWord = true] = [true] [set hot true] [set hot false]
    ifelse [tempMelt] of objectWords with [rockWord = true] = [true] [set melt true] [set melt false]
    ifelse [tempSink] of objectWords with [rockWord = true] = [true] [set sink true] [set sink false]
    ifelse [tempDefeat] of objectWords with [rockWord = true] = [true] [set defeat true] [set defeat false]
    ifelse [tempHalt] of objectWords with [rockWord = true] = [true] [set halt true] [set halt false]
    ifelse [tempPush] of objectWords with [rockWord = true] = [true] [set push true] [set push false]
    ifelse [tempWin] of objectWords with [rockWord = true] = [true] [set win true] [set win false]
    ifelse [tempYou] of objectWords with [rockWord = true] = [true] [set you true] [set you false]
    if [change] of objectWords with [rockWord = true] = [true] [
      if [tempBaba] of objectWords with [rockWord = true] = [true] [ask patch-here [sprout-objects 1 [set baba true]]]
      if [tempWall] of objectWords with [rockWord = true] = [true] [ask patch-here [sprout-objects 1 [set wall true]]]
      if [tempFlag] of objectWords with [rockWord = true] = [true] [ask patch-here [sprout-objects 1 [set flag true]]]
      if [tempWater] of objectWords with [rockWord = true] = [true] [ask patch-here [sprout-objects 1 [set water true]]]
      if [tempSkull] of objectWords with [rockWord = true] = [true] [ask patch-here [sprout-objects 1 [set skull true]]]
      if [tempPillar] of objectWords with [rockWord = true] = [true] [ask patch-here [sprout-objects 1 [set pillar true]]]
      if [tempStar] of objectWords with [rockWord = true] = [true] [ask patch-here [sprout-objects 1 [set star true]]]
      if [tempCrab] of objectWords with [rockWord = true] = [true] [ask patch-here [sprout-objects 1 [set crab true]]]
      if [tempLava] of objectWords with [rockWord = true] = [true] [ask patch-here [sprout-objects 1 [set lava true]]]
      if [tempProxyA] of objectWords with [rockWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyA true]]]
      if [tempProxyB] of objectWords with [rockWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyB true]]]
      die
    ]
  ]
  ask objects with [water = true] [
    ifelse [tempHot] of objectWords with [waterWord = true] = [true] [set hot true] [set hot false]
    ifelse [tempMelt] of objectWords with [waterWord = true] = [true] [set melt true] [set melt false]
    ifelse [tempSink] of objectWords with [waterWord = true] = [true] [set sink true] [set sink false]
    ifelse [tempDefeat] of objectWords with [waterWord = true] = [true] [set defeat true] [set defeat false]
    ifelse [tempHalt] of objectWords with [waterWord = true] = [true] [set halt true] [set halt false]
    ifelse [tempPush] of objectWords with [waterWord = true] = [true] [set push true] [set push false]
    ifelse [tempWin] of objectWords with [waterWord = true] = [true] [set win true] [set win false]
    ifelse [tempYou] of objectWords with [waterWord = true] = [true] [set you true] [set you false]
    if [change] of objectWords with [waterWord = true] = [true] [
      if [tempBaba] of objectWords with [waterWord = true] = [true] [ask patch-here [sprout-objects 1 [set baba true]]]
      if [tempWall] of objectWords with [waterWord = true] = [true] [ask patch-here [sprout-objects 1 [set wall true]]]
      if [tempFlag] of objectWords with [waterWord = true] = [true] [ask patch-here [sprout-objects 1 [set flag true]]]
      if [tempRock] of objectWords with [waterWord = true] = [true] [ask patch-here [sprout-objects 1 [set rock true]]]
      if [tempSkull] of objectWords with [waterWord = true] = [true] [ask patch-here [sprout-objects 1 [set skull true]]]
      if [tempPillar] of objectWords with [waterWord = true] = [true] [ask patch-here [sprout-objects 1 [set pillar true]]]
      if [tempStar] of objectWords with [waterWord = true] = [true] [ask patch-here [sprout-objects 1 [set star true]]]
      if [tempCrab] of objectWords with [waterWord = true] = [true] [ask patch-here [sprout-objects 1 [set crab true]]]
      if [tempLava] of objectWords with [waterWord = true] = [true] [ask patch-here [sprout-objects 1 [set lava true]]]
      if [tempProxyA] of objectWords with [waterWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyA true]]]
      if [tempProxyB] of objectWords with [waterWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyB true]]]
      die
    ]
  ]
   ask objects with [skull = true] [
    ifelse [tempHot] of objectWords with [skullWord = true] = [true] [set hot true] [set hot false]
    ifelse [tempMelt] of objectWords with [skullWord = true] = [true] [set melt true] [set melt false]
    ifelse [tempSink] of objectWords with [skullWord = true] = [true] [set sink true] [set sink false]
    ifelse [tempDefeat] of objectWords with [skullWord = true] = [true] [set defeat true] [set defeat false]
    ifelse [tempHalt] of objectWords with [skullWord = true] = [true] [set halt true] [set halt false]
    ifelse [tempPush] of objectWords with [skullWord = true] = [true] [set push true] [set push false]
    ifelse [tempWin] of objectWords with [skullWord = true] = [true] [set win true] [set win false]
    ifelse [tempYou] of objectWords with [skullWord = true] = [true] [set you true] [set you false]
    if [change] of objectWords with [skullWord = true] = [true] [
      if [tempBaba] of objectWords with [skullWord = true] = [true] [ask patch-here [sprout-objects 1 [set baba true]]]
      if [tempWall] of objectWords with [skullWord = true] = [true] [ask patch-here [sprout-objects 1 [set wall true]]]
      if [tempFlag] of objectWords with [skullWord = true] = [true] [ask patch-here [sprout-objects 1 [set flag true]]]
      if [tempRock] of objectWords with [skullWord = true] = [true] [ask patch-here [sprout-objects 1 [set rock true]]]
      if [tempWater] of objectWords with [skullWord = true] = [true] [ask patch-here [sprout-objects 1 [set water true]]]
      if [tempPillar] of objectWords with [skullWord = true] = [true] [ask patch-here [sprout-objects 1 [set pillar true]]]
      if [tempStar] of objectWords with [skullWord = true] = [true] [ask patch-here [sprout-objects 1 [set star true]]]
      if [tempCrab] of objectWords with [skullWord = true] = [true] [ask patch-here [sprout-objects 1 [set crab true]]]
      if [tempLava] of objectWords with [skullWord = true] = [true] [ask patch-here [sprout-objects 1 [set lava true]]]
      if [tempProxyA] of objectWords with [skullWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyA true]]]
      if [tempProxyB] of objectWords with [skullWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyB true]]]
      die
    ]
  ]
  ask objects with [pillar = true] [
    ifelse [tempHot] of objectWords with [pillarWord = true] = [true] [set hot true] [set hot false]
    ifelse [tempMelt] of objectWords with [pillarWord = true] = [true] [set melt true] [set melt false]
    ifelse [tempSink] of objectWords with [pillarWord = true] = [true] [set sink true] [set sink false]
    ifelse [tempDefeat] of objectWords with [pillarWord = true] = [true] [set defeat true] [set defeat false]
    ifelse [tempHalt] of objectWords with [pillarWord = true] = [true] [set halt true] [set halt false]
    ifelse [tempPush] of objectWords with [pillarWord = true] = [true] [set push true] [set push false]
    ifelse [tempWin] of objectWords with [pillarWord = true] = [true] [set win true] [set win false]
    ifelse [tempYou] of objectWords with [pillarWord = true] = [true] [set you true] [set you false]
    if [change] of objectWords with [pillarWord = true] = [true] [
      if [tempBaba] of objectWords with [pillarWord = true] = [true] [ask patch-here [sprout-objects 1 [set baba true]]]
      if [tempWall] of objectWords with [pillarWord = true] = [true] [ask patch-here [sprout-objects 1 [set wall true]]]
      if [tempFlag] of objectWords with [pillarWord = true] = [true] [ask patch-here [sprout-objects 1 [set flag true]]]
      if [tempRock] of objectWords with [pillarWord = true] = [true] [ask patch-here [sprout-objects 1 [set rock true]]]
      if [tempWater] of objectWords with [pillarWord = true] = [true] [ask patch-here [sprout-objects 1 [set water true]]]
      if [tempSkull] of objectWords with [pillarWord = true] = [true] [ask patch-here [sprout-objects 1 [set skull true]]]
      if [tempStar] of objectWords with [pillarWord = true] = [true] [ask patch-here [sprout-objects 1 [set star true]]]
      if [tempCrab] of objectWords with [pillarWord = true] = [true] [ask patch-here [sprout-objects 1 [set crab true]]]
      if [tempLava] of objectWords with [pillarWord = true] = [true] [ask patch-here [sprout-objects 1 [set lava true]]]
      if [tempProxyA] of objectWords with [pillarWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyA true]]]
      if [tempProxyB] of objectWords with [pillarWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyB true]]]
      die
    ]
  ]
  ask objects with [star = true] [
    ifelse [tempHot] of objectWords with [starWord = true] = [true] [set hot true] [set hot false]
    ifelse [tempMelt] of objectWords with [starWord = true] = [true] [set melt true] [set melt false]
    ifelse [tempSink] of objectWords with [starWord = true] = [true] [set sink true] [set sink false]
    ifelse [tempDefeat] of objectWords with [starWord = true] = [true] [set defeat true] [set defeat false]
    ifelse [tempHalt] of objectWords with [starWord = true] = [true] [set halt true] [set halt false]
    ifelse [tempPush] of objectWords with [starWord = true] = [true] [set push true] [set push false]
    ifelse [tempWin] of objectWords with [starWord = true] = [true] [set win true] [set win false]
    ifelse [tempYou] of objectWords with [starWord = true] = [true] [set you true] [set you false]
    if [change] of objectWords with [starWord = true] = [true] [
      if [tempBaba] of objectWords with [starWord = true] = [true] [ask patch-here [sprout-objects 1 [set baba true]]]
      if [tempWall] of objectWords with [starWord = true] = [true] [ask patch-here [sprout-objects 1 [set wall true]]]
      if [tempFlag] of objectWords with [starWord = true] = [true] [ask patch-here [sprout-objects 1 [set flag true]]]
      if [tempRock] of objectWords with [starWord = true] = [true] [ask patch-here [sprout-objects 1 [set rock true]]]
      if [tempWater] of objectWords with [starWord = true] = [true] [ask patch-here [sprout-objects 1 [set water true]]]
      if [tempSkull] of objectWords with [starWord = true] = [true] [ask patch-here [sprout-objects 1 [set skull true]]]
      if [tempPillar] of objectWords with [starWord = true] = [true] [ask patch-here [sprout-objects 1 [set pillar true]]]
      if [tempCrab] of objectWords with [starWord = true] = [true] [ask patch-here [sprout-objects 1 [set crab true]]]
      if [tempLava] of objectWords with [starWord = true] = [true] [ask patch-here [sprout-objects 1 [set lava true]]]
      if [tempProxyA] of objectWords with [starWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyA true]]]
      if [tempProxyB] of objectWords with [starWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyB true]]]
      die
    ]
  ]
  ask objects with [crab = true] [
    ifelse [tempHot] of objectWords with [crabWord = true] = [true] [set hot true] [set hot false]
    ifelse [tempMelt] of objectWords with [crabWord = true] = [true] [set melt true] [set melt false]
    ifelse [tempSink] of objectWords with [crabWord = true] = [true] [set sink true] [set sink false]
    ifelse [tempDefeat] of objectWords with [crabWord = true] = [true] [set defeat true] [set defeat false]
    ifelse [tempHalt] of objectWords with [crabWord = true] = [true] [set halt true] [set halt false]
    ifelse [tempPush] of objectWords with [crabWord = true] = [true] [set push true] [set push false]
    ifelse [tempWin] of objectWords with [crabWord = true] = [true] [set win true] [set win false]
    ifelse [tempYou] of objectWords with [crabWord = true] = [true] [set you true] [set you false]
    if [change] of objectWords with [crabWord = true] = [true] [
      if [tempBaba] of objectWords with [crabWord = true] = [true] [ask patch-here [sprout-objects 1 [set baba true]]]
      if [tempWall] of objectWords with [crabWord = true] = [true] [ask patch-here [sprout-objects 1 [set wall true]]]
      if [tempFlag] of objectWords with [crabWord = true] = [true] [ask patch-here [sprout-objects 1 [set flag true]]]
      if [tempRock] of objectWords with [crabWord = true] = [true] [ask patch-here [sprout-objects 1 [set rock true]]]
      if [tempWater] of objectWords with [crabWord = true] = [true] [ask patch-here [sprout-objects 1 [set water true]]]
      if [tempSkull] of objectWords with [crabWord = true] = [true] [ask patch-here [sprout-objects 1 [set skull true]]]
      if [tempPillar] of objectWords with [crabWord = true] = [true] [ask patch-here [sprout-objects 1 [set pillar true]]]
      if [tempStar] of objectWords with [crabWord = true] = [true] [ask patch-here [sprout-objects 1 [set star true]]]
      if [tempLava] of objectWords with [crabWord = true] = [true] [ask patch-here [sprout-objects 1 [set lava true]]]
      if [tempProxyA] of objectWords with [crabWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyA true]]]
      if [tempProxyB] of objectWords with [crabWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyB true]]]
      die
    ]
  ]
    ask objects with [lava = true] [
    ifelse [tempHot] of objectWords with [lavaWord = true] = [true] [set hot true] [set hot false]
    ifelse [tempMelt] of objectWords with [lavaWord = true] = [true] [set melt true] [set melt false]
    ifelse [tempSink] of objectWords with [lavaWord = true] = [true] [set sink true] [set sink false]
    ifelse [tempDefeat] of objectWords with [lavaWord = true] = [true] [set defeat true] [set defeat false]
    ifelse [tempHalt] of objectWords with [lavaWord = true] = [true] [set halt true] [set halt false]
    ifelse [tempPush] of objectWords with [lavaWord = true] = [true] [set push true] [set push false]
    ifelse [tempWin] of objectWords with [lavaWord = true] = [true] [set win true] [set win false]
    ifelse [tempYou] of objectWords with [lavaWord = true] = [true] [set you true] [set you false]
    if [change] of objectWords with [lavaWord = true] = [true] [
      if [tempBaba] of objectWords with [lavaWord = true] = [true] [ask patch-here [sprout-objects 1 [set baba true]]]
      if [tempWall] of objectWords with [lavaWord = true] = [true] [ask patch-here [sprout-objects 1 [set wall true]]]
      if [tempFlag] of objectWords with [lavaWord = true] = [true] [ask patch-here [sprout-objects 1 [set flag true]]]
      if [tempRock] of objectWords with [lavaWord = true] = [true] [ask patch-here [sprout-objects 1 [set rock true]]]
      if [tempWater] of objectWords with [lavaWord = true] = [true] [ask patch-here [sprout-objects 1 [set water true]]]
      if [tempSkull] of objectWords with [lavaWord = true] = [true] [ask patch-here [sprout-objects 1 [set skull true]]]
      if [tempPillar] of objectWords with [lavaWord = true] = [true] [ask patch-here [sprout-objects 1 [set pillar true]]]
      if [tempStar] of objectWords with [lavaWord = true] = [true] [ask patch-here [sprout-objects 1 [set star true]]]
      if [tempCrab] of objectWords with [lavaWord = true] = [true] [ask patch-here [sprout-objects 1 [set crab true]]]
      if [tempProxyA] of objectWords with [lavaWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyA true]]]
      if [tempProxyB] of objectWords with [lavaWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyB true]]]
      die
    ]
  ]
  ask objects with [proxyA = true] [
    ifelse count objectWords with [proxyAWord = true] = 2
      [ifelse [tempHot] of objectWords with [proxyAWord = true] != [false false] [set hot true] [set hot false]
      ifelse [tempMelt] of objectWords with [proxyAWord = true] != [false false] [set melt true] [set melt false]
      ifelse [tempSink] of objectWords with [proxyAWord = true] != [false false] [set sink true] [set sink false]
      ifelse [tempDefeat] of objectWords with [proxyAWord = true] != [false false] [set defeat true] [set defeat false]
      ifelse [tempHalt] of objectWords with [proxyAWord = true] != [false false] [set halt true] [set halt false]
      ifelse [tempPush] of objectWords with [proxyAWord = true] != [false false] [set push true] [set push false]
      ifelse [tempWin] of objectWords with [proxyAWord = true] != [false false] [set win true] [set win false]
      ifelse [tempYou] of objectWords with [proxyAWord = true] != [false false] [set you true] [set you false]
        if [change] of objectWords with [proxyAWord = true] != [false false] and [tempProxyA] of objectWords with [proxyAWord = true] = [false false] [
        if [tempBaba] of objectWords with [proxyAWord = true] != [false false] [ask patch-here [sprout-objects 1 [set baba true]]]
        if [tempWall] of objectWords with [proxyAWord = true] != [false false] [ask patch-here [sprout-objects 1 [set wall true]]]
        if [tempFlag] of objectWords with [proxyAWord = true] != [false false] [ask patch-here [sprout-objects 1 [set flag true]]]
        if [tempRock] of objectWords with [proxyAWord = true] != [false false] [ask patch-here [sprout-objects 1 [set rock true]]]
        if [tempWater] of objectWords with [proxyAWord = true] != [false false] [ask patch-here [sprout-objects 1 [set water true]]]
        if [tempSkull] of objectWords with [proxyAWord = true] != [false false] [ask patch-here [sprout-objects 1 [set skull true]]]
        if [tempPillar] of objectWords with [proxyAWord = true] != [false false] [ask patch-here [sprout-objects 1 [set pillar true]]]
        if [tempStar] of objectWords with [proxyAWord = true] != [false false] [ask patch-here [sprout-objects 1 [set star true]]]
        if [tempCrab] of objectWords with [proxyAWord = true] != [false false] [ask patch-here [sprout-objects 1 [set crab true]]]
        if [tempLava] of objectWords with [proxyAWord = true] != [false false] [ask patch-here [sprout-objects 1 [set lava true]]]
        if [tempProxyB] of objectWords with [proxyAWord = true] != [false false] [ask patch-here [sprout-objects 1 [set proxyB true]]]
      die
      ]
    ]
      [ifelse [tempHot] of objectWords with [proxyAWord = true] = [true] [set hot true] [set hot false]
      ifelse [tempMelt] of objectWords with [proxyAWord = true] = [true] [set melt true] [set melt false]
      ifelse [tempSink] of objectWords with [proxyAWord = true] = [true] [set sink true] [set sink false]
      ifelse [tempDefeat] of objectWords with [proxyAWord = true] = [true] [set defeat true] [set defeat false]
      ifelse [tempHalt] of objectWords with [proxyAWord = true] = [true] [set halt true] [set halt false]
      ifelse [tempPush] of objectWords with [proxyAWord = true] = [true] [set push true] [set push false]
      ifelse [tempWin] of objectWords with [proxyAWord = true] = [true] [set win true] [set win false]
      ifelse [tempYou] of objectWords with [proxyAWord = true] = [true] [set you true] [set you false]
      if [change] of objectWords with [proxyAWord = true] = [true] [
        if [tempBaba] of objectWords with [proxyAWord = true] = [true] [ask patch-here [sprout-objects 1 [set baba true]]]
        if [tempWall] of objectWords with [proxyAWord = true] = [true] [ask patch-here [sprout-objects 1 [set wall true]]]
        if [tempFlag] of objectWords with [proxyAWord = true] = [true] [ask patch-here [sprout-objects 1 [set flag true]]]
        if [tempRock] of objectWords with [proxyAWord = true] = [true] [ask patch-here [sprout-objects 1 [set rock true]]]
        if [tempWater] of objectWords with [proxyAWord = true] = [true] [ask patch-here [sprout-objects 1 [set water true]]]
        if [tempSkull] of objectWords with [proxyAWord = true] = [true] [ask patch-here [sprout-objects 1 [set skull true]]]
        if [tempPillar] of objectWords with [proxyAWord = true] = [true] [ask patch-here [sprout-objects 1 [set pillar true]]]
        if [tempStar] of objectWords with [proxyAWord = true] = [true] [ask patch-here [sprout-objects 1 [set star true]]]
        if [tempCrab] of objectWords with [proxyAWord = true] = [true] [ask patch-here [sprout-objects 1 [set crab true]]]
        if [tempLava] of objectWords with [proxyAWord = true] = [true] [ask patch-here [sprout-objects 1 [set lava true]]]
        if [tempProxyB] of objectWords with [proxyAWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyB true]]]
      die
      ]
    ]
  ]
  ask objects with [proxyB = true] [
    ifelse count objectWords with [proxyBWord = true] = 2
      [ifelse [tempHot] of objectWords with [proxyBWord = true] != [false false] [set hot true] [set hot false]
      ifelse [tempMelt] of objectWords with [proxyBWord = true] != [false false] [set melt true] [set melt false]
      ifelse [tempSink] of objectWords with [proxyBWord = true] != [false false] [set sink true] [set sink false]
      ifelse [tempDefeat] of objectWords with [proxyBWord = true] != [false false] [set defeat true] [set defeat false]
      ifelse [tempHalt] of objectWords with [proxyBWord = true] != [false false] [set halt true] [set halt false]
      ifelse [tempPush] of objectWords with [proxyBWord = true] != [false false] [set push true] [set push false]
      ifelse [tempWin] of objectWords with [proxyBWord = true] != [false false] [set win true] [set win false]
      ifelse [tempYou] of objectWords with [proxyBWord = true] != [false false] [set you true] [set you false]
        if [change] of objectWords with [proxyBWord = true] != [false false] and [tempProxyB] of objectWords with [proxyBWord = true] = [false false] [
        if [tempBaba] of objectWords with [proxyBWord = true] != [false false] [ask patch-here [sprout-objects 1 [set baba true]]]
        if [tempWall] of objectWords with [proxyBWord = true] != [false false] [ask patch-here [sprout-objects 1 [set wall true]]]
        if [tempFlag] of objectWords with [proxyBWord = true] != [false false] [ask patch-here [sprout-objects 1 [set flag true]]]
        if [tempRock] of objectWords with [proxyBWord = true] != [false false] [ask patch-here [sprout-objects 1 [set rock true]]]
        if [tempWater] of objectWords with [proxyBWord = true] != [false false] [ask patch-here [sprout-objects 1 [set water true]]]
        if [tempSkull] of objectWords with [proxyBWord = true] != [false false] [ask patch-here [sprout-objects 1 [set skull true]]]
        if [tempPillar] of objectWords with [proxyBWord = true] != [false false] [ask patch-here [sprout-objects 1 [set pillar true]]]
        if [tempStar] of objectWords with [proxyBWord = true] != [false false] [ask patch-here [sprout-objects 1 [set star true]]]
        if [tempCrab] of objectWords with [proxyBWord = true] != [false false] [ask patch-here [sprout-objects 1 [set crab true]]]
        if [tempLava] of objectWords with [proxyBWord = true] != [false false] [ask patch-here [sprout-objects 1 [set lava true]]]
        if [tempProxyA] of objectWords with [proxyBWord = true] != [false false] [ask patch-here [sprout-objects 1 [set proxyA true]]]
      die
      ]
    ]
      [ifelse [tempHot] of objectWords with [proxyBWord = true] = [true] [set hot true] [set hot false]
      ifelse [tempMelt] of objectWords with [proxyBWord = true] = [true] [set melt true] [set melt false]
      ifelse [tempSink] of objectWords with [proxyBWord = true] = [true] [set sink true] [set sink false]
      ifelse [tempDefeat] of objectWords with [proxyBWord = true] = [true] [set defeat true] [set defeat false]
      ifelse [tempHalt] of objectWords with [proxyBWord = true] = [true] [set halt true] [set halt false]
      ifelse [tempPush] of objectWords with [proxyBWord = true] = [true] [set push true] [set push false]
      ifelse [tempWin] of objectWords with [proxyBWord = true] = [true] [set win true] [set win false]
      ifelse [tempYou] of objectWords with [proxyBWord = true] = [true] [set you true] [set you false]
      if [change] of objectWords with [proxyBWord = true] = [true] [
        if [tempBaba] of objectWords with [proxyBWord = true] = [true] [ask patch-here [sprout-objects 1 [set baba true]]]
        if [tempWall] of objectWords with [proxyBWord = true] = [true] [ask patch-here [sprout-objects 1 [set wall true]]]
        if [tempFlag] of objectWords with [proxyBWord = true] = [true] [ask patch-here [sprout-objects 1 [set flag true]]]
        if [tempRock] of objectWords with [proxyBWord = true] = [true] [ask patch-here [sprout-objects 1 [set rock true]]]
        if [tempWater] of objectWords with [proxyBWord = true] = [true] [ask patch-here [sprout-objects 1 [set water true]]]
        if [tempSkull] of objectWords with [proxyBWord = true] = [true] [ask patch-here [sprout-objects 1 [set skull true]]]
        if [tempPillar] of objectWords with [proxyBWord = true] = [true] [ask patch-here [sprout-objects 1 [set pillar true]]]
        if [tempStar] of objectWords with [proxyBWord = true] = [true] [ask patch-here [sprout-objects 1 [set star true]]]
        if [tempCrab] of objectWords with [proxyBWord = true] = [true] [ask patch-here [sprout-objects 1 [set crab true]]]
        if [tempLava] of objectWords with [proxyBWord = true] = [true] [ask patch-here [sprout-objects 1 [set lava true]]]
        if [tempProxyA] of objectWords with [proxyBWord = true] = [true] [ask patch-here [sprout-objects 1 [set proxyA true]]]
      die
      ]
    ]
  ]
end

to death
  ask patches [
    if count objects-here with [baba = true] > 1 [
      ask one-of objects-here [if baba = true [die]]
    ]
    if count objects-here with [wall = true] > 1 [
      ask one-of objects-here [if wall = true [die]]
    ]
    if count objects-here with [flag = true] > 1 [
      ask one-of objects-here [if flag = true [die]]
    ]
    if count objects-here with [rock = true] > 1 [
      ask one-of objects-here [if rock = true [die]]
    ]
    if count objects-here with [water = true] > 1 [
      ask one-of objects-here [if water = true [die]]
    ]
    if count objects-here with [skull = true] > 1 [
      ask one-of objects-here [if skull = true [die]]
    ]
    if count objects-here with [pillar = true] > 1 [
      ask one-of objects-here [if pillar = true [die]]
    ]
    if count objects-here with [star = true] > 1 [
      ask one-of objects-here [if star = true [die]]
    ]
    if count objects-here with [crab = true] > 1 [
      ask one-of objects-here [if crab = true [die]]
    ]
    if count objects-here with [proxyA = true] > 1 [
      ask one-of objects-here [if proxyA = true [die]]
    ]
    if count objects-here with [proxyB = true] > 1 [
      ask one-of objects-here [if proxyB = true [die]]
    ]
  ]
  ask objects with [hot = true] [
    ask objects-here [
      if melt = true [die]
    ]
  ]
  ask objects with [sink = true] [
    if count other turtles-here > 0 [ask turtles-here [die]]
  ]
  ask objects with [defeat = true] [
    ask objects-here [if you = true [die]]
  ]
end

to updateObjects
  ask objects with [border = true] [set shape "border" set color 2]
  ask objects with [baba = true] [set shape "baba" set size 1.5]
  ask objects with [wall = true] [set shape "wall" set size 1.5]
  ask objects with [flag = true] [set shape "flag" set size 1.5]
  ask objects with [rock = true] [set shape "rock" set size 1.5]
  ask objects with [water = true] [set shape "water" set size 1.5]
  ask objects with [skull = true] [set shape "skull" set size 1.5]
  ask objects with [pillar = true] [set shape "pillar" set size 1.5]
  ask objects with [lava = true] [set shape "lava" set size 1.5]
  ask objects with [star = true] [set shape "star" set size 1.5]
  ask objects with [crab = true] [set shape "crab" set size 1.5]
end

to updateWords
  ask isWords [set shape "isWord" set size 1.5] ask andWords [set shape "andWord" set size 1.2]
  ask adjectiveWords with [hotWord = true] [set shape "hotWord" set size 1.5]
  ask adjectiveWords with [meltWord = true] [set shape "meltWord" set size 1.5]
  ask adjectiveWords with [sinkWord = true] [set shape "sinkWord" set size 1.5]
  ask adjectiveWords with [defeatWord = true] [set shape "defeatWord" set size 1.5]
  ask adjectiveWords with [pushWord = true] [set shape "pushWord" set size 1.5]
  ask adjectiveWords with [haltWord = true] [set shape "stopWord" set size 1.5]
  ask adjectiveWords with [youWord = true] [set shape "youWord" set size 1.5]
  ask adjectiveWords with [winWord = true] [set shape "winWord" set size 1.5]
  ask objectWords with [babaWord = true] [set shape "babaWord" set size 1.5]
  ask objectWords with [wallWord = true] [set shape "wallWord" set size 1.5]
  ask objectWords with [flagWord = true] [set shape "flagWord" set size 1.5]
  ask objectWords with [rockWord = true] [set shape "rockWord" set size 1.5]
  ask objectWords with [waterWord = true] [set shape "waterWord" set size 1.5]
  ask objectWords with [skullWord = true] [set shape "skullWord" set size 1.5]
  ask objectWords with [pillarWord = true] [set shape "pillarWord" set size 1.5]
  ask objectWords with [lavaWord = true] [set shape "lavaWord" set size 1.5]
  ask objectWords with [starWord = true] [set shape "starWord" set size 1.5]
  ask objectWords with [crabWord = true] [set shape "crabWord" set size 1.5]
end

to updateProxyShape
  if proxyAShape = 0 [
    ask objects with [proxyA = true] [set shape "baba" set size 1.5]
    ask objectWords with [proxyAWord = true] [set shape "babaWord" set size 1.5]
  ]
  if proxyAShape = 1 [
    ask objects with [proxyA = true] [set shape "wall" set size 1.5]
    ask objectWords with [proxyAWord = true] [set shape "wallWord" set size 1.5]
  ]
  if proxyAShape = 2 [
    ask objects with [proxyA = true] [set shape "lava" set size 1.5]
    ask objectWords with [proxyAWord = true] [set shape "lavaWord" set size 1.5]
  ]
  if proxyAShape = 3 [
    ask objects with [proxyA = true] [set shape "rock" set size 1.5]
    ask objectWords with [proxyAWord = true] [set shape "rockWord" set size 1.5]
  ]
   if proxyBShape = 0 [
    ask objects with [proxyB = true] [set shape "baba" set size 1.5]
    ask objectWords with [proxyBWord = true] [set shape "babaWord" set size 1.5]
  ]
  if proxyBShape = 1 [
    ask objects with [proxyB = true] [set shape "wall" set size 1.5]
    ask objectWords with [proxyBWord = true] [set shape "wallWord" set size 1.5]
  ]
  if proxyBShape = 2 [
    ask objects with [proxyB = true] [set shape "lava" set size 1.5]
    ask objectWords with [proxyBWord = true] [set shape "lavaWord" set size 1.5]
  ]
  if proxyBShape = 3 [
    ask objects with [proxyB = true] [set shape "rock" set size 1.5]
    ask objectWords with [proxyBWord = true] [set shape "rockWord" set size 1.5]
  ]
end

to win?
  if inLevelOne = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelOneBeaten true set tempBeaten true]]
    ]
  ]
  if inLevelTwo = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelTwoBeaten true set tempBeaten true]]
    ]
  ]
  if inLevelThree = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelThreeBeaten true set tempBeaten true]]
    ]
  ]
  if inLevelFour = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelFourBeaten true set tempBeaten true]]
    ]
  ]
  if inLevelFive = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelFiveBeaten true set tempBeaten true]]
    ]
  ]
  if inLevelSix = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelSixBeaten true set tempBeaten true]]
    ]
  ]
  if inLevelSeven = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelSevenBeaten true set tempBeaten true]]
    ]
  ]
  if inLevelEight = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelEightBeaten true set tempBeaten true]]
    ]
  ]
  if inLevelNine = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelNineBeaten true set tempBeaten true]]
    ]
  ]
  if inLevelTen = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelTenBeaten true set tempBeaten true]]
    ]
  ]
  if inLevelEleven = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelElevenBeaten true set tempBeaten true]]
    ]
  ]
  if inLevelTwelve = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelTwelveBeaten true set tempBeaten true]]
    ]
  ]
  if inLevelThirteen = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelThirteenBeaten true set tempBeaten true]]
    ]
  ]
  if inLevelFourteen = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelFourteenBeaten true set tempBeaten true]]
    ]
  ]
  if inLevelFifteen = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelFifteenBeaten true set tempBeaten true]]
    ]
  ]
  if inLevelSixteen = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelSixteenBeaten true set tempBeaten true]]
    ]
  ]
  if inLevelSeventeen = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelSeventeenBeaten true set tempBeaten true]]
    ]
  ]
  if inLevelEighteen = true [
    ask objects with [you = true] [
      ask objects-on patch-here [if win = true [set levelEighteenBeaten true set tempBeaten true]]
    ]
  ]
end

to winSetup
  if inLevel = true and tempBeaten = true [
    setup
  ]
end

to go
  enterLevel
  refresh
  death
  updateObjects
  updateWords
  updateProxyShape
  win?
  winSetup
end

to shift
  set direction heading
    ifelse count turtles-on patch-ahead 1 = 0
      [fd 1]
      [if [halt] of turtles-on patch-ahead 1 = [false] or [halt] of turtles-on patch-ahead 1 = [false false] or [halt] of turtles-on patch-ahead 1 = [false false false]
        [ifelse [push] of turtles-on patch-ahead 1 = [false] or [push] of turtles-on patch-ahead 1 = [false false] or [push] of turtles-on patch-ahead 1 = [false false false]
          [fd 1]
    [ifelse count turtles-on patch-ahead 2 = 0
      [ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
      [if [halt] of turtles-on patch-ahead 2 = [false] or [halt] of turtles-on patch-ahead 2 = [false false] or [halt] of turtles-on patch-ahead 2 = [false false false]
        [ifelse [push] of turtles-on patch-ahead 2 = [false] or [push] of turtles-on patch-ahead 2 = [false false] or [push] of turtles-on patch-ahead 2 = [false false false]
          [ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
    [ifelse count turtles-on patch-ahead 3 = 0
      [ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
      [if [halt] of turtles-on patch-ahead 3 = [false] or [halt] of turtles-on patch-ahead 3 = [false false] or [halt] of turtles-on patch-ahead 3 = [false false false]
        [ifelse [push] of turtles-on patch-ahead 3 = [false] or [push] of turtles-on patch-ahead 3 = [false false] or [push] of turtles-on patch-ahead 3 = [false false false]
          [ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
    [ifelse count turtles-on patch-ahead 4 = 0
      [ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
      [if [halt] of turtles-on patch-ahead 4 = [false] or [halt] of turtles-on patch-ahead 4 = [false false] or [halt] of turtles-on patch-ahead 4 = [false false false]
        [ifelse [push] of turtles-on patch-ahead 4 = [false] or [push] of turtles-on patch-ahead 4 = [false false] or [push] of turtles-on patch-ahead 4 = [false false false]
          [ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
    [ifelse count turtles-on patch-ahead 5 = 0
     [ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
     [if [halt] of turtles-on patch-ahead 5 = [false] or [halt] of turtles-on patch-ahead 5 = [false false] or [halt] of turtles-on patch-ahead 5 = [false false false]
       [ifelse [push] of turtles-on patch-ahead 5 = [false] or [push] of turtles-on patch-ahead 5 = [false false] or [push] of turtles-on patch-ahead 5 = [false false false]
         [ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
    [ifelse count turtles-on patch-ahead 6 = 0
     [ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
     [if [halt] of turtles-on patch-ahead 6 = [false] or [halt] of turtles-on patch-ahead 6 = [false false] or [halt] of turtles-on patch-ahead 6 = [false false false]
       [ifelse [push] of turtles-on patch-ahead 6 = [false] or [push] of turtles-on patch-ahead 6 = [false false] or [push] of turtles-on patch-ahead 6 = [false false false]
         [ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
    [ifelse count turtles-on patch-ahead 7 = 0
     [ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
     [if [halt] of turtles-on patch-ahead 7 = [false] or [halt] of turtles-on patch-ahead 6 = [false false] or [halt] of turtles-on patch-ahead 6 = [false false false]
       [ifelse [push] of turtles-on patch-ahead 7 = [false] or [push] of turtles-on patch-ahead 6 = [false false] or [push] of turtles-on patch-ahead 6 = [false false false]
         [ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
   [ifelse count turtles-on patch-ahead 8 = 0
     [ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
     [if [halt] of turtles-on patch-ahead 8 = [false] or [halt] of turtles-on patch-ahead 6 = [false false] or [halt] of turtles-on patch-ahead 6 = [false false false]
       [ifelse [push] of turtles-on patch-ahead 8 = [false] or [push] of turtles-on patch-ahead 6 = [false false] or [push] of turtles-on patch-ahead 6 = [false false false]
         [ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
    [ifelse count turtles-on patch-ahead 9 = 0
     [ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
     [if [halt] of turtles-on patch-ahead 9 = [false] or [halt] of turtles-on patch-ahead 6 = [false false] or [halt] of turtles-on patch-ahead 6 = [false false false]
       [ifelse [push] of turtles-on patch-ahead 9 = [false] or [push] of turtles-on patch-ahead 6 = [false false] or [push] of turtles-on patch-ahead 6 = [false false false]
         [ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
   [ifelse count turtles-on patch-ahead 10 = 0
     [ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
     [if [halt] of turtles-on patch-ahead 10 = [false] or [halt] of turtles-on patch-ahead 6 = [false false] or [halt] of turtles-on patch-ahead 6 = [false false false]
       [ifelse [push] of turtles-on patch-ahead 10 = [false] or [push] of turtles-on patch-ahead 6 = [false false] or [push] of turtles-on patch-ahead 6 = [false false false]
         [ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
   [ifelse count turtles-on patch-ahead 11 = 0
     [ask turtles-on patch-ahead 10 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
     [if [halt] of turtles-on patch-ahead 11 = [false] or [halt] of turtles-on patch-ahead 6 = [false false] or [halt] of turtles-on patch-ahead 6 = [false false false]
       [ifelse [push] of turtles-on patch-ahead 11 = [false] or [push] of turtles-on patch-ahead 6 = [false false] or [push] of turtles-on patch-ahead 6 = [false false false]
         [ask turtles-on patch-ahead 10 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
   [ifelse count turtles-on patch-ahead 12 = 0
     [ask turtles-on patch-ahead 11 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 10 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
     [if [halt] of turtles-on patch-ahead 12 = [false] or [halt] of turtles-on patch-ahead 6 = [false false] or [halt] of turtles-on patch-ahead 6 = [false false false]
       [ifelse [push] of turtles-on patch-ahead 12 = [false] or [push] of turtles-on patch-ahead 6 = [false false] or [push] of turtles-on patch-ahead 6 = [false false false]
         [ask turtles-on patch-ahead 11 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 10 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
   [ifelse count turtles-on patch-ahead 13 = 0
     [ask turtles-on patch-ahead 12 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 11 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 10 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
     [if [halt] of turtles-on patch-ahead 13 = [false] or [halt] of turtles-on patch-ahead 6 = [false false] or [halt] of turtles-on patch-ahead 6 = [false false false]
       [ifelse [push] of turtles-on patch-ahead 13 = [false] or [push] of turtles-on patch-ahead 6 = [false false] or [push] of turtles-on patch-ahead 6 = [false false false]
         [ask turtles-on patch-ahead 12 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 11 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 10 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
   [ifelse count turtles-on patch-ahead 14 = 0
     [ask turtles-on patch-ahead 13 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 12 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 11 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 10 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
     [if [halt] of turtles-on patch-ahead 14 = [false] or [halt] of turtles-on patch-ahead 6 = [false false] or [halt] of turtles-on patch-ahead 6 = [false false false]
       [ifelse [push] of turtles-on patch-ahead 14 = [false] or [push] of turtles-on patch-ahead 6 = [false false] or [push] of turtles-on patch-ahead 6 = [false false false]
         [ask turtles-on patch-ahead 13 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 12 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 11 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 10 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
   [ifelse count turtles-on patch-ahead 15 = 0
     [ask turtles-on patch-ahead 14 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 13 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 12 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 11 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 10 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
     [if [halt] of turtles-on patch-ahead 15 = [false] or [halt] of turtles-on patch-ahead 6 = [false false] or [halt] of turtles-on patch-ahead 6 = [false false false]
       [ifelse [push] of turtles-on patch-ahead 15 = [false] or [push] of turtles-on patch-ahead 6 = [false false] or [push] of turtles-on patch-ahead 6 = [false false false]
         [ask turtles-on patch-ahead 14 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 13 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 12 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 11 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 10 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
   [ifelse count turtles-on patch-ahead 16 = 0
     [ask turtles-on patch-ahead 15 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 14 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 13 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 12 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 11 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 10 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
     [if [halt] of turtles-on patch-ahead 16 = [false] or [halt] of turtles-on patch-ahead 6 = [false false] or [halt] of turtles-on patch-ahead 6 = [false false false]
       [ifelse [push] of turtles-on patch-ahead 16 = [false] or [push] of turtles-on patch-ahead 6 = [false false] or [push] of turtles-on patch-ahead 6 = [false false false]
         [ask turtles-on patch-ahead 15 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 14 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 13 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 12 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 11 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 10 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
    [ifelse count turtles-on patch-ahead 17 = 0
     [ask turtles-on patch-ahead 16 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 15 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 14 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 13 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 12 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 11 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 10 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
     [if [halt] of turtles-on patch-ahead 17 = [false] or [halt] of turtles-on patch-ahead 6 = [false false] or [halt] of turtles-on patch-ahead 6 = [false false false]
       [ifelse [push] of turtles-on patch-ahead 17 = [false] or [push] of turtles-on patch-ahead 6 = [false false] or [push] of turtles-on patch-ahead 6 = [false false false]
         [ask turtles-on patch-ahead 16 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 15 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 14 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 13 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 12 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 11 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 10 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
    [ifelse count turtles-on patch-ahead 18 = 0
     [ask turtles-on patch-ahead 17 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 16 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 15 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 14 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 13 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 12 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 11 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 10 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
     [if [halt] of turtles-on patch-ahead 18 = [false] or [halt] of turtles-on patch-ahead 6 = [false false] or [halt] of turtles-on patch-ahead 6 = [false false false]
       [if [push] of turtles-on patch-ahead 18 = [false] or [push] of turtles-on patch-ahead 6 = [false false] or [push] of turtles-on patch-ahead 6 = [false false false]
         [ask turtles-on patch-ahead 17 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 16 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 15 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 14 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 13 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 12 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 11 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 10 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 9 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 8 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 7 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 6 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 5 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 4 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 3 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 2 [if push = true [set heading [direction] of myself fd 1]] ask turtles-on patch-ahead 1 [if push = true [set heading [direction] of myself fd 1]] fd 1]
      ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
    ]
  ]
end

to goUp
  ask objects with [you = true] [
    set heading 0
    shift
  ]
  wait .05
  go
end

to goDown
  ask objects with [you = true] [
    set heading 180
    shift
  ]
  wait .05
  go
end

to goLeft
  ask objects with [you = true] [
    set heading 270
    shift
  ]
  wait .05
  go
end

to goRight
  ask objects with [you = true] [
    set heading 90
    shift
  ]
  wait .05
  go
end

to zoomAnimation
  ask n-of (random 8 + 4) patches with [pxcor = max-pxcor] [
    sprout 1 [
      set ycor ([ycor] of self + random-float 1 + random-float -1)
      set size .001 set pen-size 1 set color white pd set heading towards patch 0 0]
    ]
  ask n-of (random 8 + 4) patches with [pxcor = -1 * max-pxcor] [
    sprout 1 [
      set ycor ([ycor] of self + random-float 1 + random-float -1)
      set size .001 set pen-size 1 set color white pd set heading towards patch 0 0]
  ]
  ask n-of (random 8 + 4) patches with [pycor = max-pycor] [
      sprout 1 [
      set xcor ([xcor] of self + random-float 1 + random-float -1)
      set size .001 set pen-size 1 set color white pd set heading towards patch 0 0]
  ]
  ask n-of (random 8 + 4) patches with [pycor = -1 * max-pycor] [
    sprout 1 [
        set xcor ([xcor] of self + random-float 1 + random-float -1)
      set size .001 set pen-size 1 set color white pd set heading towards patch 0 0]
    ]
  ask turtles with [size = .001] [
    fd random-float 2.6 + 1.25
    pu rt 90
    fd random-float .5 + .2
    pd lt 90
    fd random-float 2.6 + 2.25
    die
  ]
  wait .06
  clear-drawing
end

to createAnimationStart
  cro 1 [set shape "baba" set size .2 setxy 0 2]
  cro 1 [set shape "babaWord" set size .2 setxy -2 3]
  cro 1 [set shape "isWord" set size .2 setxy 0 3]
  cro 1 [set shape "youWord" set size .2 setxy 2 3]
  cro 1 [set shape "gameWord" set size .2 setxy 0 1]
  cro 1 [set shape"isWord" set size .2 setxy 0 -1]
  cro 1 [set shape "playWord" set size .2 setxy 0 -2]
  wait 2
end

to growAnimation
  ask turtles with [size != .001] [set size ([size] of self + .025)]
  wait .06
end

to createAnimationTransition
  ask turtles with [shape = "baba"] [
    set heading 270 fd 1
    wait .5
    set heading 90 fd 1
    wait .5
    fd 1
    wait .5
    set heading 270 fd 1
    wait 1.5
    set heading 180
    ask turtles-on patch-ahead 1 [set heading 180 fd 1 ] fd 1
    ;cool sound effects here;
  ]
end

to createAnimationMiddle
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  ask patches with [pxcor < -5 and pxcor > -9 and pycor = 3] [set pcolor sky]
  ask patches with [pxcor < 2 and pxcor > -2 and pycor = 3] [set pcolor sky + 3]
  ask patches with [pxcor < 9 and pxcor > 5 and pycor = 3] [set pcolor sky + 3]
  ask patches with [pxcor < -5 and pxcor > -9 and pycor = 0] [set pcolor sky + 3]
  ask patches with [pxcor < 2 and pxcor > -2 and pycor = 0] [set pcolor sky + 3]
  ask patches with [pxcor < 9 and pxcor > 5 and pycor = 0] [set pcolor sky + 3]
  ask patches with [pxcor < -5 and pxcor > -9 and pycor = -3] [set pcolor sky + 3]
  ask patches with [pxcor < 2 and pxcor > -2 and pycor = -3] [set pcolor sky + 3]
  ask patches with [pxcor < 9 and pxcor > 5 and pycor = -3] [set pcolor sky + 3]
  crt 1 [set color sky setxy -6.8 3 set label-color black set label "level 1"]
  crt 1 [set color sky + 3 setxy .2 3 set label-color black set label "level 2"]
  crt 1 [set color sky + 3 setxy 7.2 3 set label-color black set label "level 3"]
  crt 1 [set color sky + 3 setxy -6.8 0 set label-color black set label "level 4"]
  crt 1 [set color sky + 3 setxy .2 0 set label-color black set label "level 5"]
  crt 1 [set color sky + 3 setxy 7.2 0 set label-color black set label "level 6"]
  crt 1 [set color sky + 3 setxy -6.8 -3 set label-color black set label "level 7"]
  crt 1 [set color sky + 3 setxy .2 -3 set label-color black set label "level 8"]
  crt 1 [set color sky + 3 setxy 7.2 -3 set label-color black set label "level 9"]
  crt 1 [setxy 1 7 set color black set label-color sky set label "BABA IS YOU"]
  crt 1 [setxy 5.8 -7 set color black set label-color sky set label
    "!you must play each level through to get to the next!"]
  crt 1 [setxy 11.4 -9 set color black set label-color sky set label
    "!If you get stuck on a level and need to reset you can click setup again. All progress will be retained!"]
  crt 1 [set size 3 set shape "cursor" set heading 65 setxy 10 -9]
end

to moveCursor
  ask turtles with [shape = "cursor"] [
    repeat 420 [
      set xcor [xcor] of self - .041
      set ycor [ycor] of self + .029
      wait .008
    ]
  ]
end

to setupCreditObjects
  crt 1 [set size 1.5 setxy 0 0 set shape "baba"]
  crt 1 [set size 1.5 setxy -9 7 set shape "wall"]
  crt 1 [set size 1.5 setxy 10 -10 set shape "flag"]
  crt 1 [set size 1.5 setxy 6 7 set shape "rock"]
  crt 1 [set size 1.5 setxy -8 -1 set shape "water"]
  crt 1 [set size 1.5 setxy -7 -8 set shape "skull"]
  crt 1 [set size 1.5 setxy -10 4 set shape "pillar"]
  crt 1 [set size 1.5 setxy 7 -4 set shape "lava"]
  crt 1 [set size 1.5 setxy -9 -3 set shape "crab"]
  crt 1 [set size 1.5 setxy 8 2 set shape "star"]
end

to setupCredits
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  cro 1 [setxy -4 10 set size 4 set shape "tShape"]
  cro 1 [setxy  -2 10 set size 4 set shape "hShape"]
  cro 1 [setxy 0 10 set size 4 set shape "aShape"]
  cro 1 [setxy 2 10 set size 4 set shape "nShape"]
  cro 1 [setxy 4 10 set size 4 set shape "kShape"]
  cro 1 [setxy -2 8 set size 4 set shape "yShape"]
  cro 1 [setxy 0 8 set size 4 set shape "oShape"]
  cro 1 [setxy 2 8 set size 4 set shape "uShape"]
  cro 1 [setxy -4.3 4 set size 1.5 set shape "creatorWord" ]
  cro 1 [setxy -4 2.5 set size 2 set shape "isWord"]
  cro 1 [setxy -3.7 1.5 set size 2 set shape "ayanWord"]
  cro 1 [setxy -2.3 -2 set size 1.5 set shape "creatorWord"]
  cro 1 [setxy -2 -3.5 set size 2 set shape "isWord"]
  cro 1 [setxy -1.7 -4.5 set size 1.7 set shape "tamzidWord"]
  cro 1 [setxy 1.7 4 set size 1.5 set shape "creatorWord"]
  cro 1 [setxy 2 2.5 set size 2 set shape "isWord"]
  cro 1 [setxy 2.3 1.5 set size 1.7 set shape "jordanWord"]
  cro 1 [setxy 3.7 -2 set size 1.5 set shape "creatorWord"]
  cro 1 [setxy 4 -3.5 set size 2 set shape "isWord"]
  cro 1 [setxy 4.3 -4.5 set size 1.7 set shape "tahsinWord"]
  crt 1 [set color lime setxy 1.2 -10 set label-color Sky set label "Previous World"]
  ask patches with [pxcor < 3 and pxcor > -3 and pycor = -10] [set pcolor lime]
  setupCreditObjects
  set inWorldCredits true
end

to credits
  clear-ticks clear-turtles clear-patches clear-drawing clear-all-plots clear-output
  createAnimationStart
  repeat 52 [
    growAnimation
    zoomAnimation
  ]
  wait .5
  createAnimationTransition
  wait .2
  createAnimationMiddle
  wait .5
  moveCursor
  wait .1
  setupCredits
end

;BABA IS YOU video link: https://www.youtube.com/watch?v=R_nYAcFElcQ
@#$#@#$#@
GRAPHICS-WINDOW
210
10
718
519
-1
-1
20.0
1
10
1
1
1
0
1
1
1
-12
12
-12
12
0
0
1
ticks
30.0

BUTTON
6
82
69
115
setup
initialize\nsetup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
128
364
183
397
Right
goRight
NIL
1
T
OBSERVER
NIL
D
NIL
NIL
1

BUTTON
74
332
129
365
Up
goUp
NIL
1
T
OBSERVER
NIL
W
NIL
NIL
1

BUTTON
74
364
129
397
Down
goDown
NIL
1
T
OBSERVER
NIL
S
NIL
NIL
1

BUTTON
20
364
77
397
Left
goLeft
NIL
1
T
OBSERVER
NIL
A
NIL
NIL
1

BUTTON
7
121
70
154
play
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

andword
false
5
Rectangle -7500403 true false 30 90 75 105
Rectangle -7500403 true false 30 90 45 150
Rectangle -7500403 true false 75 90 90 210
Rectangle -7500403 true false 15 150 30 210
Rectangle -7500403 true false 15 120 30 195
Rectangle -7500403 true false 15 165 75 180
Rectangle -7500403 true false 105 120 120 210
Rectangle -7500403 true false 120 90 135 165
Rectangle -7500403 true false 135 75 150 150
Rectangle -7500403 true false 150 105 165 180
Rectangle -7500403 true false 165 150 180 210
Rectangle -7500403 true false 180 105 195 195
Rectangle -7500403 true false 210 105 225 195
Rectangle -7500403 true false 210 195 270 210
Rectangle -7500403 true false 255 180 285 195
Rectangle -7500403 true false 270 120 285 180
Rectangle -7500403 true false 255 120 270 135
Rectangle -7500403 true false 210 105 270 120
Line -7500403 false 165 105 165 150
Line -7500403 false 150 90 150 150
Line -7500403 false 195 105 195 150
Line -7500403 false 195 135 195 180
Line -7500403 false 45 105 45 135
Line -7500403 false 255 210 240 210
Line -7500403 false 255 120 240 120
Rectangle -7500403 true false 60 90 90 105
Rectangle -7500403 true false 120 90 150 150
Rectangle -7500403 true false 165 150 195 195
Rectangle -7500403 true false 150 150 165 180
Rectangle -7500403 true false 60 165 90 180
Rectangle -7500403 true false 210 135 225 210
Rectangle -7500403 true false 225 195 270 210
Rectangle -7500403 true false 255 180 270 210
Rectangle -7500403 true false 255 180 285 195

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

ashape
false
0
Polygon -13791810 true false 105 60 195 60 255 210 210 210 165 90 135 90 105 210 60 210
Rectangle -13791810 true false 60 120 240 150

ayanword
false
0
Rectangle -13345367 true false 30 45 255 285
Rectangle -16777216 true false 30 45 45 75
Rectangle -16777216 true false 45 45 60 60
Rectangle -16777216 true false 240 45 255 75
Rectangle -16777216 true false 225 45 240 60
Rectangle -16777216 true false 30 255 45 285
Rectangle -16777216 true false 45 270 60 285
Rectangle -16777216 true false 225 270 240 285
Rectangle -16777216 true false 240 255 255 285
Rectangle -16777216 true false 45 105 60 150
Rectangle -16777216 true false 60 75 75 120
Rectangle -16777216 true false 75 60 90 90
Rectangle -16777216 true false 90 60 120 75
Rectangle -16777216 true false 105 75 120 150
Rectangle -16777216 true false 45 105 120 120
Rectangle -16777216 true false 135 60 150 105
Rectangle -16777216 true false 150 90 165 120
Rectangle -16777216 true false 165 105 180 150
Rectangle -16777216 true false 180 90 195 120
Rectangle -16777216 true false 195 60 210 105
Rectangle -16777216 true false 60 210 75 255
Rectangle -16777216 true false 75 180 90 225
Rectangle -16777216 true false 90 165 105 195
Rectangle -16777216 true false 105 165 135 180
Rectangle -16777216 true false 120 180 135 255
Rectangle -16777216 true false 75 210 135 225
Rectangle -16777216 true false 150 165 165 255
Rectangle -16777216 true false 210 165 225 255
Rectangle -16777216 true false 165 180 180 195
Rectangle -16777216 true false 180 195 195 210
Rectangle -16777216 true false 180 210 195 225
Rectangle -16777216 true false 195 225 210 240

baba
false
0
Rectangle -1 true false 45 210 75 255
Rectangle -1 true false 60 165 90 240
Rectangle -1 true false 60 165 120 195
Rectangle -1 true false 45 150 60 180
Rectangle -1 true false 30 90 60 150
Rectangle -1 true false 45 75 60 90
Rectangle -1 true false 60 60 75 75
Rectangle -1 true false 60 75 75 165
Rectangle -1 true false 75 60 105 165
Rectangle -1 true false 105 30 135 210
Rectangle -1 true false 120 45 135 210
Rectangle -1 true false 165 60 195 75
Rectangle -1 true false 150 60 180 75
Rectangle -1 true false 105 195 135 255
Rectangle -16777216 true false 180 105 210 135
Rectangle -16777216 true false 165 75 165 75
Rectangle -1 true false 150 75 195 195
Rectangle -16777216 true false 180 120 180 135
Rectangle -16777216 true false 150 120 180 150
Rectangle -1 true false 165 195 195 225
Rectangle -1 true false 180 210 210 255
Rectangle -1 true false 195 180 255 195
Rectangle -1 true false 180 15 195 60
Rectangle -1 true false 195 30 210 60
Rectangle -1 true false 195 60 210 180
Rectangle -16777216 true false 210 90 240 120
Rectangle -1 true false 210 60 240 75
Rectangle -1 true false 30 150 45 165
Rectangle -1 true false 210 75 240 90
Rectangle -1 true false 210 120 240 180
Rectangle -1 true false 210 75 240 90
Rectangle -1 true false 135 105 165 120
Rectangle -1 true false 240 75 255 180
Rectangle -1 true false 225 90 240 120
Rectangle -16777216 true false 225 90 240 120
Rectangle -1 true false 240 165 255 255
Rectangle -1 true false 255 90 270 165
Rectangle -1 true false 135 60 150 195
Rectangle -2064490 true false 135 45 150 45
Rectangle -1 true false 135 45 150 60
Rectangle -1 true false 60 60 150 195
Rectangle -1 true false 30 90 105 165
Rectangle -1 true false 105 30 135 195
Rectangle -1 true false 45 150 255 180
Rectangle -1 true false 105 60 240 90
Rectangle -1 true false 180 30 210 60
Rectangle -1 true false 180 60 210 195
Rectangle -1 true false 240 90 270 165
Rectangle -1 true false 165 165 195 225

babaword
false
8
Rectangle -5825686 true false 75 45 90 90
Rectangle -5825686 true false 60 75 75 120
Rectangle -5825686 true false 60 120 75 135
Rectangle -5825686 true false 90 45 120 60
Rectangle -5825686 true false 120 60 135 75
Rectangle -5825686 true false 120 75 135 90
Rectangle -5825686 true false 75 90 120 105
Rectangle -5825686 true false 75 120 75 120
Rectangle -5825686 true false 120 105 135 120
Rectangle -5825686 true false 135 120 150 135
Rectangle -5825686 true false 75 135 135 150
Rectangle -5825686 true false 165 120 180 150
Rectangle -5825686 true false 210 45 225 75
Rectangle -5825686 true false 180 90 195 135
Rectangle -5825686 true false 195 60 210 105
Rectangle -5825686 true false 225 60 240 105
Rectangle -5825686 true false 240 90 255 135
Rectangle -5825686 true false 255 120 270 150
Rectangle -5825686 true false 195 105 240 120
Rectangle -5825686 true false 60 75 75 120
Rectangle -5825686 true false 60 75 75 120
Rectangle -5825686 true false 75 165 120 180
Rectangle -5825686 true false 120 180 135 210
Rectangle -5825686 true false 75 165 90 225
Rectangle -5825686 true false 75 255 135 270
Rectangle -5825686 true false 135 240 150 255
Rectangle -5825686 true false 60 195 75 255
Rectangle -5825686 true false 120 225 135 240
Rectangle -5825686 true false 90 210 120 225
Rectangle -5825686 true false 165 240 180 270
Rectangle -5825686 true false 180 210 195 255
Rectangle -5825686 true false 195 180 210 225
Rectangle -5825686 true false 210 165 225 195
Rectangle -5825686 true false 225 180 240 225
Rectangle -5825686 true false 240 210 255 255
Rectangle -5825686 true false 255 240 270 270
Rectangle -5825686 true false 195 225 240 240

border
false
15
Rectangle -1 true true 45 45 300 300
Rectangle -1 true true 0 0 300 300

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

crab
false
0
Rectangle -2064490 true false 60 60 75 75
Rectangle -2064490 true false 75 60 90 90
Rectangle -2064490 true false 90 75 105 105
Rectangle -2064490 true false 105 90 120 120
Rectangle -2064490 true false 120 105 135 135
Rectangle -2064490 true false 90 135 135 150
Rectangle -2064490 true false 90 120 105 150
Rectangle -2064490 true false 75 105 90 135
Rectangle -2064490 true false 60 90 75 120
Rectangle -2064490 true false 45 75 60 105
Rectangle -2064490 true false 30 90 45 120
Rectangle -2064490 true false 60 135 90 150
Rectangle -2064490 true false 45 105 60 135
Rectangle -2064490 true false 45 120 75 135
Rectangle -2064490 true false 60 120 75 150
Rectangle -2064490 true false 135 135 150 150
Rectangle -2064490 true false 135 105 150 120
Line -2064490 false 150 105 150 150
Line -2064490 false 120 105 120 150
Line -16777216 false 120 105 120 150
Rectangle -2064490 true false 90 150 105 165
Rectangle -2064490 true false 105 150 120 180
Rectangle -2064490 true false 120 180 135 195
Rectangle -2064490 true false 105 195 135 210
Rectangle -2064490 true false 90 210 120 225
Rectangle -2064490 true false 75 225 105 240
Rectangle -2064490 true false 75 225 90 270
Rectangle -2064490 true false 135 210 150 240
Rectangle -2064490 true false 105 240 120 270
Rectangle -2064490 true false 105 240 135 255
Rectangle -2064490 true false 120 225 135 255
Rectangle -2064490 true false 120 210 150 225
Rectangle -2064490 true false 120 150 135 180
Rectangle -2064490 true false 150 225 195 240
Rectangle -2064490 true false 135 150 165 180
Rectangle -2064490 true false 135 180 150 210
Rectangle -2064490 true false 150 195 195 225
Rectangle -2064490 true false 180 180 195 195
Rectangle -2064490 true false 165 105 195 165
Rectangle -16777216 true false 180 120 195 135
Rectangle -2064490 true false 195 150 225 255
Rectangle -2064490 true false 195 255 210 270
Rectangle -2064490 true false 225 135 255 150
Rectangle -2064490 true false 240 150 255 210
Rectangle -2064490 true false 210 105 225 135
Rectangle -2064490 true false 210 120 240 135
Rectangle -2064490 true false 210 90 225 105
Rectangle -2064490 true false 195 45 210 90
Rectangle -2064490 true false 210 60 225 90
Rectangle -2064490 true false 225 75 240 120
Rectangle -2064490 true false 240 105 255 135
Rectangle -2064490 true false 255 135 270 195
Rectangle -2064490 true false 225 210 255 225
Rectangle -2064490 true false 225 150 240 210
Line -2064490 false 195 105 195 150
Rectangle -2064490 true false 240 225 255 270
Rectangle -2064490 true false 240 240 270 255
Rectangle -2064490 true false 255 210 270 255
Rectangle -2064490 true false 210 30 240 45
Rectangle -2064490 true false 225 45 255 60
Rectangle -2064490 true false 240 60 255 75
Rectangle -2064490 true false 255 60 270 105
Rectangle -2064490 true false 270 90 285 150
Rectangle -2064490 true false 255 120 270 135
Line -2064490 false 45 90 45 120
Line -2064490 false 45 90 60 90
Line -2064490 false 60 90 60 135
Line -2064490 false 75 105 75 150
Line -2064490 false 135 105 135 195
Line -2064490 false 105 90 105 105
Line -2064490 false 90 75 90 105
Line -2064490 false 75 60 75 75
Line -2064490 false 60 135 105 135
Line -2064490 false 30 105 75 105
Line -2064490 false 105 165 105 135
Line -2064490 false 195 240 195 150
Line -2064490 false 120 240 225 240
Line -2064490 false 120 225 225 225
Line -2064490 false 150 195 180 195
Line -2064490 false 165 150 165 180
Line -2064490 false 105 195 135 195
Line -2064490 false 120 180 120 210
Line -2064490 false 135 255 135 195
Line -2064490 false 225 135 225 225
Line -2064490 false 255 105 255 225
Line -2064490 false 225 135 270 135
Line -2064490 false 225 75 225 120
Line -2064490 false 210 105 240 105
Line -2064490 false 240 225 255 225
Line -2064490 false 255 225 255 240
Line -2064490 false 210 255 195 255
Line -2064490 false 210 45 240 45
Line -2064490 false 240 45 240 75
Line -2064490 false 255 60 255 105
Line -2064490 false 150 135 120 135
Line -16777216 false 120 105 120 150
Line -2064490 false 75 225 105 225
Rectangle -2064490 true false 150 180 180 195
Rectangle -2064490 true false 165 165 195 180
Line -2064490 false 105 165 255 165

crabword
false
0
Rectangle -2064490 true false 105 45 135 60
Rectangle -2064490 true false 60 30 120 45
Rectangle -2064490 true false 45 45 75 60
Rectangle -2064490 true false 30 60 60 75
Rectangle -2064490 true false 30 75 45 105
Rectangle -2064490 true false 30 105 60 120
Rectangle -2064490 true false 45 120 75 135
Rectangle -2064490 true false 60 135 120 150
Rectangle -2064490 true false 105 120 135 135
Rectangle -2064490 true false 150 30 165 150
Rectangle -2064490 true false 165 30 210 45
Rectangle -2064490 true false 195 45 225 60
Rectangle -2064490 true false 210 60 225 75
Rectangle -2064490 true false 195 75 225 90
Rectangle -2064490 true false 165 90 210 105
Rectangle -2064490 true false 195 105 225 120
Rectangle -2064490 true false 210 120 240 135
Rectangle -2064490 true false 240 135 225 150
Rectangle -2064490 true false 225 135 240 150
Rectangle -2064490 true false 45 210 60 285
Rectangle -2064490 true false 60 195 75 225
Rectangle -2064490 true false 75 165 90 210
Rectangle -2064490 true false 90 165 105 180
Rectangle -2064490 true false 105 165 135 180
Rectangle -2064490 true false 120 180 135 285
Rectangle -2064490 true false 45 225 120 240
Rectangle -2064490 true false 150 180 165 285
Rectangle -2064490 true false 165 270 225 285
Rectangle -2064490 true false 210 255 240 270
Rectangle -2064490 true false 225 240 240 255
Rectangle -2064490 true false 210 225 240 240
Rectangle -2064490 true false 165 210 225 225
Rectangle -2064490 true false 150 165 210 180
Rectangle -2064490 true false 210 180 225 195
Rectangle -2064490 true false 195 195 210 210

creatorword
false
0
Rectangle -2064490 true false 45 75 75 90
Rectangle -2064490 true false 15 60 60 75
Rectangle -2064490 true false 0 75 30 90
Rectangle -2064490 true false 0 90 15 135
Rectangle -2064490 true false 15 135 60 150
Rectangle -2064490 true false 45 120 75 135
Rectangle -2064490 true false 15 120 30 135
Rectangle -2064490 true false 90 60 105 150
Rectangle -2064490 true false 105 60 135 75
Rectangle -2064490 true false 105 105 135 120
Rectangle -2064490 true false 135 75 150 90
Rectangle -2064490 true false 135 90 150 105
Rectangle -2064490 true false 120 105 135 135
Rectangle -2064490 true false 135 120 150 150
Rectangle -2064490 true false 165 60 180 150
Rectangle -2064490 true false 180 60 210 75
Rectangle -2064490 true false 180 105 195 120
Rectangle -2064490 true false 180 135 210 150
Rectangle -2064490 true false 225 105 240 150
Rectangle -2064490 true false 240 75 255 120
Rectangle -2064490 true false 255 60 270 90
Rectangle -2064490 true false 270 60 285 75
Rectangle -2064490 true false 285 60 300 150
Rectangle -2064490 true false 240 105 300 120
Rectangle -2064490 true false 30 165 105 180
Rectangle -2064490 true false 60 180 75 255
Rectangle -2064490 true false 135 165 180 180
Rectangle -2064490 true false 120 180 135 240
Rectangle -2064490 true false 135 240 180 255
Rectangle -2064490 true false 180 180 195 240
Rectangle -2064490 true false 210 165 225 255
Rectangle -2064490 true false 225 165 255 180
Rectangle -2064490 true false 255 180 270 210
Rectangle -2064490 true false 225 210 240 225
Rectangle -2064490 true false 255 225 270 255
Rectangle -2064490 true false 240 210 255 240

cursor
true
0
Rectangle -1 true false 270 150 270 150
Rectangle -1 true false 255 135 255 165
Rectangle -1 true false 255 135 255 165
Rectangle -1 true false 255 135 255 165
Rectangle -1 true false 210 135 255 165
Polygon -1 true false 210 150 211 59 91 149 211 242 212 92 203 102 170 114 194 166 136 166 182 129 185 148 191 147 162 140
Rectangle -1 true false 137 131 176 170
Rectangle -1 true false 167 126 186 176
Rectangle -1 true false 166 104 202 178
Rectangle -1 true false 201 68 210 159
Rectangle -1 true false 178 99 206 136
Line -16777216 false 93 149 210 60
Line -16777216 false 92 150 213 243
Line -16777216 false 92 148 171 90
Line -16777216 false 210 62 211 134
Line -16777216 false 210 240 211 164
Line -16777216 false 212 164 262 164
Line -16777216 false 254 165 254 130
Line -16777216 false 258 136 212 133

cylinder
false
0
Circle -7500403 true true 0 0 300

defeatword
false
0
Rectangle -2674135 true false 30 45 285 270
Rectangle -16777216 true false 30 45 60 60
Rectangle -16777216 true false 30 45 45 75
Rectangle -16777216 true false 30 240 45 270
Rectangle -16777216 true false 45 255 60 270
Rectangle -16777216 true false 255 255 270 270
Rectangle -16777216 true false 270 240 285 270
Rectangle -16777216 true false 270 45 285 75
Rectangle -16777216 true false 255 45 270 60
Rectangle -16777216 true false 60 135 60 135
Rectangle -16777216 true false 60 75 75 150
Rectangle -16777216 true false 75 75 105 90
Rectangle -16777216 true false 90 90 120 105
Rectangle -16777216 true false 105 105 120 120
Rectangle -16777216 true false 90 120 120 135
Rectangle -16777216 true false 75 135 105 150
Rectangle -16777216 true false 135 75 195 90
Rectangle -16777216 true false 150 105 180 120
Rectangle -16777216 true false 150 135 195 150
Rectangle -16777216 true false 135 105 150 150
Rectangle -16777216 true false 135 90 150 120
Rectangle -16777216 true false 210 75 225 150
Rectangle -16777216 true false 210 75 255 90
Rectangle -16777216 true false 225 105 240 120
Rectangle -16777216 true false 60 165 75 240
Rectangle -16777216 true false 75 165 120 180
Rectangle -16777216 true false 60 195 105 210
Rectangle -16777216 true false 75 225 120 240
Rectangle -16777216 true false 135 195 150 240
Rectangle -16777216 true false 135 180 150 210
Rectangle -16777216 true false 150 165 165 195
Rectangle -16777216 true false 180 165 195 195
Rectangle -16777216 true false 180 180 195 240
Rectangle -16777216 true false 135 210 195 225
Rectangle -16777216 true false 165 165 180 180
Rectangle -16777216 true false 210 165 270 180
Rectangle -16777216 true false -330 30 -315 90
Rectangle -16777216 true false 225 165 240 240

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -1184463 true false 45 240 135 255
Rectangle -1184463 true false 60 225 135 255
Rectangle -1184463 true false 60 165 75 255
Rectangle -1184463 true false 60 165 90 180
Rectangle -1184463 true false 75 105 90 180
Rectangle -1184463 true false 75 105 105 120
Rectangle -1184463 true false 90 45 105 120
Rectangle -1184463 true false 105 45 105 60
Rectangle -1184463 true false 90 45 120 60
Rectangle -1184463 true false 105 30 120 60
Rectangle -1184463 true false 105 135 120 180
Rectangle -1184463 true false 105 135 240 150
Rectangle -1184463 true false 105 150 225 165
Rectangle -1184463 true false 180 165 195 180
Rectangle -1184463 true false 180 150 195 180
Rectangle -1184463 true false 135 60 225 150
Rectangle -1184463 true false 120 75 135 150
Rectangle -1184463 true false 120 75 180 135
Rectangle -1184463 true false 210 60 240 150
Rectangle -1184463 true false 135 45 165 75
Rectangle -1184463 true false 225 60 240 90
Rectangle -1184463 true false 225 60 255 75
Rectangle -1184463 true false 240 45 255 75
Rectangle -16777216 true false 195 60 225 75

flagword
false
0
Rectangle -1184463 true false 150 45 165 150
Rectangle -1184463 true false 150 135 225 150
Rectangle -1184463 true false 60 45 135 60
Rectangle -1184463 true false 60 45 75 150
Rectangle -1184463 true false 60 90 105 105
Rectangle -1184463 true false 120 165 135 270
Rectangle -1184463 true false 90 165 135 180
Rectangle -1184463 true false 90 165 90 210
Rectangle -1184463 true false 90 165 105 210
Rectangle -1184463 true false 75 195 105 210
Rectangle -1184463 true false 75 210 90 240
Rectangle -1184463 true false 60 225 135 240
Rectangle -1184463 true false 60 225 75 270
Rectangle -1184463 true false 150 180 165 255
Rectangle -1184463 true false 150 240 180 255
Rectangle -1184463 true false 165 240 180 270
Rectangle -1184463 true false 165 255 240 270
Rectangle -1184463 true false 225 225 240 270
Rectangle -1184463 true false 195 225 240 240
Rectangle -1184463 true false 150 180 180 195
Rectangle -1184463 true false 165 165 180 195
Rectangle -1184463 true false 165 165 225 180
Rectangle -1184463 true false 210 165 225 195
Rectangle -1184463 true false 210 180 240 195

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

gameword
false
0
Rectangle -13840069 true false 120 75 150 90
Rectangle -13840069 true false 75 60 135 75
Rectangle -13840069 true false 60 75 90 90
Rectangle -13840069 true false 45 90 75 105
Rectangle -13840069 true false 45 105 60 120
Rectangle -13840069 true false 45 120 75 135
Rectangle -13840069 true false 60 135 90 150
Rectangle -13840069 true false 75 150 135 165
Rectangle -13840069 true false 135 120 150 165
Rectangle -13840069 true false 105 120 135 135
Rectangle -13840069 true false 165 120 180 165
Rectangle -13840069 true false 180 90 195 135
Rectangle -13840069 true false 195 75 210 105
Rectangle -13840069 true false 195 60 255 75
Rectangle -13840069 true false 240 75 255 165
Rectangle -13840069 true false 195 120 255 135
Rectangle -13840069 true false 45 180 60 270
Rectangle -13840069 true false 135 180 150 270
Rectangle -13840069 true false 60 180 75 195
Rectangle -13840069 true false 75 195 90 210
Rectangle -13840069 true false 90 210 105 225
Rectangle -13840069 true false 105 195 120 210
Rectangle -13840069 true false 120 180 135 195
Rectangle -13840069 true false 165 180 180 270
Rectangle -13840069 true false 180 180 255 195
Rectangle -13840069 true false 180 210 225 225
Rectangle -13840069 true false 165 255 240 270

hotword
false
0
Rectangle -955883 true false 45 45 270 240
Rectangle -16777216 true false 45 45 75 60
Rectangle -16777216 true false 45 60 60 75
Rectangle -16777216 true false 45 210 60 240
Rectangle -16777216 true false 60 225 75 240
Rectangle -16777216 true false 240 45 270 60
Rectangle -16777216 true false 255 60 270 75
Rectangle -16777216 true false 240 225 270 240
Rectangle -16777216 true false 255 210 270 225
Rectangle -16777216 true false 60 90 75 195
Rectangle -16777216 true false 75 135 120 150
Rectangle -16777216 true false 105 90 120 195
Rectangle -16777216 true false 150 90 180 105
Rectangle -16777216 true false 135 105 150 180
Rectangle -16777216 true false 150 180 180 195
Rectangle -16777216 true false 180 105 195 180
Rectangle -16777216 true false 210 90 255 105
Rectangle -16777216 true false 225 105 240 195

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

hshape
false
0
Rectangle -13791810 true false 90 45 120 240
Rectangle -13791810 true false 195 45 195 90
Rectangle -13791810 true false 180 45 210 240
Rectangle -13791810 true false 60 135 240 165

isword
false
0
Rectangle -1 true false 75 60 105 75
Rectangle -1 true false 90 45 135 60
Rectangle -1 true false 105 60 120 105
Rectangle -1 true false 90 105 105 150
Rectangle -1 true false 90 90 105 105
Rectangle -1 true false 60 150 120 165
Rectangle -1 true false 45 165 75 180
Rectangle -1 true false 60 60 75 75
Rectangle -1 true false 75 165 90 180
Rectangle -1 true false 150 60 210 75
Rectangle -16777216 true false 135 120 150 75
Rectangle -1 true false 135 75 150 105
Rectangle -1 true false 150 75 180 90
Rectangle -1 true false 150 90 165 105
Rectangle -1 true false 150 105 180 120
Rectangle -1 true false 165 120 210 135
Rectangle -1 true false 180 150 195 165
Rectangle -1 true false 195 150 210 165
Rectangle -1 true false 195 150 210 165
Rectangle -1 true false 150 165 210 180
Rectangle -1 true false 135 150 165 165
Rectangle -1 true false 195 120 210 150
Rectangle -1 true false 210 135 225 165
Rectangle -1 true false 180 165 195 180
Rectangle -1 true false 90 45 120 75
Rectangle -1 true false 150 60 180 90
Rectangle -1 true false 135 75 165 105
Rectangle -1 true false 150 75 165 120
Rectangle -1 true false 105 45 105 120
Rectangle -1 true false 105 45 120 105
Rectangle -1 true false 90 90 105 165
Rectangle -1 true false 60 150 90 180
Rectangle -1 true false 60 150 75 180
Rectangle -1 true false 60 60 105 75
Rectangle -1 true false 90 45 135 60
Rectangle -1 true false 150 150 165 180
Rectangle -1 true false 180 150 210 180

jordanword
false
0
Rectangle -8630108 true false 15 15 285 300
Rectangle -16777216 true false 60 45 105 60
Rectangle -16777216 true false 75 60 90 120
Rectangle -16777216 true false 60 120 75 135
Rectangle -16777216 true false 45 120 60 135
Rectangle -16777216 true false 30 105 45 120
Rectangle -16777216 true false 135 45 165 60
Rectangle -16777216 true false 120 60 135 120
Rectangle -16777216 true false 135 120 165 135
Rectangle -16777216 true false 165 60 180 120
Rectangle -16777216 true false 195 45 210 135
Rectangle -16777216 true false 210 45 240 60
Rectangle -16777216 true false 240 60 255 90
Rectangle -16777216 true false 210 90 240 105
Rectangle -16777216 true false 225 105 240 120
Rectangle -16777216 true false 240 105 255 135
Rectangle -16777216 true false 30 165 45 255
Rectangle -16777216 true false 45 165 75 180
Rectangle -16777216 true false 60 180 90 195
Rectangle -16777216 true false 75 195 90 225
Rectangle -16777216 true false 60 225 90 240
Rectangle -16777216 true false 45 240 75 255
Rectangle -16777216 true false 105 210 120 255
Rectangle -16777216 true false 120 180 135 225
Rectangle -16777216 true false 135 165 150 195
Rectangle -16777216 true false 150 165 180 180
Rectangle -16777216 true false 165 180 180 255
Rectangle -16777216 true false 120 210 180 225
Rectangle -16777216 true false 195 165 210 255
Rectangle -16777216 true false 210 180 225 195
Rectangle -16777216 true false 225 195 240 210
Rectangle -16777216 true false 225 210 240 225
Rectangle -16777216 true false 240 225 255 240
Rectangle -16777216 true false 255 165 270 255
Rectangle -16777216 true false 255 285 285 300
Rectangle -16777216 true false 15 285 45 300
Rectangle -16777216 true false 15 15 45 30
Rectangle -16777216 true false 255 15 285 30
Rectangle -16777216 true false 15 270 30 285
Rectangle -16777216 true false 270 270 285 285
Rectangle -16777216 true false 45 285 255 300
Rectangle -16777216 true false 15 30 30 45
Rectangle -16777216 true false 270 30 285 45

kshape
false
0
Rectangle -13791810 true false 90 60 120 225
Polygon -13791810 true false 120 120 120 120 195 60 225 60 120 150
Polygon -13791810 true false 120 150 225 240 195 240 120 180
Rectangle -13791810 true false 90 225 120 240

lava
false
0
Rectangle -955883 true false 60 60 60 60
Rectangle -955883 true false 75 75 90 75
Rectangle -955883 true false 45 60 60 60
Rectangle -955883 true false 45 45 255 255
Circle -955883 true false 26 41 67
Circle -955883 true false 90 30 90
Circle -955883 true false 161 41 67
Circle -955883 true false 133 43 124
Circle -955883 true false 150 165 60
Circle -955883 true false 90 90 180
Circle -955883 true false 26 131 67
Circle -955883 true false 36 156 108
Circle -955883 true false 156 36 108

lavaword
false
0
Rectangle -955883 true false 60 45 75 150
Rectangle -955883 true false 75 135 135 150
Rectangle -955883 true false 165 105 180 150
Rectangle -955883 true false 180 75 195 120
Rectangle -955883 true false 195 45 210 90
Rectangle -955883 true false 210 45 255 60
Rectangle -955883 true false 240 60 255 150
Rectangle -955883 true false 195 105 255 120
Rectangle -955883 true false 45 165 60 225
Rectangle -955883 true false 60 210 75 255
Rectangle -955883 true false 75 240 90 270
Rectangle -955883 true false 90 255 105 270
Rectangle -955883 true false 105 240 120 270
Rectangle -955883 true false 120 210 135 255
Rectangle -955883 true false 135 165 150 225
Rectangle -955883 true false 165 225 180 270
Rectangle -955883 true false 180 195 195 240
Rectangle -955883 true false 195 225 255 240
Rectangle -955883 true false 240 180 255 270
Rectangle -955883 true false 195 165 210 210
Rectangle -955883 true false 210 165 255 180

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

meltword
false
0
Rectangle -13791810 true false 30 45 240 270
Rectangle -16777216 true false 30 45 60 60
Rectangle -16777216 true false 30 60 45 75
Rectangle -16777216 true false 30 240 45 255
Rectangle -16777216 true false 30 255 60 270
Rectangle -16777216 true false 225 45 240 75
Rectangle -16777216 true false 210 45 225 60
Rectangle -16777216 true false 210 255 240 270
Rectangle -16777216 true false 225 240 240 255
Rectangle -16777216 true false 60 75 75 150
Rectangle -16777216 true false 60 75 75 90
Rectangle -16777216 true false 90 90 105 120
Rectangle -16777216 true false 75 90 90 105
Rectangle -16777216 true false 120 75 135 150
Rectangle -16777216 true false 105 90 120 105
Rectangle -16777216 true false 120 75 135 90
Rectangle -16777216 true false 150 75 165 150
Rectangle -16777216 true false 165 75 210 90
Rectangle -16777216 true false 165 105 195 120
Rectangle -16777216 true false 165 135 210 150
Rectangle -16777216 true false 60 165 75 240
Rectangle -16777216 true false 75 225 135 240
Rectangle -16777216 true false 135 165 210 180
Rectangle -16777216 true false 165 165 180 240

nshape
true
0
Rectangle -13791810 true false 75 60 105 240
Polygon -13791810 true false 105 60 225 240 195 240 105 105 105 60 135 105 165 150
Rectangle -13791810 true false 195 60 225 240

oshape
false
0
Circle -13791810 true false 60 60 180
Circle -16777216 true false 90 90 120

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

pillar
false
0
Rectangle -13791810 true false 60 45 225 60
Rectangle -13791810 true false 45 60 90 75
Rectangle -13791810 true false 195 60 240 75
Rectangle -13791810 true false 75 75 210 90
Circle -13791810 false false 75 60 0
Circle -13791810 true false 30 45 60
Circle -13791810 true false 195 45 60
Rectangle -13791810 true false 75 90 90 225
Rectangle -13791810 true false 105 105 120 225
Rectangle -13791810 true false 135 120 150 225
Rectangle -13791810 true false 165 105 180 225
Rectangle -13791810 true false 195 90 210 225
Rectangle -13791810 true false 75 225 210 240
Circle -13791810 true false 30 210 60
Circle -13791810 true false 195 210 60
Rectangle -13791810 true false 60 255 225 270

pillarword
false
0
Rectangle -13345367 true false 60 60 75 150
Rectangle -13345367 true false 60 45 105 60
Rectangle -13345367 true false 90 60 120 75
Rectangle -13345367 true false 105 75 120 90
Rectangle -13345367 true false 90 90 120 105
Rectangle -13345367 true false 75 105 105 120
Rectangle -13345367 true false 150 45 165 150
Rectangle -13345367 true false 195 45 210 135
Rectangle -13345367 true false 195 135 255 150
Rectangle -13345367 true false 60 165 75 270
Rectangle -13345367 true false 75 255 120 270
Rectangle -13345367 true false 105 225 120 270
Rectangle -13345367 true false 120 180 135 240
Rectangle -13345367 true false 135 165 150 195
Rectangle -13345367 true false 165 165 180 240
Rectangle -13345367 true false 165 225 180 270
Rectangle -13791810 true false -390 -45 -315 -30
Rectangle -13345367 true false 150 165 165 180
Rectangle -13345367 true false 135 225 180 240
Rectangle -13345367 true false 195 165 210 270
Rectangle -13345367 true false 210 165 240 180
Rectangle -13345367 true false 225 180 255 195
Rectangle -13345367 true false 240 195 255 210
Rectangle -13345367 true false 225 210 255 225
Rectangle -13345367 true false 210 225 240 240
Rectangle -13345367 true false 225 240 255 255
Rectangle -13345367 true false 240 255 255 270
Rectangle -13345367 true false 135 45 180 60
Rectangle -13345367 true false 135 135 180 150

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

playword
false
0
Rectangle -11221820 true false 60 45 75 165
Rectangle -11221820 true false 75 45 120 60
Rectangle -11221820 true false 105 60 135 75
Rectangle -11221820 true false 120 75 150 90
Rectangle -11221820 true false 105 90 135 105
Rectangle -11221820 true false 75 105 120 120
Rectangle -11221820 true false 165 45 180 165
Rectangle -11221820 true false 180 150 240 165
Rectangle -11221820 true false 60 240 75 285
Rectangle -11221820 true false 75 210 90 255
Rectangle -11221820 true false 90 180 105 225
Rectangle -11221820 true false 105 180 150 195
Rectangle -11221820 true false 135 195 150 285
Rectangle -11221820 true false 90 240 135 255
Rectangle -11221820 true false 180 210 195 240
Rectangle -11221820 true false 165 180 180 225
Rectangle -11221820 true false 195 225 210 285
Rectangle -11221820 true false 225 180 240 225
Rectangle -11221820 true false 210 210 225 240

pushword
false
0
Rectangle -6459832 true false 30 45 240 300
Rectangle -16777216 true false 60 120 60 120
Rectangle -16777216 true false 60 75 75 135
Rectangle -16777216 true false 60 120 75 165
Rectangle -16777216 true false 75 60 105 75
Rectangle -16777216 true false 105 75 120 90
Rectangle -16777216 true false 105 90 120 105
Rectangle -16777216 true false 75 105 105 120
Rectangle -16777216 true false 135 60 150 135
Rectangle -16777216 true false 150 135 165 150
Rectangle -16777216 true false 165 150 180 165
Rectangle -16777216 true false 180 135 195 150
Rectangle -16777216 true false 195 75 210 135
Rectangle -16777216 true false 105 195 120 210
Rectangle -16777216 true false 75 180 105 195
Rectangle -16777216 true false 60 195 75 225
Rectangle -16777216 true false 75 225 90 240
Rectangle -16777216 true false 90 225 105 240
Rectangle -16777216 true false 105 240 120 270
Rectangle -16777216 true false 75 270 105 285
Rectangle -16777216 true false 60 255 75 270
Rectangle -16777216 true false 135 180 150 285
Rectangle -16777216 true false 150 225 195 240
Rectangle -16777216 true false 195 180 210 270
Rectangle -16777216 true false 150 105 150 105
Rectangle -16777216 true false 30 285 60 300
Rectangle -16777216 true false 30 270 45 285
Rectangle -16777216 true false 30 45 60 60
Rectangle -16777216 true false 30 60 45 75
Rectangle -16777216 true false 210 45 240 60
Rectangle -16777216 true false 225 60 240 75
Rectangle -16777216 true false 225 270 240 300
Rectangle -16777216 true false 210 285 225 300
Rectangle -6459832 true false 30 75 60 270

rock
false
6
Rectangle -6459832 true false 75 45 195 60
Rectangle -6459832 true false 60 60 225 75
Rectangle -6459832 true false 45 75 240 90
Rectangle -6459832 true false 45 90 240 105
Rectangle -6459832 true false 75 105 255 195
Rectangle -6459832 true false 60 135 75 195
Rectangle -6459832 true false 45 195 240 210
Rectangle -6459832 true false 45 210 225 225
Rectangle -6459832 true false 60 225 225 240
Rectangle -6459832 true false 75 240 210 255
Rectangle -6459832 true false 45 135 75 195
Rectangle -6459832 true false 60 105 75 135
Line -6459832 false 75 75 225 75
Line -6459832 false 45 105 240 105
Line -6459832 false 75 120 75 225
Line -6459832 false 45 210 240 210
Line -6459832 false 45 195 240 195
Line -6459832 false 60 225 225 225
Line -6459832 false 75 75 75 165
Rectangle -16777216 true false 60 75 75 90
Rectangle -16777216 true false 60 90 150 105
Rectangle -16777216 true false 210 75 225 90
Rectangle -16777216 true false 195 75 210 105
Rectangle -16777216 true false 225 105 240 135
Rectangle -16777216 true false 210 120 225 150
Rectangle -16777216 true false 180 150 210 165
Rectangle -16777216 true false 195 135 210 165
Rectangle -16777216 true false 150 150 210 165
Rectangle -16777216 true false 90 165 165 180
Rectangle -16777216 true false 75 150 105 165
Rectangle -6459832 true false 60 180 75 225
Rectangle -16777216 true false 75 210 105 225
Rectangle -16777216 true false 90 225 120 240
Rectangle -16777216 true false 105 225 120 240
Rectangle -16777216 true false 75 195 90 210
Rectangle -16777216 true false 120 225 210 240
Rectangle -16777216 true false 150 210 210 225
Rectangle -16777216 true false 180 195 210 210
Rectangle -16777216 true false 210 180 225 210
Rectangle -16777216 true false 225 165 240 195
Rectangle -16777216 true false 60 135 75 150

rockword
false
0
Rectangle -6459832 true false 45 105 45 105
Rectangle -6459832 true false 60 45 75 150
Rectangle -6459832 true false 75 45 105 60
Rectangle -6459832 true false 105 60 120 90
Rectangle -6459832 true false 90 90 105 105
Rectangle -6459832 true false 75 105 90 120
Rectangle -6459832 true false 90 120 105 135
Rectangle -6459832 true false 105 135 120 150
Rectangle -6459832 true false 150 60 165 75
Rectangle -6459832 true false 135 75 150 105
Rectangle -6459832 true false 135 105 150 120
Rectangle -6459832 true false 150 120 165 135
Rectangle -6459832 true false 165 135 195 150
Rectangle -6459832 true false 165 45 195 60
Rectangle -6459832 true false 195 60 210 75
Rectangle -6459832 true false 210 75 225 120
Rectangle -6459832 true false 195 120 210 135
Rectangle -6459832 true false 90 165 120 180
Rectangle -6459832 true false 75 180 90 195
Rectangle -6459832 true false 60 225 75 240
Rectangle -6459832 true false 60 195 75 225
Rectangle -6459832 true false 75 240 90 255
Rectangle -6459832 true false 90 255 135 270
Rectangle -6459832 true false 150 165 165 270
Rectangle -6459832 true false 165 210 180 225
Rectangle -6459832 true false 180 195 195 210
Rectangle -6459832 true false 195 180 210 195
Rectangle -6459832 true false 210 165 225 180
Rectangle -6459832 true false 180 225 195 240
Rectangle -6459832 true false 195 240 210 255
Rectangle -6459832 true false 210 255 225 270

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

sinkword
false
0
Rectangle -11221820 true false 60 30 240 45
Rectangle -11221820 true false 45 45 255 60
Rectangle -11221820 true false 30 60 270 255
Rectangle -11221820 true false 60 255 240 270
Rectangle -16777216 true false 120 60 120 75
Rectangle -16777216 true false 120 60 150 75
Rectangle -16777216 true false 75 45 135 60
Rectangle -16777216 true false 60 60 75 105
Line -16777216 false 75 60 75 90
Line -16777216 false 75 60 75 105
Line -16777216 false 75 60 60 60
Rectangle -16777216 true false 60 90 90 105
Rectangle -16777216 true false 75 105 120 120
Rectangle -16777216 true false 105 120 135 150
Rectangle -16777216 true false 60 150 120 165
Rectangle -16777216 true false 45 120 60 150
Rectangle -16777216 true false 60 135 75 150
Rectangle -16777216 true false 75 60 90 75
Rectangle -16777216 true false 165 60 240 75
Rectangle -16777216 true false 195 75 210 75
Rectangle -16777216 true false 210 75 255 90
Rectangle -16777216 true false 195 75 210 120
Rectangle -16777216 true false 180 105 195 135
Rectangle -16777216 true false 150 135 210 150
Rectangle -16777216 true false 195 150 240 165
Rectangle -16777216 true false 75 270 75 285
Rectangle -16777216 true false 45 225 60 255
Rectangle -16777216 true false 60 195 75 240
Rectangle -16777216 true false 75 180 90 210
Rectangle -16777216 true false 90 195 105 225
Rectangle -16777216 true false 105 210 120 240
Rectangle -16777216 true false 120 225 135 255
Rectangle -16777216 true false 60 255 75 255
Rectangle -16777216 true false 135 240 150 270
Rectangle -16777216 true false 165 180 180 240
Rectangle -16777216 true false 150 210 165 255
Rectangle -16777216 true false 180 240 195 270
Rectangle -16777216 true false 195 180 210 255
Rectangle -16777216 true false 210 210 240 225
Rectangle -16777216 true false 225 180 255 195
Rectangle -16777216 true false 225 210 240 225
Rectangle -16777216 true false 240 210 255 240
Rectangle -16777216 true false 255 225 270 255
Rectangle -16777216 true false 225 195 240 210
Rectangle -16777216 true false 210 195 225 210

skull
false
15
Rectangle -2674135 true false 75 45 225 60
Rectangle -6459832 true false 60 60 75 75
Rectangle -6459832 true false 225 60 240 75
Rectangle -2674135 true false 45 75 60 165
Rectangle -2674135 true false 240 75 255 165
Rectangle -6459832 true false 60 165 75 195
Rectangle -6459832 true false 225 165 240 195
Rectangle -2674135 true false 75 195 90 240
Rectangle -2674135 true false 210 195 225 240
Rectangle -2674135 true false 60 75 75 165
Rectangle -2674135 true false 225 75 240 165
Rectangle -6459832 true false 75 60 225 105
Rectangle -6459832 true false 75 105 90 120
Rectangle -6459832 true false 210 105 225 120
Rectangle -2674135 true false 135 105 165 165
Rectangle -6459832 true false 75 165 240 180
Rectangle -6459832 true false 165 150 180 165
Rectangle -6459832 true false 120 150 135 165
Rectangle -6459832 true false 75 180 135 195
Rectangle -6459832 true false 165 180 225 195
Rectangle -6459832 true false 90 195 210 210
Rectangle -2674135 true false 120 210 135 240
Rectangle -2674135 true false 165 210 180 240
Rectangle -2674135 true false 60 60 240 105
Rectangle -2674135 true false 60 165 135 195
Rectangle -2674135 true false 165 165 240 195
Rectangle -2674135 true false 60 90 90 120
Rectangle -2674135 true false 210 90 240 120
Rectangle -2674135 true false 120 150 180 180
Rectangle -2674135 true false 75 195 225 210
Rectangle -2674135 true false 75 180 135 210
Rectangle -2674135 true false 165 180 225 210
Rectangle -2674135 true false 135 90 165 120
Rectangle -2674135 true false 75 75 75 75

skullword
false
0
Rectangle -2674135 true false 105 60 135 75
Rectangle -2674135 true false 60 45 120 60
Rectangle -2674135 true false 45 60 75 75
Rectangle -2674135 true false 45 75 60 105
Rectangle -2674135 true false 60 90 75 120
Rectangle -2674135 true false 60 105 105 120
Rectangle -2674135 true false 90 120 120 150
Rectangle -2674135 true false 45 150 105 165
Rectangle -2674135 true false 30 135 60 150
Rectangle -2674135 true false 30 120 45 135
Rectangle -2674135 true false 165 45 180 135
Rectangle -2674135 true false 150 120 165 165
Rectangle -2674135 true false 210 45 240 60
Rectangle -2674135 true false 195 60 225 75
Rectangle -2674135 true false 180 75 210 90
Rectangle -2674135 true false 180 105 210 120
Rectangle -2674135 true false 195 120 225 135
Rectangle -2674135 true false 210 135 240 150
Rectangle -2674135 true false 225 150 255 165
Rectangle -2674135 true false 180 90 195 105
Rectangle -2674135 true false 45 180 60 255
Rectangle -2674135 true false 60 240 75 270
Rectangle -2674135 true false 75 255 90 270
Rectangle -2674135 true false 90 240 105 270
Rectangle -2674135 true false 105 180 120 255
Rectangle -2674135 true false 135 180 150 255
Rectangle -2674135 true false 135 240 150 270
Rectangle -2674135 true false 135 255 180 270
Rectangle -2674135 true false 195 180 210 270
Rectangle -2674135 true false 210 255 240 270

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Rectangle -1184463 true false 60 90 90 105
Rectangle -1184463 true false 90 90 105 105
Rectangle -1184463 true false 105 60 120 90
Rectangle -1184463 true false 120 45 135 60
Rectangle -1184463 true false 135 30 150 45
Rectangle -1184463 true false 150 45 165 75
Rectangle -1184463 true false 165 75 180 105
Rectangle -1184463 true false 180 105 240 120
Rectangle -1184463 true false 30 105 60 120
Rectangle -1184463 true false 45 120 75 135
Rectangle -1184463 true false 60 135 90 150
Rectangle -1184463 true false 90 150 105 165
Rectangle -1184463 true false 180 90 210 105
Rectangle -1184463 true false 75 165 105 180
Rectangle -1184463 true false 60 180 75 210
Rectangle -1184463 true false 165 135 195 150
Rectangle -1184463 true false 195 120 225 135
Rectangle -1184463 true false 60 105 195 150
Rectangle -1184463 true false 120 45 165 105
Rectangle -1184463 true false 105 90 120 105
Rectangle -16777216 true false 60 135 75 150
Rectangle -1184463 true false 60 195 75 225
Rectangle -1184463 true false 75 180 90 210
Rectangle -1184463 true false 45 210 60 225
Rectangle -1184463 true false 75 210 90 225
Rectangle -1184463 true false 90 180 105 210
Rectangle -1184463 true false 105 150 120 195
Rectangle -1184463 true false 120 135 150 180
Rectangle -1184463 true false 150 150 180 180
Rectangle -1184463 true false 150 150 195 195
Rectangle -1184463 true false 195 180 210 210
Rectangle -1184463 true false 195 195 210 225
Rectangle -1184463 true false 210 210 240 225
Rectangle -1184463 true false 210 195 225 210
Rectangle -1184463 true false 165 195 195 210
Line -1184463 false 105 60 105 135
Line -1184463 false 60 105 210 105
Line -1184463 false 180 75 180 135
Line -1184463 false 165 75 165 135
Line -1184463 false 150 45 135 45
Line -1184463 false 195 135 195 120
Line -1184463 false 165 195 210 195
Line -1184463 false 195 135 195 210
Line -1184463 false 75 165 150 165
Line -1184463 false 105 195 105 135
Line -1184463 false 75 165 75 225
Rectangle -955883 true false 135 60 150 105
Rectangle -955883 true false 165 105 180 135
Rectangle -955883 true false 180 105 195 120
Rectangle -955883 true false 90 120 120 135
Rectangle -955883 true false 75 105 105 120
Rectangle -955883 true false 105 150 120 180
Rectangle -955883 true false 120 150 135 165
Rectangle -955883 true false 150 150 180 165
Rectangle -955883 true false 165 165 180 180
Rectangle -1184463 true false 195 135 210 150
Line -1184463 false 210 135 150 135

starword
false
0
Rectangle -955883 true false 105 45 135 60
Rectangle -955883 true false 60 30 120 45
Rectangle -955883 true false 45 45 75 60
Rectangle -955883 true false 45 60 60 75
Rectangle -955883 true false 45 75 75 90
Rectangle -955883 true false 60 90 120 105
Rectangle -955883 true false 105 105 135 135
Rectangle -955883 true false 60 135 120 150
Rectangle -955883 true false 45 120 75 135
Rectangle -955883 true false 150 30 225 45
Rectangle -955883 true false 180 45 195 150
Rectangle -955883 true false 120 180 120 225
Rectangle -955883 true false 120 165 135 285
Rectangle -955883 true false 75 165 105 180
Rectangle -955883 true false 60 180 90 195
Rectangle -955883 true false 60 195 75 210
Rectangle -955883 true false 45 210 75 225
Rectangle -955883 true false 45 225 60 285
Rectangle -955883 true false 60 240 120 225
Rectangle -955883 true false 60 225 135 240
Rectangle -955883 true false 90 165 90 195
Rectangle -955883 true false 105 165 120 180
Rectangle -955883 true false 150 165 165 285
Rectangle -955883 true false 165 165 210 180
Rectangle -955883 true false 195 180 225 195
Rectangle -955883 true false 210 195 225 210
Rectangle -955883 true false 195 210 225 225
Rectangle -955883 true false 165 225 210 240
Rectangle -955883 true false 195 240 225 255
Rectangle -955883 true false 210 255 240 270
Rectangle -955883 true false 225 270 240 285

stopword
false
4
Rectangle -7500403 true false 60 45 240 255
Rectangle -7500403 true false 240 45 255 255
Rectangle -7500403 true false 255 60 270 240
Rectangle -7500403 true false 45 45 60 255
Rectangle -7500403 true false 30 60 45 240
Rectangle -16777216 true false 75 45 120 60
Rectangle -16777216 true false 60 60 90 75
Rectangle -16777216 true false 60 75 75 105
Rectangle -16777216 true false 75 90 90 105
Rectangle -16777216 true false 90 90 120 105
Rectangle -16777216 true false 105 105 120 135
Rectangle -16777216 true false 60 135 105 150
Rectangle -16777216 true false 45 120 75 135
Rectangle -16777216 true false 90 120 105 135
Rectangle -16777216 true false 135 45 240 60
Rectangle -16777216 true false 180 60 195 90
Rectangle -16777216 true false 195 75 210 135
Rectangle -16777216 true false 90 240 120 255
Rectangle -16777216 true false 60 225 90 240
Rectangle -16777216 true false 60 195 75 225
Rectangle -16777216 true false 75 180 90 195
Rectangle -16777216 true false 90 180 105 180
Rectangle -16777216 true false 90 165 135 180
Rectangle -16777216 true false 120 180 150 195
Rectangle -16777216 true false 135 195 150 225
Rectangle -16777216 true false 120 225 135 240
Rectangle -16777216 true false 195 210 210 255
Rectangle -16777216 true false 180 195 195 225
Rectangle -16777216 true false 180 165 195 210
Rectangle -16777216 true false 165 150 240 165
Rectangle -16777216 true false 225 165 255 180
Rectangle -16777216 true false 240 180 255 195
Rectangle -16777216 true false 180 195 240 210
Rectangle -7500403 true false 90 255 210 270
Rectangle -7500403 true false 75 30 225 45
Rectangle -7500403 true false 225 45 240 45
Rectangle -7500403 true false 225 30 240 45
Rectangle -7500403 true false 210 30 240 45
Rectangle -7500403 true false 240 60 270 150
Rectangle -7500403 true false 240 195 270 240
Rectangle -7500403 true false 120 240 195 270
Rectangle -7500403 true false 30 60 60 120
Rectangle -7500403 true false 30 135 60 240

tahsinword
false
0
Rectangle -14835848 true false 15 30 285 285
Rectangle -16777216 true false 30 60 105 75
Rectangle -16777216 true false 60 75 75 150
Rectangle -16777216 true false 105 105 120 150
Rectangle -16777216 true false 120 75 135 120
Rectangle -16777216 true false 135 60 165 75
Rectangle -16777216 true false 165 60 180 150
Rectangle -16777216 true false 120 105 165 120
Rectangle -16777216 true false 195 60 210 150
Rectangle -16777216 true false 210 105 240 120
Rectangle -16777216 true false 240 60 255 150
Rectangle -16777216 true false 90 180 105 195
Rectangle -16777216 true false 60 165 105 180
Rectangle -16777216 true false 45 180 60 195
Rectangle -16777216 true false 90 225 105 240
Rectangle -16777216 true false 60 195 75 210
Rectangle -16777216 true false 45 240 90 255
Rectangle -16777216 true false 15 255 30 270
Rectangle -16777216 true false 120 165 165 180
Rectangle -16777216 true false 135 180 150 240
Rectangle -16777216 true false 120 240 165 255
Rectangle -16777216 true false 180 165 195 255
Rectangle -16777216 true false 195 180 210 195
Rectangle -16777216 true false 210 195 225 210
Rectangle -16777216 true false 210 210 225 225
Rectangle -16777216 true false 240 165 255 255
Rectangle -16777216 true false 75 210 90 225
Rectangle -16777216 true false 15 30 45 45
Rectangle -16777216 true false 15 45 30 60
Rectangle -16777216 true false 255 270 285 285
Rectangle -16777216 true false 15 270 45 285
Rectangle -16777216 true false 255 30 285 45
Rectangle -16777216 true false 270 255 285 270
Rectangle -16777216 true false 45 225 60 240
Rectangle -16777216 true false 270 45 285 60
Rectangle -16777216 true false 225 225 240 240

tamzidword
false
0
Rectangle -2674135 true false 0 0 300 270
Rectangle -16777216 true false 30 30 105 45
Rectangle -16777216 true false 60 45 75 120
Rectangle -16777216 true false 105 75 120 120
Rectangle -16777216 true false 120 45 135 90
Rectangle -16777216 true false 135 30 150 60
Rectangle -16777216 true false 150 30 180 45
Rectangle -16777216 true false 165 45 180 120
Rectangle -16777216 true false 120 75 180 90
Rectangle -16777216 true false 195 30 210 120
Rectangle -16777216 true false 210 45 255 60
Rectangle -16777216 true false 225 60 240 75
Rectangle -16777216 true false 255 30 270 120
Rectangle -16777216 true false 45 150 120 165
Rectangle -16777216 true false 90 165 105 180
Rectangle -16777216 true false 75 180 90 210
Rectangle -16777216 true false 60 210 75 225
Rectangle -16777216 true false 45 225 120 240
Rectangle -16777216 true false 135 150 180 165
Rectangle -16777216 true false 150 165 165 240
Rectangle -16777216 true false 135 225 180 240
Rectangle -16777216 true false 195 150 210 240
Rectangle -16777216 true false 210 150 255 165
Rectangle -16777216 true false 240 165 270 180
Rectangle -16777216 true false 255 180 270 210
Rectangle -16777216 true false 240 210 270 225
Rectangle -16777216 true false 210 225 255 240
Rectangle -16777216 true false 0 255 30 270
Rectangle -16777216 true false 0 15 15 30
Rectangle -16777216 true false 270 0 300 15
Rectangle -16777216 true false 285 15 300 240
Rectangle -16777216 true false 0 0 30 15
Rectangle -16777216 true false 270 255 300 270
Rectangle -16777216 true false 0 15 15 255
Rectangle -16777216 true false 0 240 15 255
Rectangle -16777216 true false 285 240 300 255

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

tshape
false
0
Rectangle -13791810 true false 75 60 225 90
Rectangle -13791810 true false 135 90 165 240

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

ushape
false
0
Rectangle -13791810 true false 180 75 210 225
Rectangle -13791810 true false 75 165 180 195
Rectangle -13791810 true false 120 105 120 165
Rectangle -13791810 true false 75 75 105 165

wall
false
15
Rectangle -2674135 true false 45 60 150 105
Rectangle -16777216 true false 165 75 165 105
Rectangle -13791810 true false 165 60 165 120
Rectangle -2674135 true false 165 60 270 105
Rectangle -2674135 true false 45 120 90 165
Rectangle -2674135 true false 105 120 210 165
Rectangle -2674135 true false 225 120 270 165
Rectangle -2674135 true false 45 180 150 225
Rectangle -2674135 true false 165 180 270 225
Rectangle -2674135 true false 45 240 90 285
Rectangle -2674135 true false 105 240 210 285
Rectangle -2674135 true false 225 240 270 285
Rectangle -13345367 true false 45 60 150 105
Rectangle -13345367 true false 165 60 270 105
Rectangle -13345367 true false 45 120 90 165
Rectangle -13345367 true false 105 120 210 165
Rectangle -13345367 true false 225 120 270 165
Rectangle -13345367 true false 45 180 150 225
Rectangle -13345367 true false 165 180 270 225
Rectangle -13345367 true false 45 240 90 285
Rectangle -13345367 true false 105 240 210 285
Rectangle -13345367 true false 225 240 270 285

wallword
false
1
Rectangle -7500403 true false 60 30 75 60
Rectangle -7500403 true false 60 60 75 105
Rectangle -7500403 true false 75 90 90 120
Rectangle -7500403 true false 90 75 105 105
Rectangle -7500403 true false 105 90 120 120
Rectangle -7500403 true false 120 60 135 90
Rectangle -7500403 true false 165 60 195 75
Rectangle -7500403 true false 120 90 135 105
Rectangle -7500403 true false 150 90 165 120
Rectangle -7500403 true false 165 60 180 90
Rectangle -7500403 true false 135 30 150 60
Rectangle -7500403 true false 180 45 210 60
Rectangle -7500403 true false 165 90 195 105
Rectangle -7500403 true false 210 45 225 120
Rectangle -7500403 true false 150 90 225 105
Rectangle -7500403 true false 135 45 150 75
Rectangle -7500403 true false 90 120 105 165
Rectangle -7500403 true false 90 150 105 195
Rectangle -7500403 true false 105 180 135 195
Rectangle -7500403 true false 120 165 150 180
Rectangle -7500403 true false 165 180 225 195
Rectangle -7500403 true false 165 120 180 180

water
false
0
Rectangle -13791810 true false 45 60 255 240
Rectangle -13791810 true false 60 45 225 60
Rectangle -13791810 true false 75 15 105 45
Rectangle -13791810 true false 105 30 165 45
Rectangle -13791810 true false 255 90 270 210
Rectangle -13791810 true false 270 120 285 150
Rectangle -13791810 true false 60 240 135 255
Rectangle -13791810 true false 60 255 120 270
Rectangle -13791810 true false 75 270 120 300
Rectangle -13791810 true false 135 240 240 255
Rectangle -13791810 true false 150 255 225 270
Rectangle -13791810 true false 165 270 225 285
Rectangle -13791810 true false 120 255 135 270
Rectangle -13791810 true false 30 180 45 210
Rectangle -13791810 true false 15 195 30 210
Rectangle -13791810 true false 30 60 45 150
Rectangle -13791810 true false 15 75 30 135
Rectangle -13791810 true false 0 75 15 120
Rectangle -11221820 true false 45 165 90 195
Rectangle -11221820 true false 90 165 135 180
Rectangle -11221820 true false 105 150 165 165
Rectangle -11221820 true false 135 135 210 150
Rectangle -11221820 true false 135 120 180 135
Rectangle -11221820 true false 210 135 225 180
Rectangle -11221820 true false 225 165 270 195
Rectangle -11221820 true false 0 105 15 120
Rectangle -11221820 true false 15 105 60 135
Rectangle -11221820 true false 60 90 75 120
Rectangle -11221820 true false 75 90 135 105
Rectangle -11221820 true false 120 75 135 90
Rectangle -11221820 true false 120 75 195 90
Rectangle -11221820 true false 120 60 150 75
Rectangle -11221820 true false 180 90 240 105
Rectangle -11221820 true false 225 105 270 120
Rectangle -11221820 true false 60 45 105 60
Rectangle -11221820 true false 90 30 165 45
Rectangle -11221820 true false 210 45 225 60
Rectangle -11221820 true false 60 225 90 255
Rectangle -11221820 true false 45 225 60 240
Rectangle -11221820 true false 90 210 105 240
Rectangle -11221820 true false 90 210 180 225
Rectangle -11221820 true false 180 210 195 255
Rectangle -11221820 true false 195 225 210 255
Rectangle -11221820 true false 210 240 240 255
Rectangle -11221820 true false 225 225 255 240
Rectangle -11221820 true false 75 270 120 285

waterword
false
0
Rectangle -11221820 true false 45 45 60 90
Rectangle -11221820 true false 75 90 90 150
Rectangle -11221820 true false 90 75 105 120
Rectangle -11221820 true false 135 75 150 105
Rectangle -11221820 true false 105 90 120 105
Rectangle -11221820 true false 105 105 120 135
Rectangle -11221820 true false 120 90 135 150
Rectangle -11221820 true false 60 75 75 120
Rectangle -11221820 true false 150 45 165 90
Rectangle -11221820 true false 165 120 180 150
Rectangle -11221820 true false 180 105 195 135
Rectangle -11221820 true false 180 90 195 120
Rectangle -11221820 true false 195 60 210 105
Rectangle -11221820 true false 210 60 225 75
Rectangle -11221820 true false 225 60 240 105
Rectangle -11221820 true false 240 90 255 135
Rectangle -11221820 true false 240 120 255 150
Rectangle -11221820 true false 195 120 225 135
Rectangle -11221820 true false 45 195 60 300
Rectangle -11221820 true false 15 195 60 210
Rectangle -11221820 true false 45 180 105 195
Rectangle -11221820 true false 60 195 75 210
Rectangle -11221820 true false 105 210 120 285
Rectangle -11221820 true false 180 195 195 225
Rectangle -11221820 true false 135 180 150 195
Rectangle -11221820 true false 105 240 135 255
Rectangle -11221820 true false 105 285 150 300
Rectangle -11221820 true false 180 195 195 300
Rectangle -11221820 true false 180 180 240 195
Rectangle -11221820 true false 240 195 255 225
Rectangle -11221820 true false 195 225 240 240
Rectangle -11221820 true false 195 240 210 270
Rectangle -11221820 true false 210 255 225 285
Rectangle -11221820 true false 225 270 240 300
Rectangle -11221820 true false 105 195 120 225
Rectangle -11221820 true false 120 180 135 210

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

winword
false
5
Rectangle -1184463 true false 15 75 30 225
Rectangle -1184463 true false 30 60 45 240
Rectangle -1184463 true false 45 45 255 60
Rectangle -1184463 true false 255 60 270 240
Rectangle -1184463 true false 270 75 285 225
Rectangle -1184463 true false 45 60 255 240
Rectangle -16777216 true false 15 105 30 150
Rectangle -16777216 true false 30 135 45 165
Rectangle -16777216 true false 30 150 45 180
Rectangle -16777216 true false 45 165 60 165
Rectangle -16777216 true false 45 120 60 150
Rectangle -16777216 true false 60 135 75 165
Rectangle -16777216 true false 75 150 90 180
Rectangle -16777216 true false 90 120 105 165
Rectangle -16777216 true false 120 105 105 135
Rectangle -16777216 true false 105 90 120 135
Rectangle -16777216 true false 120 75 135 105
Rectangle -16777216 true false 105 135 120 150
Rectangle -16777216 true false 15 150 30 165
Rectangle -16777216 true false 135 180 135 180
Rectangle -16777216 true false 135 165 135 165
Rectangle -16777216 true false 135 165 150 165
Rectangle -16777216 true false 135 120 150 180
Rectangle -16777216 true false 150 75 165 135
Rectangle -6459832 true false 180 180 195 180
Rectangle -16777216 true false 180 135 195 165
Rectangle -16777216 true false 195 90 210 120
Rectangle -16777216 true false 210 105 225 135
Rectangle -16777216 true false 240 120 240 135
Rectangle -16777216 true false 210 135 225 150
Rectangle -16777216 true false 225 165 240 180
Rectangle -16777216 true false 240 135 255 180
Rectangle -16777216 true false 255 105 270 150
Rectangle -16777216 true false 165 165 180 180
Rectangle -16777216 true false 165 180 180 195
Rectangle -16777216 true false 180 120 195 135
Rectangle -16777216 true false 210 150 225 180
Rectangle -16777216 true false 180 165 195 180
Rectangle -1184463 true false 0 105 15 195
Rectangle -1184463 true false 285 105 300 195
Rectangle -1184463 true false 45 45 255 75
Rectangle -1184463 true false 30 60 75 105
Rectangle -1184463 true false 15 75 105 105
Rectangle -1184463 true false 30 90 105 120
Rectangle -1184463 true false 0 165 30 195
Rectangle -1184463 true false 15 180 165 225
Rectangle -1184463 true false 30 210 60 240
Rectangle -1184463 true false 180 180 285 225
Rectangle -1184463 true false 225 210 270 240
Rectangle -1184463 true false 210 60 270 105
Rectangle -1184463 true false 270 105 300 195

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

youword
false
0
Rectangle -5825686 true false 15 75 30 240
Rectangle -5825686 true false 45 240 60 255
Rectangle -5825686 true false 45 255 255 270
Rectangle -5825686 true false 240 240 270 255
Rectangle -5825686 true false 270 75 285 240
Rectangle -5825686 true false 255 60 270 75
Rectangle -5825686 true false 30 60 45 255
Rectangle -5825686 true false 45 45 255 60
Rectangle -5825686 true false 45 75 255 240
Rectangle -5825686 true false 45 60 255 75
Rectangle -5825686 true false 60 240 240 255
Rectangle -16777216 true false 60 90 60 105
Rectangle -16777216 true false 30 90 45 120
Rectangle -16777216 true false 45 120 60 135
Rectangle -16777216 true false 60 135 75 225
Rectangle -16777216 true false 75 120 90 150
Rectangle -16777216 true false 90 90 105 120
Rectangle -16777216 true false 45 135 60 150
Rectangle -16777216 true false 30 120 45 135
Rectangle -16777216 true false 90 120 105 135
Rectangle -16777216 true false 120 150 135 195
Rectangle -16777216 true false 180 150 195 195
Rectangle -16777216 true false 180 210 195 195
Rectangle -5825686 true false 255 75 270 240
Rectangle -16777216 true false 135 120 180 135
Rectangle -16777216 true false 135 210 180 225
Rectangle -16777216 true false 120 135 150 150
Rectangle -16777216 true false 195 120 195 120
Rectangle -16777216 true false 165 135 195 150
Rectangle -16777216 true false 120 195 150 210
Rectangle -16777216 true false 165 195 195 210
Rectangle -16777216 true false 210 105 225 210
Rectangle -16777216 true false 225 210 255 225
Rectangle -16777216 true false 225 195 240 210
Rectangle -16777216 true false 255 195 270 225
Rectangle -16777216 true false 270 210 270 210
Rectangle -16777216 true false 270 105 285 210
Rectangle -5825686 true false 0 90 15 210
Rectangle -5825686 true false 285 90 300 210
Rectangle -5825686 true false 45 45 255 90
Rectangle -5825686 true false 210 60 270 105
Rectangle -5825686 true false 30 60 120 90
Rectangle -5825686 true false 0 90 30 210
Rectangle -5825686 true false 30 150 60 255
Rectangle -5825686 true false 45 240 255 270
Rectangle -5825686 true false 240 90 270 195
Rectangle -5825686 true false 240 90 300 105
Rectangle -5825686 true false 225 225 270 255
Rectangle -5825686 true false 225 225 285 240

yshape
false
0
Polygon -13791810 true false 75 60 120 60 150 150 120 150 75 60
Polygon -13791810 true false 150 150 180 150 225 60 180 60
Rectangle -13791810 true false 135 150 135 150
Rectangle -13791810 true false 120 150 180 240
@#$#@#$#@
NetLogo 6.1.1
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
