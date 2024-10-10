# Mathieu Stamm

# 1) Demander un chiffre n entre 1 et 9 à l'utilisateur (1pt)
sapin = int(input("Entrez un chiffre entre 1 et 9 ? : "))
print(sapin)

ready = str(input("Etes vous pret à passer à la suite ? : "))
print(ready)

while ready != "oui":
    ready = str(input("Etes vous pret à passer à la suite ? : "))
    print(ready)
else:
    # 2) Afficher à l'écran une ligne de n étoiles (2pts)
    print("patientez svp, la suite arrive immédiatement")
    sapin = int(input("Entrez un chiffre entre 1 et 9 ? : "))
    print(sapin * "*")

ready = str(input("Etes vous pret à passer à la suite ? : "))
print(ready)

while ready != "oui":
    ready = str(input("Etes vous pret à passer à la suite ? : "))
    print(ready)
else:
    # 3) Afficher à l'écran un carré de n*n étoiles (3pts)
    print("Patientez svp, la suite arrive immédiatement")
    sapin = int(input("Entrez un chiffre entre 1 et 9 : "))
    carre = sapin * "*"
    print((carre + "\n") * sapin)

ready = str(input("Etes vous pret à passer à la suite ? : "))
print(ready)

while ready != "oui":
    ready = str(input("Etes vous pret à passer à la suite ? : "))
    print(ready)
else:
    # 4) Afficher un triangle isocèle de hauteur n (5pts)
    print("patientez svp, la suite arrive immédiatement")
    sapin = int(input("Entrez un chiffre entre 1 et 9 ? : "))
    for triangle in range(1, sapin + 1):
        print(triangle * "*")

ready = str(input("Etes vous pret à passer à la suite ? : "))
print(ready)

while ready != "oui":
    ready = str(input("Etes vous pret à passer à la suite ? : "))
    print(ready)
else:
    # 5) Afficher ce même triangle la tête en bas (5pts)
    print("patientez svp, la suite arrive immédiatement")
    sapin = int(input("Entrez un chiffre entre 1 et 9 ? : "))

    for triangle in range(sapin, 0, -1):
        print(triangle * "*")

ready = str(input("Etes vous pret à passer à la suite ? : "))
print(ready)

while ready != "oui":
    ready = str(input("Etes vous pret à passer à la suite ? : "))
    print(ready)
else:
    # 6) Le sapin (10pts) :
    print("patientez svp, la suite arrive immédiatement")
    sapin = int(input("Entrez un chiffre entre 1 et 9 ? : "))
    for triangle in range(1, sapin + 1):
        print(triangle * "*")

ready = str(input("Etes vous pret à passer à la suite ? : "))
print(ready)

if ready != "non":
    print("C'est la fin, y'a pas de suite 😛🤣")
else:
    print("C'est la fin, y'a pas de suite 😛🤣")
