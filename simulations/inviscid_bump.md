# [Bosse dans un canal | Écoulement non visqueux](https://su2code.github.io/tutorials/Inviscid_Bump/)

## Objectifs
Après avoir terminé ce tutoriel, l'utilisateur sera familiarisé avec la simulation d'un écoulement interne non visqueux en géométrie 2D. La géométrie spécifique choisie pour ce tutoriel est un canal avec une bosse le long de la paroi inférieure. Par conséquent, les capacités suivantes de SU2 seront présentées dans ce tutoriel :

- Équations d'Euler 2D
- Conditions aux limites de l'entrée, de la sortie et de la paroi
- Le but de ce tutoriel est d'introduire un problème simple d'écoulement non visqueux et d'expliquer comment les marqueurs de frontières sont utilisés dans SU2. Ce tutoriel est utile pour montrer comment un calcul d'écoulement interne peut être effectué en utilisant les conditions limites d'entrée et de sortie.

## Ressources
Vous pouvez trouver les ressources pour ce tutoriel dans le dossier [compressible_flow/Inviscid_Bump](https://github.com/su2code/Tutorials/blob/master/compressible_flow/Inviscid_Bump/) dans le [dépôt de tutoriel](https://github.com/su2code/Tutorials). Vous aurez besoin du fichier de maillage [mesh_channel_256x128.su2](https://github.com/su2code/Tutorials/blob/master/compressible_flow/Inviscid_Bump/mesh_channel_256x128.su2) et du fichier config [inv_channel.cfg](https://github.com/su2code/Tutorials/blob/master/compressible_flow/Inviscid_Bump/inv_channel.cfg).

## Tutoriel
Le tutoriel suivant vous guidera à travers les étapes requises pour résoudre l'écoulement à travers le canal en utilisant SU2.
Il est supposé que vous avez déjà installé SU2_CFD. Si ce n'est fait, veuillez consulter la page [Installation](https://su2clc.github.io/su2_clc/installation).

## Présentation
Cet exemple utilise une géométrie de canal 2D qui présente une bosse circulaire le long de la paroi inférieure.
Il s'agit d'un test simple en écoulement non visqueux pour les conditions limites d'entrée et de sortie subsoniques qui sont requises pour le calcul d'un écoulement interne.

## Description du maillage
Le canal est de longueur 3L avec une hauteur L et une bosse circulaire centrée le long de la paroi inférieure avec une hauteur 0.1L.
Pour le maillage SU2, L = 1.0 a été choisi, comme le montre la figure du maillage ci-dessous. 

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/simulations/figures/inviscid_bump_mesh.png "Maillage du tuyau avec une bosse circulaire sur la paroi inférieure")

## Configuration du problème
Ce tutoriel va permettre de résoudre le problème de l'écoulement à travers le canal avec les conditions suivantes :

- Température de stagnation à l'entrée = 288.6 K
- Pression de stagnation à l'entrée = 102010.0 N/m2
- Direction du flux d'entrée, vecteur unitaire (x,y,z) = (1.0, 0.0, 0.0)
- Pression statique à la sortie = 101300.0 N/m2

## Options du fichier de configuration
Plusieurs options clés du fichier de configuration pour cette simulation sont mises en évidence ici.
### Dans une première partie, nous expliquons quelques détails sur les marqueurs et les conditions aux limites :

```
% -------------------- BOUNDARY CONDITION DEFINITION --------------------------%
%
% Euler wall boundary marker(s) (NONE = no marker)
MARKER_EULER= ( upper_wall, lower_wall )
%
% Inlet boundary type (TOTAL_CONDITIONS, MASS_FLOW)
INLET_TYPE= TOTAL_CONDITIONS
%
% Inlet boundary marker(s) (NONE = no marker) 
% Format: ( inlet marker, total temperature, total pressure, flow_direction_x,
%           flow_direction_y, flow_direction_z, ... ) where flow_direction is
%           a unit vector.
MARKER_INLET= ( inlet, 288.6, 102010.0, 1.0, 0.0, 0.0 )
%
% Outlet boundary marker(s) (NONE = no marker)
% Format: ( outlet marker, back pressure (static), ... )
MARKER_OUTLET= ( outlet, 101300.0 )
```

Les 4 différents marqueurs de frontière dans la grille de calcul doivent avoir un nom associé (upper_wall, lower_wall, inlet et outlet ici).
Ces noms sont associés à un type spécifique de condition de limite dans le fichier de configuration.
Pour les conditions limites d'entrée et de sortie, les conditions d'écoulement supplémentaires sont spécifiées directement dans l'option de configuration.

Le type de condition limite d'entrée est contrôlé par l'option `INLET_TYPE`, et le type `TOTAL_CONDITIONS` est le type par défaut.
Le format de la condition limite d'entrée est (nom du marqueur, température de stagnation d'entrée, pression de stagnation d'entrée, composante x de la direction de l'écoulement, composante y de la direction de l'écoulement, composante z de la direction de l'écoulement), où les trois dernières composantes constituent un vecteur de direction d'écoulement unitaire (amplitude = 1,0). Dans ce problème, l'écoulement est exactement aligné avec la direction x du système de coordonnées, et le vecteur de direction de l'écoulement est donc (1.0, 0.0, 0.0).
Le format de la frontière de sortie est (nom du marqueur, pression statique de sortie).

### Définition des types de surface
```
% ------------------------ SURFACES IDENTIFICATION ----------------------------%
%
% Marker(s) of the surface to be plotted or designed
MARKER_PLOTTING= ( lower_wall )
%
% Marker(s) of the surface where the functional (Cd, Cl, etc.) will be evaluated
MARKER_MONITORING= ( upper_wall, lower_wall )
```

Tous les marqueurs de limites qui sont énumérés dans l'option `MARKER_PLOTTING` seront écrits dans le fichier de visualisation de la solution de surface.
*Toute surface sur laquelle un objectif doit être calculé, comme les forces ou les moments, doit être incluse dans l'option `MARKER_MONITORING`.*

### Quelques options de base liées à l'intégration temporelle :

```
% Time discretization (RUNGE-KUTTA_EXPLICIT, EULER_IMPLICIT, EULER_EXPLICIT)
TIME_DISCRE_FLOW= EULER_IMPLICIT
% 
% Courant-Friedrichs-Lewy condition of the finest grid
CFL_NUMBER= 50.0
```

En général, les utilisateurs peuvent choisir entre l'intégration temporelle explicite ou implicite.
Pour la majorité des problèmes, l'intégration implicite est recommandée pour sa plus grande stabilité et son meilleur potentiel de convergence, en particulier pour les problèmes stables.
Les méthodes implicites offrent généralement une stabilité à des nombres CFL plus élevés, et pour ce problème, l'intégration temporelle implicite d'Euler avec un nombre CFL de 50 est choisie.

### Définition des critères de convergence :

```
% Convergence field (see available fields with the -d flag at the command line)
CONV_FIELD= RMS_DENSITY
%
% Min value of the residual (log10 of the residual)
CONV_RESIDUAL_MINVAL= -10
%
% Start convergence criteria at iteration number
CONV_STARTITER= 10
```

Il existe trois types de critères pour mettre fin à une simulation dans SU2 : l'exécution d'un nombre spécifié d'itérations (option `ITER`), la réduction du résidu d'une équation choisie d'un ordre de grandeur spécifié (ou l'atteinte d'une limite inférieure spécifiée), ou la convergence d'une quantité de sortie particulière, telle que la traînée, vers une certaine tolérance.

Le critère de convergence le plus courant est l'option de réduction du résidu, qui est utilisée dans ce tutoriel en définissant le `CONV_FIELD` comme étant égal à `RMS_DENSITY`, ce qui signifie que nous allons surveiller le résidu quadratique moyen de l'équation de densité.
Le paramètre `CONV_RESIDUAL_MINVAL` définit la valeur minimale que le résidu peut atteindre avant de s'arrêter automatiquement.
Pour un critère de réduction relative du résidu, on peut définir `CONV_FIELD= REL_RMS_DENSITY` pour suivre la baisse relative du résidu de la densité.

Ici, la simulation pour le canal se terminera lorsque le résidu de densité atteindra une valeur de -10.

## Exécution de SU2
Pour exécuter ce cas de test, suivez ces étapes à la ligne de commande d'un terminal :

Déplacez-vous dans le répertoire contenant le fichier de configuration (inv_channel.cfg) et le fichier de maillage (mesh_channel_256x128.su2).
Pour ce faire vous pouvez exécuter la commande suivante:
```
cd chemin_vers_le_dossier
```

Assurez-vous que les outils SU2 ont été compilés, installés et que leur emplacement d'installation a été ajouté à votre path (sinon, voir [Installation](https://su2clc.github.io/su2_clc/installation).
Lancez l'exécutable en exécutant la commande:

```
SU2_CFD inv_channel.cfg
```

SU2 montrera la valeur des résidus à chaque itération du solveur d'écoulement, et la simulation se terminera après avoir atteint les critères de convergence spécifiés.
Les fichiers contenant les résultats seront écrits à la sortie de SU2.

## Résultats
Ouvrez alors les fichiers `.vtu` dans Paraview
On peut alors visualiser les différentes sorties de SU2 tel que le nombre de Mach ou la Pression dans le tuyau.

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/simulations/figures/inviscid_bump_mach.png "Visualisation du nombre de Mach")
Visualisation du nombre de Mach.

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/simulations/figures/inviscid_bump_pressure.png "Visualisation de la pression")
Visualisation de la pression.

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/simulations/figures/inviscid_bump_residual.png "Visualisation du résidu")
Visualisation du résidu (rms(rho) en bleu).

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/simulations/figures/inviscid_bump_residualStop.png "Arrêt de la simulation")
Arrêt de la simulation pour un résidu de 10^(-10).

Les résidus sont données en log10, c'est à dire que pour -10 (valeur choisie dans le fichier de configuration) on a en fait un résidu de 10^(-10).
