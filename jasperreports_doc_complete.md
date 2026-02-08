# 📄 JasperReports – Références spéciales complètes

Cette documentation décrit toutes les références internes utilisées dans JasperReports.

---

## $F{...} – Fields (Champs)
Champs issus de la source de données (SQL, JSON, JavaBeans, XML).

**Exemple SQL :**
```sql
SELECT id, name, price FROM products
```
**Utilisation :**
```java
$F{id}
$F{name}
$F{price}
```

---

## $P{...} – Parameters (Paramètres)
Valeurs envoyées depuis l’application Java vers le rapport.
**Définition dans JRXML :**
```xml
<parameter name="USER_ID" class="java.lang.Integer"/>

<![CDATA[$P{SHOP}.get("adresse")]]>

```

**Utilisation SQL :**
```sql
SELECT * FROM orders WHERE user_id = $P{USER_ID}
```

---

## $V{...} – Variables
Valeurs calculées par JasperReports.

**Exemples :**
```java
$V{PAGE_NUMBER}
$V{REPORT_COUNT}
$V{TOTAL_SALES}
```

### Variables système courantes
| Nom | Description |
|------|------------|
| PAGE_NUMBER | Numéro de page |
| PAGE_COUNT | Nombre total de pages |
| REPORT_COUNT | Nombre de lignes |
| COLUMN_NUMBER | Numéro de colonne |
| MASTER_CURRENT_PAGE | Page du master |
| MASTER_TOTAL_PAGES | Pages totales |

---

## $R{...} – Resources (i18n)
Accès aux fichiers de traduction `.properties`.

**Exemple :**
```java
$R{label.total}
```

**messages_fr.properties :**
```
label.total=Total
```

---

## $X{...} – SQL Helpers
Génération dynamique de SQL.

**Exemple :**
```sql
WHERE $X{IN, category, CATEGORY_LIST}
```

---

## $S{...} – Champs de tri
Utilisé avec le tri dynamique.

```java
$S{ORDER_DATE}
```

---

## $T{...} – Templates
Utilisation de styles venant de templates JRXML.

```java
$T{MyStyle}
```

---

## $C{...} – Styles conditionnels
Appliquer un style selon une condition.

```java
$C{isNegative}
```

---

## $J{...} – Propriétés Jasper
Accès aux propriétés internes du moteur.

```java
$J{net.sf.jasperreports.export.pdf.encrypted}
```

---

## $D{...} – Dataset Fields
Utilisé dans les sous-datasets.

```java
$D{price}
```

---

## 🧩 Récapitulatif

| Préfixe | Rôle |
|--------|------|
| $F | Champ de données |
| $P | Paramètre |
| $V | Variable |
| $R | Ressource (i18n) |
| $X | SQL dynamique |
| $S | Tri |
| $T | Template |
| $C | Condition |
| $J | Propriété moteur |
| $D | Dataset |

---

## Mémo rapide
```
$F = Données
$P = Entrée
$V = Calcul
$R = Traduction
```
