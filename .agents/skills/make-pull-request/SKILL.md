---
name: make-pull-request
description: Create or update a GitHub pull request with clear context, correct metadata, and a shareable URL.
---

## Scope

- Use for pull request work only: drafting, creating, updating, and validating PR metadata.
- Prefer `gh` CLI for all GitHub PR operations.
- Preserve repository conventions for title format, labels, reviewers, milestones, and linked issues.
- Do not merge PRs unless the user explicitly asks.

## Core policy

- Collect required PR content from the user; do not assume missing details.
- You may recommend defaults, but wait for user confirmation before using recommended values.
- If information is missing, ask one grouped question covering all missing inputs.
- Require at least one user-confirmed PR tag (label) when creating a PR.

## Workflow

1. Confirm target and readiness.
   - Identify the repository, current branch, and target base branch.
   - Check working tree status before PR creation.
   - If there are uncommitted changes, ask whether to include them before proceeding.
   - If no upstream branch exists, push with upstream tracking first.
   - Confirm PR kind (`feature`, `fix`, `documentation`, `chore`) with the user.
   - Completion criterion: source branch, base branch, and commit range are explicit and ready.

2. Build accurate PR context.
   - Review commit history and diff versus base branch.
   - Ask the user to provide: what changed, why it changed, and user-visible impact.
   - Ask for risk areas, migration notes, and rollout notes if applicable.
   - You may propose draft phrasing based on diff context, but require user confirmation before finalizing PR body text.
   - Completion criterion: PR title/body content can be written from verified branch changes.

3. Draft title and body.
   - Write a specific, searchable PR title aligned with repository style using user-provided details.
   - Use the template that matches the confirmed PR kind.
   - Include only user-provided facts in summary, rationale, testing, and follow-ups.
   - Link related issues (`Fixes #123` style) only when the user provides issue references explicitly.
   - Completion criterion: a reviewer can understand intent, scope, and verification steps without opening local diffs.

4. Create or update PR via `gh`.
   - Create with `gh pr create` when no PR exists.
   - Update existing PR with `gh pr edit` when the branch already has one.
   - For new PRs, fetch repository labels and ask the user to choose at least one tag.
   - In `oncokb/oncokb-skills`, recommend tags from the supported set below and let the user confirm the final selection.
   - Apply requested metadata (reviewers, assignees, labels, milestone, draft/ready state).
   - Completion criterion: PR is present on GitHub with correct metadata and body.

5. Validate and report.
   - Confirm PR URL, state (draft/ready), base/head branches, and linked issues.
   - Report any failed checks, missing permissions, or metadata that could not be applied.
   - Completion criterion: user has PR URL plus a clear status and next actions.

## Required prompt

Before creating or updating a PR, ask one grouped question for any missing inputs:

- PR kind: `feature`, `fix`, `documentation`, or `chore`
- PR title
- PR body facts (problem, approach, scope, risks, rollout)
- Testing performed and exact commands/results to report
- Related issue links/IDs to reference
- Metadata to apply: reviewers, assignees, labels (at least one required for new PRs), milestone, draft/ready state

## PR templates

Use the matching template for the PR kind confirmed by the user.

### Feature

- Title: `Feature: <concise capability>`
- Body sections:
  - Summary
  - Problem or opportunity
  - Implementation approach
  - Testing
  - Risk / Rollout
  - Related issues

### Fix

- Title: `Fix: <concise defect>`
- Body sections:
  - Summary
  - Problem
  - Root cause
  - Fix approach
  - Testing (including reproduction coverage)
  - Risk / Rollout
  - Related issues

### Documentation

- Title: `Docs: <topic updated>`
- Body sections:
  - Summary
  - Documentation gap
  - What changed
  - Validation (render/build/link checks)
  - Audience impact
  - Related issues

### Chore

- Title: `Chore: <maintenance task>`
- Body sections:
  - Summary
  - Maintenance context
  - Scope
  - Validation
  - Risk / Rollout
  - Related issues

## Supported tags for `oncokb/oncokb-skills`

When the repository is `oncokb/oncokb-skills`, use these tags as the recommended choices and ask the user to pick one or more:

- `major` (major changes)
- `feature` (new features)
- `enhancement` (enhancements)
- `fix`, `bugfix`, `bug` (bug fixes)
- `performance` (performance tweaks)
- `style tweak` (style tweaks)
- `documentation` (documentation)
- `cleanup` (cleanup)
- `devops` (testing, configuration, deployment)
- `chore`, `dependencies` (maintenance)

If a user requests a tag outside this set, check whether the label exists in the repository and confirm before applying it.

## Quality bar

- Never invent test results; only report commands actually run and their outcomes.
- Keep titles and bodies concrete; avoid placeholders and vague summaries.
- Ensure every non-trivial commit in the branch is represented in PR context.
- Do not create a PR without at least one confirmed tag (label).
- Flag blockers early: no push permission, missing reviewers, branch protections, or missing repo access.
