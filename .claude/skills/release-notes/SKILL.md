---
name: release-notes
description: Guidelines and template for writing DevKin GitHub Release notes. Use this when preparing release notes for a new DevKin version.
---

# DevKin Release Notes

These are the rules for writing the body of a GitHub Release. Use `template.md` in the same directory as the template. The template is split into two sections: **Korean at the top / English below `---`**.

## Procedure

1. Find the previous release tag: `git describe --tags --abbrev=0 --match 'v*'`
2. Review commits since that tag: `git log <tag>..HEAD`
   If there is no tag, this is the first release—summarize all changes up to this point.
3. Fill out `template.md` and save the notes to a file: write the Korean section first, then translate it into the English section while preserving meaning and keeping the same structure.

## Rules

- **Summarize.** Do not copy commit titles verbatim. Group related commits into meaningful units and describe in one line what the user gets.
- **Write from the user's perspective.** Describe user-facing outcomes rather than internal implementation details.
- **Remove noise.** Omit changes that do not affect users (refactors, build configuration, documentation).
- **Remove empty sections (in both Korean and English).** If a section has no items for this release, delete the heading as well.
- **Write bilingually (Korean + English).** The top section is Korean; the section below `---` is an English translation. Keep section/item structure aligned as much as possible.
- Leave the "Install / Upgrade" blocks (Korean "설치 / 업그레이드" and English "Install / Upgrade") exactly as in `template.md`; do not modify the `brew` commands.
