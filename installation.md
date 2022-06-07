---
layout: default
title: Installation
---

Au vu des lignes de commande à entrer dans la console de votre ordinateur pour exploiter notre chaîne de calcul, vous pourriez penser de prime abord que l'installation de la chaîne sera hardue. Rassurez-vous, nous allons vous guider pas à pas.

# Prérequis

Pour installer la chaîne de calcul, il vous faudra impérativement disposer d'une console de commandes. Si vous utilisez Mac OS ou Linux, vous n'aurez d'autre choix que d'utiliser le terminal natif à votre système d'exploitation ; pour les utilisateurs de Windows, l'usage de la console de commande native est fortement recommandée (accessible via la combinaison des touches Windows et R, puis en tapant cmd dans le champ).

<details>
    <summary> Installation du solveur SU2 </summary>
    
# Installation du solveur SU2
Commencons par le plus long : SU2. Deux méthodes sont possibles :
    - la première, plus facile, consiste à télécharger et installer les éxécutables de SU2. Cette méthode est moins performante, présente des risques d'incompatibilité, mais est facile à installer.
    - la seconde, plus hardue et demandant plus d'aisance avec les outils informatiques, consiste en la compilation et l'installation du calculateur depuis son code source. Il s'agit de la seule méthode possible psi vous souffrez de problèmes de compatibilité en suivant la première option. Attention, sous Winows, il vous faudra impérativement Windows 10.
    
Dans chaque cas, des méthodes d'installation différentes seront donné pour Windows, Linux et Mac OS, ces différences doivent impérativement être respectées.

## Windows : Installation par les éxécutables.

### Etape 1 : Télécharger et décompresser les fichiers d'installation

Rendez-vous sur https://su2code.github.io/download.html, téléchargez l'archive correspondant à votre système d'exploitation et placez-là dans un dossier dédié à SU2. 
Décompressez l'archive à l'aide du logiciel de votre choix. Si vous ne disposez d'aucun logiciel capable de décompresser, téléchargez le logiciel WinRAR : https://www.win-rar.com/predownload.html?&L=10 ou 7zip : https://www.7-zip.org/download.html , et installez le dans un dossier autre quje celui où vous avez placé les fichiers d'installation de SU2.

### Etape 2: Ajouter les variables d'environnement de SU2 à votre système

Cette étape est techniquement optionnelle, mais très fortement recommandée.

Rassurez-vous, c'est plus difficile à lire qu'à faire.
Ouvrez votre barre de recherche windows (accessible en appuyant sur la touche windows, par exemple), et tapez-y "environ". Devrait apparaitre alors en suggestion "Modifier les variables d'environnement système", une section de votre panneau de configuration. Cliquez sur cette suggestion.
Une fois le petit panneau de configuration ouvert, appuyez sur le bouton "Variables d'environnement...". Une nouvelle fenêtre s'ouvre.
Dans la moitié inférieure de cette fenêtre se trouve le panneau des variables système. Créez une nouvelle variable en cliquant sur le bouton "Nouvelle...". Dans le champ "Nom de la Variable", inscrivez-y "SU2_RUN", puis dans le champ "Valeur de la variable", inscrivez-y le chemin d'accès menant au dossier où vous avez décompressé les fichiers téléchargés à l'étape 1. Pour ce faire facilement, trouvez simplement le dossier au sein duquel se trouve le fichier "SU2_CFD.exe", puis double cliquez sur la barre en haut de votre explorateur de fichier (celle où est inscrite le chemin d'accès) pour sélectionner facilement le chemin d'accès que nous souhaitons. Ensuite, copiez-collez le dans le champ "Valeur de la variable".

Pour les curieux, cette opération vous permet d'accéder facilement à votre dossier SU2 depuis l'invite de commande, en utilisant simplement la commande "cd %SU2_RUN%, plutôt que de devoir taper le chemin d'accès entier. 

### Etape 3: Modifier le chemin d'accès système

Encore une fois, plus facile à faire qu'à lire, laissez-vous guider.

Réitérez le début des opérations de l'étape 3 pour ouvrir la fenêtre "Variables d'envuironnement" (obtenue après avoir cliqué sur le bouton "Variable d'environnements..." du premier panneau de configuration).
Toujours dans la moitié inférieure de ceette fenêtre, trouvez et cliquez sur la variable système nommée "Path" dans le menu défilant. Une fois sélectionnée, cliquez sur le bouton "Modifier...". Dans le cas où cette variable n'existerait pas encore, cliquez alors sur le bouton "New...". Si vous créez la variable, pensez à l'appeler "Path" dans le champ "Nom de la variable". Dans tous les cas, dans le champ "Valeur de la variable", entrez le même chemin d'accès que celui de l'étape 2.

### Etape 4 : lancer SU2

Enfin, lancez SU2 depuis votre invite de commande, en tapant %SU2_RUN% SU2_CFD.exe si vous avez réalisé l'étape 3, ou en tapant le chemin d'accés de vos fichiers SU2, suivi de "SU2_RUN.exe".

## Windows : Installation par le code source

Voici la méthode hardue pour obtenir SU2, mais promettant de plus grandes performances. Notez bien qu'il vous faut impérativement Windows 10, Python 3.7 ou plus récent, MinGW-w64 version 8.1.0 ou plus récent, Microsoft MPI version 10.1.2 ou plus récent.

### Etape 1:
Dans votre dossier contenant mingw-w64, éxécutez le fichier "mingw-w64". Naviguez alors au sein de l'invite de commande ouverte par mingw-w64 vers votre dossier contenant le code-source de SU2 en utilisant la commande cd suivie du chemin d'accés.
</details>

<details> <summary> Installation du mailleur </summary>
    
# Installation du mailleur

Pour créer vos structures en 2D ou 3d, il vous faut un mailleur, logiciel capable de créer numériquement les dites structures à l'aide de lignes, point courbes, surfaces et volumes, et de discrétiser le volume occupé par le fluide à étudier.
Dans cette chaine de calcul, nous utiliserons le logiciel GMSH, gratuit et libre de toute license étudiante.

## Installation :
Depuis la page http://gmsh.info/#Download , téléchargez la version de GMSH correspondant à votre système d'exploitation. Placez impérativement l'archive téléchargée dans un dossier différent de celui de SU2. Décompressez l'archive.
Et... Ca y est. Vous avez installé GMSH. Pour l'ouvrir, exécutez simplement "gmsh.exe", présent dans le dossier nommé "gmsh-[version]-[système d'exploitation]".
</details>

<details> <summary>Installation du visualiseur </summary>
    
# Installation du visualiseur

SU2 ne supporte pas la visualisation des résultats de vos calculs, il faut donc s'appuyer sur un logiciel extérieur de visualisation. Nous utiliserons Paraview, là encore un logiciel gratuit et libre de toute license. 

## Installation
Rendez-vous sur la page https://www.paraview.org/download/ , descendez jusqu'à la section "Get the software", puis télécharger la dernière version disponible, typiquement celle présente le plus haut au sein du menu déroulant. Placez le fichier téléchargé dans un dossier autre que celui où se situe SU2, puis éxécutez-le : l'installeur intégré vous guidera.
   </details>
