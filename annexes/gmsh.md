# Annexe sur GMSH

GMSH est un mailleur qui permet aussi de créer des géométries. Cette annexe comprend l'utilisation générale, la création de géométries et la création de maillages.

## Utilisation

Gmsh est construit autour de quatre modules : géométrie, maillage, solveur et post-traitement. Pour générer des maillages, il suffit généralement d'utiliser les deux premiers modules, où Geometry est utilisé pour créer des géométries 1D-2D ou 3D, et Mesh pour créer des maillages.

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/gmsh1.png "Visualisation de la géométrie")

En outre, toutes les actions sont écrites en code dans un document, de sorte que vous pouvez également manipuler le document pour modifier la géométrie ou vérifier les actions précédentes.
Une fois le maillage généré, cherchez Export dans la colonne File pour exporter le maillage sous la forme souhaitée, vous devrez ajouter votre propre suffixe au fichier (si vous utilisez SU2, vous devrez définir le maillage au format .su2).

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/gmsh2.png "Exporter le maillage")

Le maillage peut alors être appelé dans le fichier de configuration, les paramètres pertinents définis et le calcul effectué à l'aide de SU2.

## Création de la géométrie

Nous pouvons ajouter les éléments que nous voulons mettre en place dans la colonne add (par exemple, le cercle)

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/gmsh3.png "Création de la géométrie")

Nous pouvons ensuite trouver le transfinite dans la barre de mesh, suivi de la définition des curves. Dans cette étape, nous pouvons ajuster le nombre de points pris, ce qui déterminera en partie la précision du maillage final.

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/gmsh4.png "Ajustement du nombre de points")

Il existe de nombreuses autres fonctions spéciales concernant la construction de la géométrie, par exemple pour convertir de la 2D à la 3D, vous pouvez utiliser l'option de rotation dans Transform pour construire une géométrie 3D.
La Symmetry dans Transform est également utile, car il simplifie la charge de travail, n'oubliez donc pas de vous concentrer sur la symétrie de vos graphiques.

Si vous avez perdu l'emplacement ou le bon angle de vue pour créer le graphique, n'oubliez pas de double-cliquer sur l'écran d'accueil et de cliquer sur Reset View pour revenir à l'état de visualisation initial.
Si vous avez fait une erreur, sous la section Module, au-dessus du Edit Script, vous pouvez la retirer en utilisant l'option Remove last script command.

##  Création du maillage

Ensuite, nous revenons à Add de Geometry, nous trouvons la surface plane et l'utilisons pour définir une face fermée, et enfin nous générons le maillage en utilisant l'option 2D dans Mesh.

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/gmsh4.png "Obtention d'un maillage")

Pour modifier la forme du maillage (locale ou globale), vous pouvez également choisir de remodeler le maillage d'une surface en un rectangle en utilisant mesh-define-recombine.

Une fois que votre fichier de maillage est complet, vous pouvez encore modifier les paramètres en double-cliquant sur l'écran principal et en cliquant sur l'option "all mesh options", où vous pouvez ajuster la précision du maillage par taille d'élément.

En ce qui concerne la sortie, comme mentionné ci-dessus, il faut tenir compte du format de sortie et de l'ajout de suffixes.