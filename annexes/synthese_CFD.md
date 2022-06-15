# Introduction à la CFD

Avant toute chose, pour paramétrer puis lancer un calcul de CFD il faut un problème physique bien définit, c'est-à-dire :

- des hypothèses sur l'écoulement (stationnaire, axisymétrique, incompressible, ...) ;
- des caractéristiques du ou des fluides (masse volumique, viscosité, ...) ;
- une géométrie (par exemple un canal) ;
- Des conditions aux limites (voire des conditions initiales). 

Ces éléments définissent le problème physique entièrement.

Un autre élément important est la définition des grandeurs d'intérêt : ce que l'on cherche à calculer par la CFD. En effet, dans la même situation physique, on peut paramétrer la simulation différemment selon la grandeur d'intérêt.

Ces informations vont permettre de déterminer les choix à faire sur le paramétrage de la simulation. En l'occurence, les choix portent sur le maillage (discrétisation de l'espace) et du modèle de résolution des équations.

En effet, on ne va pas utiliser un modèle turbulent pour un calcul d'écoulement laminaire. De même, une taille de maille de l'ordre du centimètre ne permet pas de prendre en compte des effets visibles sur l'échelle du micromètre.


## Les choix pour le maillage

Il faut toujours adapter le maillage au problème : un maillage trop fin sera coûteux en terme de temps de calcul, un maillage trop grossier ne reflète pas la réalité du problème (il peut également y avoir un problème avec la forme du maillage).

La première chose à décider est la zone importante dans le calcul : là où se calcule la grandeur d'intérêt. A cet endroit, il faut un maillage ajusté au vu du problème. Par exemple dans le cas d'un calcul de portance sur l'aile d'un avion, il faut prendre en compte les effets visqueux autour de l'aile. Le maillage autour de l'aile doit donc être plus fin que la couche turbulente (déterminée avec la solution de Blasius). Dans ce même cas, il peut être astucieux d'augmenter la taille du maillge lorsqu'on s'éloigne de l'aile car cela réduit le temps de calcul. **Un premier choix est donc le découpage en "zones" de l'espace**.

A l'intérieur de ces zones, il faut choisir la taille du maillage : est-elle constante? Quelle est alors la taille de première maille? Maille-t-on avec des quadrilatères ou des triangles ? Des tétraèdres ou pavé droits ? On détermine tous ces paramètres à l'aide d'ordres de grandeurs, d'approximation, de la précision recherchée et des données du problème.


## Les choix pour le modèle de résolution (à compléter)

Il s'agit ici de la méthode utilisée pour faire converger la solution de façon à respecter les équations régissant l'écoulement. Pour cette étape, on détermine les équations mises en jeu à partir des caractéristiques du fluide, de la géométrie et des condtions aux limites. 


# Exemple : configuration SOCBT

On présente ici un exemple de choix pour le calcul d'un écoulement turbulent supersonique dont la géométrie est la configuration SOCBT.

## Géométrie
![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/SOCBT_dim.PNG "Géométrie de la configuration SOCBT")

Sur la figure ci-dessus, on présente la géométrie de la configuration SOCBT (les longueurs indiquées sont adimensionnées au diamètre de l'axe). Il s'agit ici du profil d'un objet 3D à symétrie de révolution. On sait donc que l'écoulement est invariant par rotation autour de cet axe : le problème est donc axisymétrique. C'est-à-dire qu'on peut raisonnablement étudier ce problème comme un cas 2D.

## Nombres adimensionnés

Pour compléter la définition du problème, on donne les nombres adimensionés suivants :

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/Nombres_adim.png)

En considérant l'air comme un gaz parfait et en donnant la température (291,3 K) et la pression (27 707 Pa) loin de l'ogive, on peut déterminer toutes les caractérisiques de l'écoulement: vitesse (1 025,3 m/s), masse volumique (0,33 kg/m3) et viscosité (1,8.e-5 Pa.s).

## Maillage
Etant donnée la nature turbulente de l'écoulement, il sera nécessaire d'avoir un maillage "fin" près de l'axe afin de prendre en compte tous les effets turbulents. On définira donc tout d'abord une zone de maillage correspondant à la zone turbulente. Le choix fait ici est de fixer la hauteur de cette zone au maximum de hauteur de la zone turbulente prédite par la solution de Blasius : 

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/Blasius.png)

Ce qui nous donne comme épaisseur de la zone:

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/Blasius_res.png)




Maintenant que cette zone est délimitée, on fait le choix de la mailler avec une épaisseur de maille à prgression linéaire. On fait ce choix afin de prendre en compte les effets dû à la sous-couche moyenne (zone de l'écoulement turbulent proche de la paroi où les effets turbulents ne sont pas dominants) tout en minimisant la taille du maillage. On détermine l'épaisseur de première maille à partir de l'épaisseur de cette sous-couche moyenne, autrement dit on impose:

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/Cond.png)

Par ailleurs, on a la relation suivante entre le coeffificnet de traînée, la vitesse dans la sous-couche moyenne et la vitesse d'écoulement en aval :

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/Rel_coef.png)

On peut ensuite relier le coefficient de traînée avec le nombre de Reynolds:

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/Coef.png)

Finalement, on utilise ces expressions pour déterminer l'épaisseur de première maille:

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/Blasius.png)
![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/Res.png)

On trouve donc une épaisseur de première maille de l'ordre du micron. 

## Modèle de résolution

Etant donné la nature turbulente et supersonique du problème, on utilisera un modèle de résolution RANS qui prend en compte ces deux aspects.
