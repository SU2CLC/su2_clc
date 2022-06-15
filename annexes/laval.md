## Objectifs

Après avoir terminé ce tutoriel, l’utilisateur aura vu un premier cas d’écoulement interne pour une géométrie typique de l'aérospatiale. 
La géométrie étudiée est celle de la tuyère de Laval.
Par conséquent, les capacités suivantes de la chaîne calcul seront présentées dans ce tutoriel :
 * Création d’une géométrie GMSH à l'aide de Python
 * Calcul d'une solution de problème impressible et subsonique

## Ressources

L’objectif de ce tutoriel est de créer le maillage et le fichier de configuration. Vous n’aurez donc besoin que du template de fichier de configuration SU2, disponible ici. Si vous bloquez sur l’une des parties du tutoriel et souhaitez passez à la suite, vous trouverez le fichier de maillage complet [ici](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/fichiers/laval.su2) et le fichier de configuration complété [ici](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/fichiers/laval2.cfg).

## Tutoriel

Le tutoriel suivant vous guidera à travers les étapes requises pour résoudre l’écoulement à travers le canal en utilisant SU2. Il est supposé que vous avez déjà installé SU2_CFD. Si ce n’est fait, veuillez consulter la page [Installation](https://su2clc.github.io/su2_clc/installation).

### Géométrie

La tuyère de Laval est définie par l'équation mathématique suivante:

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/laval_def.PNG "Définition mathématique de la tuyère de Laval")

À l'aide de Python, on peut modifier le fichier .geo de GMSH afin de placer 100 points le long d'une ligne et de les relier. Pour se faire, il suffit de placer les point avec:

```Python
Point(i) = {x,y,z};
```

Puis de tracer les lignes entre deux points j et k avec:

```Python
Line(i) = {j,k};
```

Ceci nous permet enfin d'obtenir la géométrie suivante:

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/laval_geo.PNG "Géométrie de la tuyère de Laval")

### Données du problème

On spécifie maintenant les données relatives à l’écoulement.
Celles-ci ont été définies à l'aide du BE simulation quasi-1D du S9 option aéronautique auxquels les résultats ont été comparés en fin de simulation.
 * Schéma numérique: Roe
 * Ecoulement subsonique avec pression en sortie de 1.9 bar
 * Mach en amont: 0.5
 * Pression en amont: 2 bar
 * Temperature en amont: 300K
 * Prise en compte de frottement et flux de chaleur: cf = 0,h = 0,tp(K) = 250

## Maillage

Un maillage simple avec des mailles triangulaires a été réalisé.

## Calcul de la solution et comparaison à la théorie

Des résultats ont été obtenus après résolution par SU2, ceux-ci sont comparables aux résultats du BE2 du S9 option aéronautique. On notera une légère différence due aux conditions initiales qui ne sont pas strictement équivalentes entre les deux simulations ainsi qu'au fait que notre simulation est en fait en 2D et que nous ramenons les résultats ceux d'une simulation quasi-1D par des opérations de moyennage sur chaque section à x constant.

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/laval_pression.PNG "Pression")

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/laval_mach.PNG "Nombre de Mach")