VAR intelligence = 3
VAR charisma = 3
VAR confidence = 3
VAR empathy = 3
VAR d20Result = 0 //Initialise d20 variable here first

-> main
=== main ===
CHARLOTTE: "How can you say something like that?"
INCEL: "Because women are having it too easy nowadays!"
*CHARLOTTE: "Actually, women are still disadvantaged in -"
INCEL: "What disadvantage? They got all the advantage lor."
-> noServeNS
*CHARLOTTE: "Oh come on it can't be that bad. It's still fun being a guy, right?"
INCEL: "Where got? Where got fun being guy? We still need to serve NS leh!"
-> noServeNS
*CHARLOTTE: "Don't be such a baby."
INCEL: "I where got baby? Is those stupid SJW feminists who get triggered by every single damn thing then they baby!"
-> noServeNS

===noServeNS===
INCEL: "They don't need to serve NS so they start work earlier than us. And they can just stay home while it's men who do all the work!"
*CHARLOTTE: "So how is it that women still earn less on average than men?"
~d20Result = RANDOM(1, 20) //use tilde for variable?
{d20Result + intelligence >= 10: // don't need to write "if"
You succeed! Your roll was {d20Result} + {intelligence}. Continue the story...
    ->SAallegation  
- else:
    You fail! Deal with the consequences...
    ->SAallegation
}

* CHARLOTTE: "Brother, you want to complain that women can work or they cannot work? Make up your mind leh..."
~d20Result = RANDOM(1, 20)
{d20Result >= 10:
INCEL: "Uh... I... I... women need to know their place! And that's that!"
    ->SAallegation  
- else:
INCEL: "You don't know what you are talking about. Women are stealing job opportunities from us and still have the audacity to complain."
    ->SAallegation
}

* CHARLOTTE: "... Did something happen? Like, between you and a girl, maybe?"

~d20Result = RANDOM(1, 20)
{d20Result >= 10:
INCEL: "None of your business! Why would my personal life factor into this academic debate?"
->SAallegation  
- else:
INCEL: "N-no! Why would you even ask that? I'm totally fine. It's these women who aren't."
->SAallegation
}

===SAallegation===
INCEL: "Then also, they can anyhow say we rape them and we cannot say no! It's their word against ours."


-> END