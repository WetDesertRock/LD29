local first = {
    name = "The Start",
    maxscore = 2,
    maxedges = 5,
    maxedgelen = 110,
    dimrate = 3,
    textbox = {23,271,741,217},
    goalnode = {362,141},
    rednode = {677,124},
    bluenode = {45,147},
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
        huemult = 0.3,
        cs = 30,
    }

first.text = {}
first.text[1] = "This story is a story about connections and decisions. I made connections with people, and  I decided to use these connections. Its almost as if I were in complete control of my own mind for once. I had never felt that way before. That was the problem, I didn't know how to act."
first.text[2] = first.text[1]
first.helptext = "(Click and drag between circles to create and delete connections. You cannot delete connections which have been used already. Connect either the red or blue to the goal at the bottom to go on to the next level.)"

local second = {
    name = "She",
    maxscore = 2,
    maxedges = 20,
    maxedgelen = 110,
    dimrate = 1.7,
    textbox = {348,227,444,364},
    goalnode = {252,247},
    rednode = {442,39},
    bluenode = {60,33},
    nodes = {
        {126,115,1},
        {196,178},
        {377,109},
        {299,174},
    }
}

second.background = {
        lightness = 0.75,
        saturation = 0.325,
        huemult = 0.3,
        cs = 40,
    }

second.text = {}
second.text[1] = "How did I act? I'd like to believe I acted normal. I could never tell. People always gave me odd glances, and stared at me behind my back. I felt like they could all tell that I wasn't always the one controlling myself. They seemed to be wary of me. Except for her. She seemed to know and understand everything, its as if she was placed there just for me."
second.text[2] = "How did I act? I always acted normal. I never felt troubled to fit in, it always worked out. I was fully conscious of every decision, and I never made a mistake. That is how I was able to find her. She was placed there just for me it seemed, it didn't matter if I made a mistake in front of her. She knew why I was special."
second.helptext = "Some times you need more than one circle contributing to succeed. However, your goal can only have one connection."

local third = {
    name = "Social",
    maxscore = 5,
    maxedges = 5,
    maxedgelen = 110,
    dimrate = 3,
    textbox = {391,17,397,255},
    goalnode = {343,286},
    rednode = {670,444},
    bluenode = {79,63},
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
        lightness = 0.7,
        saturation = 0.350,
        huemult = 0.3,
        cs = 50,
    }

third.text = {}
third.text[1] = "We eventually grew very close, she was very sociable with me, however she never wanted to go to social events with me. She always stayed behind and continued whatever she would be working on at that time. Things weren't as fun with her staying behind. Everyone acted weird around me."
third.text[2] = "We eventually grew very close, she was very sociable with me, however she never wanted to go to social events with me. I would eventually end up staying with her more and more rather than go to social events. People would always look at me odd, and I felt like I had to keep watching my back."

-- levelset = {first,second,third}
return {first}

-- return levelset
