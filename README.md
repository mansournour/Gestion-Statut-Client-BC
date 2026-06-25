# Gestion de Statut Client — Business Central (AL)

Extension AL pour Microsoft Dynamics 365 Business Central permettant de gérer le statut commercial des clients.

## Fonctionnalités

- **Champ Statut Client** ajouté à la fiche client avec 4 valeurs :
  - `Nouveau` — Client récemment créé
  - `Actif` — Client régulier
  - `VIP` — Client important
  - `Bloqué` — Client dont les opérations sont interdites

- **Contrôle métier** : les clients bloqués ne peuvent pas créer de devis ni de commandes de vente

- **Affichage du statut** dans le module Vente (devis et commandes) avec code couleur

## Structure du projet

```
src/
├── Enum/
│   └── StatutClient.Enum.al           → Enum des 4 statuts
├── TableExtension/
│   ├── CustomerExt.TableExt.al        → Ajout du champ à la table Client
│   └── SalesHeaderExt.TableExt.al     → Contrôle de blocage devis/commandes
└── PageExtension/
    ├── CustomerCardExt.PageExt.al     → Affichage sur la Fiche Client
    ├── CustomerListExt.PageExt.al     → Affichage dans la Liste Clients
    ├── SalesQuoteExt.PageExt.al       → Affichage sur le Devis Vente
    └── SalesOrderExt.PageExt.al       → Affichage sur la Commande Vente
```

## Prérequis

- Visual Studio Code avec l'extension AL Language
- Un environnement Business Central (Sandbox)
- Business Central v24.0 ou supérieur

## Installation

1. Cloner le dépôt
2. Ouvrir le dossier dans VS Code
3. Télécharger les symboles : `Ctrl+Shift+P` → `AL: Download Symbols`
4. Publier : `Ctrl+F5`

## Règles de gestion

| Règle | Description |
|-------|-------------|
| RG01 | Chaque client possède un statut |
| RG02 | Valeurs autorisées : Nouveau, Actif, VIP, Bloqué |
| RG03 | Un client Bloqué ne peut pas créer de devis ni de commande |
| RG04 | Les clients Nouveau, Actif et VIP peuvent effectuer toutes les opérations |
