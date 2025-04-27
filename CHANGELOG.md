# Changelog

Alle Änderungen an der `lenhardt_its.base` Ansible Collection werden in diesem Dokument festgehalten.

## [1.0.0] - 2025-03-05
### Hinzugefügt
- Erste Version der **`lenhardt_its.base`** Ansible Collection.
- Basisrollen für die Standardserverkonfiguration.

### Geändert
- `ansible-lint` Korrekturen: Über 100 Fehler und Warnungen behoben.
  - Veraltete Module ersetzt.
  - Loop-Fehler (`loop` + `with_items`) bereinigt.
  - Idempotenz sichergestellt (`changed_when`, `when`-Bedingungen angepasst).
  - Variablenbenennung (`var-naming`) standardisiert.

### Behoben
- Fehlerhafte `loop`-Strukturen durch `subelements()` ersetzt.
- Syntax-Fehler in `tasks/main.yml` korrigiert.
- Nicht unterstützte Module entfernt oder angepasst.

---

## Nächste Schritte
- Testsuite mit **Molecule** und **GitHub Actions** erweitern.
- Dokumentation für alle Rollen verbessern.
- Automatisierte CI/CD-Checks für Codequalität hinzufügen.