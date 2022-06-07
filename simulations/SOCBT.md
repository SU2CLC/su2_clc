## Objectifs

Après avoir terminé ce tutoriel, l’utilisateur sera familiarisé avec le maillage à géométrie variable, l’écoulement à vitesse supersonique, et aura vu un premier cas d’écoulement autour d’une géométrie typique de l'aérospatiale. 
La géométrie étudiée est la géométrie dite “ SOCBT”, pour Secant Ogive Cylinder Boat-Tail, pouvant se traduire par ogive cylindrique à arrière coupé. Celle-ci sera soumise numériquement à de l’air à vitesse supersonique.
Par conséquent, les capacités suivantes de la chaîne calcul seront présentées dans ce tutoriel :
 * Création d’un maillage à géométrie variable avec GMSH
 * Calcul d'une solution de problème compressible turbulent

## Ressources

L’objectif de ce tutoriel est de créer le maillage et le fichier de configuration. Vous n’aurez donc besoin que du template de fichier de configuration SU2, disponible ici. Si vous bloquez sur l’une des parties du tutoriel et souhaitez passez à la suite, vous trouverez le fichier de maillage complet ici et le fichier de configuration complété ici.

## Tutoriel
Le tutoriel suivant vous guidera à travers les étapes requises pour résoudre l’écoulement à travers le canal en utilisant SU2. Il est supposé que vous avez déjà installé SU2_CFD. Si ce n’est fait, veuillez consulter la page Installation.


## Configuration SOCBT

La configuration SOCBT correspond à un écoulement d’air autour d’une ogive à vitesse supersonique. On décrit dans cette section la géométrie de l’ogive puis on donne les autres données du problème.

### Géométrie

![alt text](https://raw.githubusercontent.com/SU2CLC/su2_clc/main/annexes/figures/SOCBT_dim.PNG "Géométrie de la configuration SOCBT")

Les côtes sur le schéma ci-dessus sont données avec comme unité le diamètre de l’ogive. L’attaque de l’ogive est un cône arrondi de rayon 18,88 sur une longueur dans l’axe de 3,017. La partie derrière l’attaque est un cylindre de diamètre 1 et de longueur 2. La partie suivante est une section de cône d’angle 7° de longueur 0,983.

### Données du problème

On spécifie maintenant les données relatives à l’écoulement. L’entrée d’air dans le système s’effectue du côté de l’attaque. La vitesse de l’air en entrée correspond à Mach 3 et le nombre de Reynolds est de 6,5 e6. En considérant l'air comme un gaz parfait et en donnant la température (291,3 K) et la pression (27 707 Pa) loin de l'ogive, on peut déterminer toutes les caractérisiques de l'écoulement: vitesse (1 025,3 m/s), masse volumique (0,33 kg/m3) et viscosité (1,8.e-5 Pa.s).

L’écoulement est donc compressible turbulent.

## Maillage

## Calcul de la solution
