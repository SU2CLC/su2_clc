# Introduction à la CFD

Avant toute chose, pour paramétrer puis lancer un calcul de CFD il faut un problème physique bien définit, c'est-à-dire des hypothèses sur l'écoulement (stationnaire, axisymétrique, incompressible, ...), des caractéristiques du (ou des) fluides (masse volumique, viscosité, ...), une géométrie (par exemple un canal) et des conditions aux limites (voire des conditions initiales). Ces éléments définissent le problème physique entièrement.

Un autre élément important est la définition des grandeurs d'intérêt : ce que l'on cherche à calculer par la CFD. En effet, dans la même situation physique, on peut paramétrer la simulation différemment selon la grandeur d'intérêt.

Ces informations vont permettre de déterminer les choix à faire sur le paramétrage de la simulation. En locurance, les choix portent sur le maillage (discrétisation de l'espace) et du modèle de résolution des équations.

En effet, on ne va pas utiliser un modèle turbulent pour un calcul d'écoulement laminaire. De même, une taille de maille de l'ordre du mètre ne permet pas de prendre en compte des effets visibles sur l'échelle du micron.


## Les choix pour maillage

Il faut toujours adapter le maillage au problème : un maillage trop fin sera coûteux en terme de temps de calcul, un maillage trop grossier ne reflète pas la réalité du problème (il peut également y avoir un problème avec la forme du maillage).

La premère chose à décider est la zone importante dans le calcul : là où se calcule la grandeur d'intérêt. A cet endroit, il faut un maillage ajusté au vu du problème. Par exemple dans le cas d'un calcul de portance sur l'aile d'un avion, il faut prendre en compte les effets visqueux autour de l'aile, le maillage autour le l'aile doit donc être plus fin que la couche turbulente (qu'on détermine avec la solution de Blasius). Dans ce même cas, il peut être astucieux d'augmenter la taille du maillge lorsqu'on s'éloigne de l'aile (cela réduit le temps de calcul). Un premier choix est donc le découpage en "zones" de l'espace.

A l'intérieur de ces zones, il faut choisir la taille du maillage: est-elle constante? Quelle est alors la taille de preimière maille? Maille-t-on avec des quadrilatères ou des triangles (dans le cas 3D: tétraèdres ou pavé droits)? On détermine tout ces paramètres à l'aide d'ordres de grandeurs, d'approximation, de la précision recherchée et des données du problèmes.


## Les choix pour le modèle de résolution (à compléter)

Il s'agit ici de la méthode utilisée pour faire converger la solution de façon à respecter les équations régissant l'écoulement. Pour cette étape, on détermine les équations mises en jeu à partir des caractéristiques du fluide, de la géométrie et des condtions aux limites. 
