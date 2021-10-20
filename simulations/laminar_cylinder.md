# [Cylindre | Écoulement laminaire](https://su2code.github.io/tutorials/Inviscid_Wedge/)

## Objectifs
À la fin de ce tutoriel, l'utilisateur sera familiarisé avec la simulation d'un écoulement laminaire autour d'une géométrie 2D.
La géométrie spécifique choisie pour ce tutoriel est un cylindre. Par conséquent, les capacités suivantes de SU2 seront présentées :

- Équations Navier-Stokes laminaires 2D en régime permanent
- Multigrille
- Schéma convectif de Roe dans l'espace (2e ordre)
- Schéma visqueux moyen des gradients corrigés
- Intégration temporelle implicite d'Euler
- Conditions aux limites de Navier-Stokes pour la paroi (sans glissement) et le champ lointain.

## Ressources
Les ressources pour ce tutoriel peuvent être trouvées dans le répertoire [compressible_flow/Laminar_Cylinder](https://github.com/su2code/Tutorials/tree/master/compressible_flow/Laminar_Cylinder) dans le [dépôt de tutoriel](https://github.com/su2code/Tutorials).
Vous aurez besoin du fichier de configuration ([lam_cylinder.cfg](https://github.com/su2code/Tutorials/tree/master/compressible_flow/Laminar_Cylinder/lam_cylinder.cfg)) et du fichier de maillage ([mesh_cylinder_lam.su2](https://github.com/su2code/Tutorials/tree/master/compressible_flow/Laminar_Cylinder/mesh_cylinder_lam.su2)).

## Tutoriel
Le tutoriel suivant vous guidera à travers les étapes nécessaires à la résolution de l'écoulement externe autour d'un cylindre en utilisant SU2.
Il est supposé que vous avez déjà installé SU2_CFD. Si ce n'est pas fait, veuillez consulter la page [Installation](https://su2clc.github.io/su2_clc/installation).

## Contexte
L'écoulement autour d'un cylindre circulaire 2D est un cas qui a été largement utilisé à la fois à des fins de validation et comme cas de recherche.
À des nombres de Reynolds très bas, inférieurs à environ 46, l'écoulement est stable et symétrique.
Au fur et à mesure que le nombre de Reynolds augmente, des asymétries et une dépendance temporelle se développent, aboutissant finalement à une allée tourbillonaire de Von Karman, puis à la turbulence.

## Description du maillage
La géométrie du problème est en 2D.
La frontière extérieure se trouve à environ 15 diamètres de la surface du cylindre pour éviter toute interaction entre les conditions limites.
Des conditions aux limites de champ lointain sont utilisées à la limite extérieure. Des conditions aux limites sans glissement sont placées sur la surface du cylindre.

Maillage du cylindre:

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/simulations/figures/laminar_cylinder_mesh.png "Maillage du cylindre")

## Configuration du problème
Ce problème résoudra l'écoulement externe compressible sur le cylindre avec les conditions suivantes :

- Température du flux libre = 273,15 K
- Nombre de Mach de la veine libre = 0,1
- Angle d'attaque (AOA) = 0,0 degré
- Nombre de Reynolds = 40 pour un rayon de cylindre de 1m

## Options du fichier de configuration
Plusieurs des options clés du fichier de configuration pour cette simulation sont mises en évidence ici.
Dans ce tutoriel, nous aimerions mettre en évidence les options concernant la spécification des schémas de convection :

```
% -------------------- FLOW NUMERICAL METHOD DEFINITION -----------------------%
%
% Convective numerical method (JST, LAX-FRIEDRICH, CUSP, ROE, AUSM, HLLC,
%                              TURKEL_PREC, MSW)
CONV_NUM_METHOD_FLOW= ROE
%
% Monotonic Upwind Scheme for Conservation Laws (TVD) in the flow equations.
%           Required for 2nd order upwind schemes (NO, YES)
MUSCL_FLOW= YES
%
% Slope limiter (NONE, VENKATAKRISHNAN, VENKATAKRISHNAN_WANG,
%                BARTH_JESPERSEN, VAN_ALBADA_EDGE)
SLOPE_LIMITER_FLOW= NONE
%
% Coefficient for the Venkat's limiter (upwind scheme). A larger values decrease
%             the extent of limiting, values approaching zero cause
%             lower-order approximation to the solution (0.05 by default)
VENKAT_LIMITER_COEFF= 0.05
```

Pour un écoulement laminaire autour du cylindre, nous choisissons la méthode `ROE` avec une reconstruction de 2ème ordre (`MUSCL_FLOW = YES`).
Ce cas à faible vitesse est exécuté sans limiteur de pente.
Notez que, `SLOPE_LIMITER_FLOW` doit être défini à une valeur autre que NONE, sinon, aucune limitation ne sera appliquée au flux convectif pendant la reconstruction d'ordre supérieur.
La limitation n'est pas applicable si `MUSCL_FLOW = NO`, car il n'y a pas de reconstruction d'ordre supérieur, et donc, pas besoin de limiter les gradients.
Les termes visqueux sont calculés avec la méthode de la moyenne corrigée des gradients (par défaut). Plusieurs limiteurs sont disponibles dans SU2, y compris le populaire limiteur `VENKATAKRISHNAN` pour les grilles non structurées.
Il est recommandé aux utilisateurs d'expérimenter la valeur `VENKAT_LIMITER_COEFF` pour leurs propres applications.

## Exécution de SU2
Pour exécuter ce cas de test, suivez les étapes suivantes sur une ligne de commande de terminal :

Allez dans le répertoire contenant le fichier de configuration (lam_cylinder.cfg) et le fichier de maillage (mesh_cylinder_lam.su2).
Pour se faire, exécutez la commande suivante:

```
cd $chemin_vers_le_dossier$
```

Assurez-vous que les outils SU2 ont été installés et que leur emplacement d'installation a été ajouté à votre PATH.
Lancez l'exécutable en entrant:

```
SU2_CFD lam_cylinder.cfg
```
dans la ligne de commande.

SU2 montrera l'évolution des résidus à chaque itération du solveur d'écoulement, et la simulation se terminera après avoir atteint les critères de convergence spécifiés.
Les fichiers contenant les résultats seront écrits à l'arrêt de SU2.

## Résultats
Ouvrez alors les fichiers `.vtu` dans Paraview
On peut alors visualiser les différentes sorties de SU2 tel que la viscosité ou le nombre de Mach autour du cylindre:

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/simulations/figures/laminar_cylinder_mach.png "Nombre de Mach autour du cylindre")
Visualisation du nombre de Mach.

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/simulations/figures/laminar_cylinder_viscosity.png "Viscosité autour du cylindre")
Visualisation du nombre de Mach.
