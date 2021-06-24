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
