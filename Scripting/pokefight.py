from pip._vendor import requests
def pokefight():    
    poke1, poke2 = input("Choose your pokemons\n").split()
    response = requests.get("https://pokeapi.co/api/v2/pokemon/" + poke1)
    pokedata1 = response.json()
    response = requests.get("https://pokeapi.co/api/v2/pokemon/" + poke2)
    pokedata2 = response.json()
    pokeattack1 = str(pokedata1['stats'][1]['base_stat'])
    pokeattack2 = str(pokedata2['stats'][1]['base_stat'])
    print(poke1 + " (" + pokeattack1 + ")" + " Vs. " + poke2 + " (" + pokeattack2 + ")")
    if (pokeattack1 > pokeattack2):
        print(poke1 + " wins!")
    elif (pokeattack2 > pokeattack1):
        print(poke2 + " wins!")
    else:
        print("It is a draw!")
pokefight()
