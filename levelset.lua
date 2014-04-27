local first = {
    name = "Beneath the Surface",
    maxscore = 2,
    maxedges = 5,
    maxedgelen = 110,
    dimrate = 3,
    textbox = {23,271,741,217},
    goalnode = {362,141},
    rednodes = {
        {677,124},
    },
    bluenodes = {
        {45,147},
    },
    nodes = {
        {464,140},
        {571,135,1},
        {255,142},
        {150,147,2},
    }
}
first.background = {
        lightness = 0.8,
        saturation = 0.3,
        huemult = 0.31,
        cs = 30,
    }

first.helptext = "Click and drag between circles to create and delete connections. You cannot delete connections which have been used already. Connect either the red or blue to the goal at the bottom to go on to the next level. You can press 'r' at anytime to reset the level."

local second = {
    name = "Wary",
    maxscore = 3,
    maxedges = 5,
    maxedgelen = 110,
    dimrate = 5,
    textbox = {192,13,596,237},
    goalnode = {343,286},
    rednodes = {
        {670,444},
    },
    bluenodes = {
        {79,63},
    },
    nodes = {
        {62,167},
        {569,462},
        {467,462},
        {378,426,1},
        {114,255},
        {290,368,2},
        {201,316},
    }
}

second.background = {
        lightness = 0.77,
        saturation = 0.325,
        huemult = 0.32,
        cs = 40,
    }

second.helptext = "Be what's Beneath the Surface, control the narrators life by choosing to use blue or red to get past each level."


local third = {
    name = "Closeness",
    maxscore = 2,
    maxedges = 20,
    maxedgelen = 110,
    dimrate = 1.7,
    textbox = {311,161,471,421},
    goalnode = {250,201},
    rednodes = {
        {442,39},
    },
    bluenodes = {
        {60,33},
    },
    nodes = {
        {126,115,1},
        {377,109},
        {300,76},
        {196,80},
        {249,125},
    }
}

third.background = {
        lightness = 0.73,
        saturation = 0.350,
        huemult = 0.33,
        cs = 50,
    }

third.helptext = "Some times you need more than one circle contributing to succeed. However, your different types of circles have limited number of connections."

local fourth = {
    name = "Sickness",
    maxscore = 2,
    maxedges = 50,
    maxedgelen = 110,
    dimrate = 1.5,
    textbox = {410,354,372,230},
    goalnode = {273,429},
    rednodes = {
        {245,31},
        {632,39},
    },
    bluenodes = {
        {59,35},
        {441,35},
    },
    nodes = {
        {58,137},
        {242,134,1},
        {443,137},
        {631,140,2},
        {148,180,1},
        {536,175},
        {475,254},
        {215,252,2},
        {419,290},
        {280,299},
        {353,366},
    }
}

fourth.background = {
        lightness = 0.7,
        saturation = 0.375,
        huemult = 0.34,
        cs = 60,
    }

fourth.helptext = "Sometimes there can be more than one emitter of each type."

local fifth = {
    name = "Imbalance",
    maxscore = 4,
    maxedges = 50,
    maxedgelen = 110,
    dimrate = 1.5,
    textbox = {13,265,542,313},
    goalnode = {369,31},
    rednodes = {
        {20,17},
        {548,121},
    },
    bluenodes = {
        {713,14},
        {199,118},
    },
    nodes = {
        {630,69,1},
        {107,72,2},
        {301,139,2},
        {449,134,1},
        {372,106},
    }
}

fifth.background = {
        lightness = 0.67,
        saturation = 0.400,
        huemult = 0.35,
        cs = 70,
        cp = 15,
    }

fifth.helptext = "Remember, if you made a mistake, you can reset the level with 'r'"

local sixth = { -- The polarizing level, lets try to force someone to one side or another. Level 9 doesn't like random switches.
    name = "Distance",
    maxscore = 10,
    maxedges = 50,
    maxedgelen = 110,
    dimrate = 1.8,
    textbox = {23,271,741,217},
    goalnode = {387,130},
    rednodes = {
        {677,124},
        {644,33},
        {733,58},
    },
    bluenodes = {
        {99,133},
        {44,205},
        {128,224},
    },
    nodes = {
        {576,129,1},
        {480,126},
        {293,129},
        {200,129,2},
    }
}

sixth.background = {
        lightness = 0.63,
        saturation = 0.425,
        huemult = 0.36,
        cs = 80,
        cp = 15,
    }

sixth.helptext = "Sometimes in life there is no inbetween."

local seventh = {
    name = "Isolation",
    maxscore = 4,
    maxedges = 50,
    maxedgelen = 110,
    dimrate = 1.3,
    textbox = {25,268,751,292},
    goalnode = {430,132},
    rednodes = {
        {29,121},
        {199,203},
        {301,211},
        {541,43},
        {634,37},
    },
    bluenodes = {
        {204,51},
        {304,50},
        {756,133},
        {620,224},
        {537,216},
    },
    nodes = {
        {95,195,1},
        {101,55},
        {356,131},
        {511,132},
        {697,64},
        {700,205,2},
    }
}
seventh.background = {
        lightness = 0.60,
        saturation = 0.450,
        huemult = 0.37,
        cs = 90,
        cp = 20,
    }

seventh.helptext = "Sometimes making decisions is easy, but they may not be the best ones."

local eighth = {
    name = "Year Two",
    maxscore = 3,
    maxedges = 50,
    maxedgelen = 110,
    dimrate = 1.5,
    textbox = {409,7,378,574},
    goalnode = {167,358},
    rednodes = {
        {118,36},
        {42,188},
    },
    bluenodes = {
        {36,92},
        {203,96},
    },
    nodes = {
        {257,157,2},
        {38,277},
        {278,254},
        {91,345},
        {231,320,1},
    }
}

eighth.background = {
        lightness = 0.57,
        saturation = 0.475,
        huemult = 0.38,
        cs = 100,
        cp = 50,
    }

local ninth = {
    name = "October",
    maxscore = 5,
    maxedges = 50,
    maxedgelen = 110,
    dimrate = 0.7,
    textbox = {409,7,378,574},
    goalnode = {187,219},
    rednodes = {
        {40,46},
        {200,10},
        {334,37},
        {134,330},
        {288,323},
    },
    bluenodes = {
        {113,108},
        {285,101},
        {346,408},
        {210,477},
        {81,405},
    },
    nodes = {
        {196,91},
        {201,159},
        {210,297},
        {213,389},
    }
}

ninth.background = {
        lightness = 0.50,
        saturation = 0.50,
        huemult = 0.4,
        cs = 150,
        cp = 80,
    }

--first,second,third,fourth,fifth,sixth,seventh,eighth
local levelset = {first,second,third,fourth,fifth,sixth,seventh,eighth,ninth}

local text = {{}}
for line in love.filesystem.lines("media/story.txt") do
    if line:sub(1,3) == "---" then
        table.insert(text,{})
    elseif line ~= "" then
        table.insert(text[#text],line)
    end
end
levelset.text = text

return levelset
