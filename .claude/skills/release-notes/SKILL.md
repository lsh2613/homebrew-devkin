---
name: release-notes
description: Guidelines and template for writing DevKin GitHub Release notes. Use this when preparing release notes for a new DevKin version.
---

# DevKin Release Notes

These are the rules for turning a list of commits into the body of a GitHub Release. Use `template.md` in the same directory as the template. The template is split into two sections: **Korean at the top / English below `---`**.

## Input

This skill summarizes commits that are **handed to it by the source repo's `release` skill** — that skill computes the previous tag and the commit range, then invokes this one.

The commits always come from the **DevKin source repository** (the repo with the `feat`/`fix` history), never from the `homebrew-devkin` distribution repo (which only holds cask and `release:` commits). If you do not have a commit list, you are at the wrong entry point — start from the source repo's `release` skill instead of computing tags here.

## Procedure

1. Fill out `template.md`: write the Korean section first, then translate it into the English section while preserving meaning and keeping the same structure.
2. Save the completed notes to a file.

## Rules

- **Summarize.** Do not copy commit titles verbatim. Group related commits into meaningful units and describe in one line what the user gets.
- **Write from the user's perspective.** Describe user-facing outcomes rather than internal implementation details.
- **Remove noise.** Omit changes that do not affect users (refactors, build configuration, documentation).
- **Remove empty sections (in both Korean and English).** If a section has no items for this release, delete the heading as well.
- **Write bilingually (Korean + English).** The top section is Korean; the section below `---` is an English translation. Keep section/item structure aligned as much as possible.
- Leave the "Install / Upgrade" blocks (Korean "설치 / 업그레이드" and English "Install / Upgrade") exactly as in `template.md`; do not modify the `brew` commands.
