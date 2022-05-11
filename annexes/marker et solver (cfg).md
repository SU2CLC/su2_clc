# Marker

(cf: [su2code.github.io](https://su2code.github.io/docs_v7/Markers-and-BC/#euler-slip-wall))

## Définition

- **Frontière**:
```
MARKER_EULER = ( upper_wall, lower_wall )
```

- **Inlet**:

Format: ( inlet marker, total temperature, total pressure, flow_direction_x, flow_direction_y, flow_direction_z, ... )
```
MARKER_INLET = ( inlet, 288.6, 102010.0, 1.0, 0.0, 0.0 )
```

- **Outlet**:

Format: ( outlet marker, back pressure (static), ... )
```
MARKER_OUTLET = ( outlet, 101300.0 )
```

- **Frontière adiabatique, sans glissement**:

Format: ( marker name, constant heat flux (J/m^2), ... ) (no marker=NONE)

```
MARKER_HEATFLUX = ( wall, 0.0 )
```

Une condition de frontière adiabatique, sans glissement, peut être sélectionnée en utilisant l'option `MARKER_HEATFLUX` avec la valeur du flux thermique fixée à 0,0.

(cf: [su2code.github.io](https://su2code.github.io/tutorials/Laminar_Flat_Plate/))

```
MARKER_ISOTHERMAL = ( NONE )
```

Une condition de paroi isotherme est également disponible avec un format similaire pour définir une température fixe sur la paroi.

- **Autres Options**：
Tous les marqueurs de frontières qui sont listés dans l'option `MARKER_PLOTTING` seront écrits dans le fichier de visualisation de la solution de surface. 

```
MARKER_PLOTTING = ( lower_wall )
````

Toutes les surfaces sur lesquelles un objectif doit être calculé, comme les forces ou les moments, doivent être incluses dans l'option `MARKER_MONITORING`.

```
MARKER_MONITORING = ( upper_wall, lower_wall )
```

# Solver

## Turbulence

Les équations gouvernantes sont d'abord définies comme les équations de Navier-Stokes moyennées par Reynolds, et en entrant `KIND_TURB_MODEL = SA`, nous activons le modèle de turbulence Spalart-Allmaras (SA). Le modèle SA est un modèle à une équation pour une variable de champ de turbulence qui est directement liée à la viscosité turbulente des tourbillons. Il s'agit d'un choix populaire pour les écoulements aérodynamiques externes, tels que ceux autour des profils et des ailes. Le modèle SA négatif (SA_NEG), d'autres variantes de SA et le modèle Shear Stress Transport (SST) de Menter sont également disponibles dans SU2. (cf: [su2code.github.io](https://su2code.github.io/tutorials/Turbulent_Flat_Plate/))

```
SOLVER = RANS
Specify turbulence model (NONE, SA, SA_NEG, SST)
KIND_TURB_MODEL = SA
```

Une méthode de vent ascendant scalaire et la méthode de la moyenne corrigée des gradients sont les schémas par défaut pour les flux convectifs et visqueux turbulents, respectivement. Cependant, l'utilisateur a la possibilité de calculer le flux convectif au 1er ordre (`MUSCL_TURB = NO`), au 2ème ordre (`MUSCL_TURB = YES` et `SLOPE_LIMITER_TURB = NONE`), ou au 2ème ordre avec limitation de pente (`MUSCL_TURB = YES` et `SLOPE_LIMITER_TURB` choisi parmi une option autre que `NONE`).

```
CONV_NUM_METHOD_TURB = SCALAR_UPWIND
MUSCL_TURB = NO
SLOPE_LIMITER_TURB = VENKATAKRISHNAN
TIME_DISCRE_TURB = EULER_IMPLICIT
```

Format de slope limiter: Slopelimiter(`NONE`,`VENKATAKRISHNAN`,`VENKATAKRISHNAN_WANG`, `BARTH_JESPERSEN`, `VAN_ALBADA_EDGE`)

## Écoulement laminaire

Physical governing equations(`EULER`,`NAVIER_STOKES`,`WAVE_EQUATION`,`HEAT_EQUATION`,`FEM_ELASTICITY`,`POISSON_EQUATION`)

```
SOLVER = NAVIER_STOKES
```


