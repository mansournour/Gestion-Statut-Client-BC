# 🏢 Gestion de Statut Client — Business Central

[![AL Language](https://img.shields.io/badge/Language-AL-blue)](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-programming-in-al)
[![Business Central](https://img.shields.io/badge/Platform-Business%20Central-green)](https://dynamics.microsoft.com/en-us/business-central/)
[![Version](https://img.shields.io/badge/Version-1.0.0-orange)]()
[![License](https://img.shields.io/badge/License-MIT-yellow)]()

> Extension AL pour **Microsoft Dynamics 365 Business Central** permettant de classifier les clients selon leur statut commercial et de contrôler les opérations de vente.

---

## 📋 Table des matières

- [Contexte](#-contexte)
- [Fonctionnalités](#-fonctionnalités)
- [Statuts disponibles](#-statuts-disponibles)
- [Architecture du projet](#-architecture-du-projet)
- [Objets AL développés](#-objets-al-développés)
- [Règles de gestion](#-règles-de-gestion)
- [Prérequis](#-prérequis)
- [Installation](#-installation)
- [Démonstration](#-démonstration)
- [Technologies utilisées](#-technologies-utilisées)

---

## 🎯 Contexte

Dans une entreprise, tous les clients n'ont pas le même niveau d'importance ni le même état de relation commerciale. Par défaut, Business Central ne fournit pas un système simple permettant de classifier les clients selon leur statut métier.

Cette extension ajoute un **champ personnalisé** permettant d'identifier rapidement le statut d'un client et de **contrôler les opérations commerciales** en fonction de ce statut.

---

## ✨ Fonctionnalités

| Fonctionnalité | Description |
|----------------|-------------|
| 📌 **Statut personnalisé** | Champ "Statut Client" ajouté à la fiche client |
| 📋 **Visibilité vente** | Statut visible dans la liste clients, les devis et les commandes |
| 🚫 **Blocage automatique** | Interdiction de créer des devis/commandes pour les clients bloqués |
| 🎨 **Code couleur** | Affichage coloré du statut dans les documents de vente |
| 🔒 **Sécurité commerciale** | Processus de vente sécurisé et contrôlé |

---

## 🏷️ Statuts disponibles

| Statut | Description | Couleur | Opérations autorisées |
|--------|-------------|---------|----------------------|
| 🆕 **Nouveau** | Client récemment créé, aucune transaction réalisée | Gris | ✅ Toutes |
| ✅ **Actif** | Client régulier pouvant effectuer des achats | Vert | ✅ Toutes |
| ⭐ **VIP** | Client important bénéficiant d'un suivi particulier | Gras | ✅ Toutes |
| 🚫 **Bloqué** | Client dont les opérations commerciales sont interdites | Rouge | ❌ Devis et commandes interdits |

---

## 🏗️ Architecture du projet

```
Gestion-Statut-Client-BC/
│
├── 📄 app.json                                    # Manifeste de l'extension
├── 📄 README.md                                   # Documentation
├── 📄 .gitignore                                  # Fichiers exclus de Git
│
├── 📁 .vscode/
│   ├── launch.json                                # Configuration de déploiement
│   └── settings.json                              # Paramètres VS Code
│
└── 📁 src/
    ├── 📁 Enum/
    │   └── StatutClient.Enum.al                   # Énumération des 4 statuts
    │
    ├── 📁 TableExtension/
    │   ├── CustomerExt.TableExt.al                # Champ ajouté à la table Client
    │   └── SalesHeaderExt.TableExt.al             # Logique de blocage devis/commandes
    │
    └── 📁 PageExtension/
        ├── CustomerCardExt.PageExt.al             # Statut sur la Fiche Client
        ├── CustomerListExt.PageExt.al             # Statut dans la Liste Clients
        ├── SalesQuoteExt.PageExt.al               # Statut sur le Devis Vente
        └── SalesOrderExt.PageExt.al               # Statut sur la Commande Vente
```

---

## 📦 Objets AL développés

| ID | Type | Nom | Étend | Rôle |
|----|------|-----|-------|------|
| 50200 | `Enum` | Statut Client | — | Définit les 4 valeurs de statut |
| 50200 | `Table Extension` | Customer Status Ext | Customer (18) | Ajoute le champ Statut Client |
| 50201 | `Table Extension` | Sales Header Status Ext | Sales Header (36) | Contrôle de blocage |
| 50200 | `Page Extension` | Customer Card Status Ext | Customer Card (21) | Affichage fiche client |
| 50201 | `Page Extension` | Customer List Status Ext | Customer List (22) | Affichage liste clients |
| 50202 | `Page Extension` | Sales Quote Status Ext | Sales Quote (41) | Affichage devis vente |
| 50203 | `Page Extension` | Sales Order Status Ext | Sales Order (42) | Affichage commande vente |

---

## 📏 Règles de gestion

| Code | Règle | Implémentation |
|------|-------|----------------|
| **RG01** | Chaque client doit posséder un statut | Valeur par défaut : `Nouveau` |
| **RG02** | Valeurs autorisées : Nouveau, Actif, VIP, Bloqué | Contrôlé par l'Enum |
| **RG03** | Un client Bloqué ne peut ni créer de devis, ni créer de commande | Validation dans Sales Header |
| **RG04** | Les clients Nouveau, Actif et VIP peuvent effectuer toutes les opérations | Aucune restriction |

---

## 🔄 Flux de contrôle

```
Utilisateur crée un Devis / Commande
            │
            ▼
    Sélection du Client
            │
            ▼
    Lecture du Statut Client
            │
            ▼
    ┌───────────────┐
    │  Statut =     │
    │  Bloqué ?     │
    └───────┬───────┘
            │
     ┌──────┴──────┐
     │             │
    OUI           NON
     │             │
     ▼             ▼
  ❌ Error()    ✅ Création
  Message       Devis/Commande
  d'erreur      autorisée
```

---

## ⚙️ Prérequis

- **Visual Studio Code** avec l'extension [AL Language](https://marketplace.visualstudio.com/items?itemName=ms-dynamics-smb.al)
- **Microsoft Dynamics 365 Business Central** — Environnement Sandbox
- **Business Central v24.0** ou version supérieure

---

## 🚀 Installation

1. **Cloner le dépôt**
   ```bash
   git clone https://github.com/mansournour/Gestion-Statut-Client-BC.git
   ```

2. **Ouvrir dans VS Code**
   ```
   File → Open Folder → Gestion-Statut-Client-BC
   ```

3. **Configurer l'environnement** — Modifier `.vscode/launch.json` :
   ```json
   {
     "environmentName": "VOTRE_ENVIRONNEMENT",
     "tenant": "VOTRE_TENANT_ID"
   }
   ```

4. **Télécharger les symboles**
   ```
   Ctrl+Shift+P → AL: Download Symbols
   ```

5. **Publier l'extension**
   ```
   Ctrl+F5
   ```

---

## 🎬 Démonstration

### Fiche Client avec Statut
L'utilisateur peut consulter et modifier le statut depuis la fiche client :
```
┌──────────────────────────────────────┐
│  Fiche Client                        │
│                                      │
│  N° : 10000                         │
│  Nom : Adatum Corporation           │
│  Statut Client : [ VIP         ▼]   │
│  Solde DS : 0,00                    │
└──────────────────────────────────────┘
```

### Blocage d'un client
Lorsqu'un client bloqué est sélectionné pour un devis ou une commande :
```
┌──────────────────────────────────────────────┐
│  ❌ Erreur                                    │
│                                              │
│  Le client 10000 (Adatum Corporation)        │
│  est bloqué.                                 │
│  La création du devis est interdite.         │
│                                              │
│                              [ OK ]          │
└──────────────────────────────────────────────┘
```

---

## 🛠️ Technologies utilisées

| Technologie | Utilisation |
|-------------|-------------|
| **AL Language** | Langage de développement Business Central |
| **Visual Studio Code** | Environnement de développement |
| **Microsoft Dynamics 365 Business Central** | Plateforme ERP |
| **Git / GitHub** | Gestion de version et hébergement du code |

---

## 👤 Auteur

**Mansour Nour** — Développeur Business Central

---

## 📄 Licence

Ce projet est sous licence MIT. Vous êtes libre de l'utiliser, le modifier et le distribuer.
