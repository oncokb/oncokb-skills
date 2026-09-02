---
name: oncokb-ai-code-review
description: Run an AI-assisted pre-PR review that validates issue linkage, local quality gates, manageable scope, PR creation, and review comments.
---

## Scope

- Use for end-to-end AI code review on a branch before or during PR creation.
- Use this skill when the user asks for an AI review workflow, not just a single lint/test command.
- Keep the review auditable: report commands run, outcomes, and the final PR URL.

## Required skill chain

Follow this order and do not skip steps:

1. `oncokb-github-issues`
2. Local validation (format, lint, tests)
3. Manageability and scope review
4. `oncokb-database-review`
5. `oncokb-make-pull-request`
6. PR review comments prefixed with `[ai-generated]`
7. `oncokb-code-comments-standards`
8. `oncokb-test-planning-and-coverage`

## Workflow

1. Get the related GitHub issue first.
   - Start by invoking the `oncokb-github-issues` skill.
   - Ask for the issue associated with the change, or create/find it via that skill workflow.
   - Do not proceed to PR work without an issue link or issue ID.
   - Completion criterion: issue URL/ID is confirmed and ready to reference in the PR.

2. Run local quality gates.
   - Run all project formatting, linting, and test commands that apply to the changed code.
   - Discover commands from the project environment (for example package scripts, Make targets, Gradle/Maven tasks, or other repo-standard tooling).
   - If any command fails, stop and report failures before opening/updating the PR.
   - Completion criterion: formatting, lint, and tests all complete with no errors.

3. Check that the change is manageable.
   - Verify the change is atomic: one focused feature/fix/refactor and no unrelated scope.
   - Verify only relevant files are included for that purpose.
   - Measure diff size against soft limits:
     - under 500 changed lines of source code
     - under 20 changed source files
   - If soft limits are exceeded or scope is mixed, recommend a PR stack split plan.
   - Completion criterion: reviewer can clearly see either (a) manageable scope or (b) a concrete split recommendation.

4. Review database access risks.
   - Invoke `oncokb-database-review` and assess changed DB access for N+1 query risks, SQL injection risks, and deterministic pagination ordering.
   - If paging exists, require `ORDER BY` to include a unique tie-breaker (for example `id` or another unique key).
   - Add `[ai-generated]` review comments for any blockers or high-value follow-ups from the database review.
   - Completion criterion: database-review findings are documented and actionable.

5. Create or update the PR.
   - Invoke the `oncokb-make-pull-request` skill to create/update PR metadata and body.
   - Include the issue reference from step 1 in related issues (`Fixes #...` or `Refs #...` as appropriate).
   - Completion criterion: PR exists with correct metadata and issue linkage.

6. Add AI review comments on the PR.
   - Post review comments that begin with `[ai-generated]`.
   - Keep comments specific, actionable, and tied to files/lines or clear review concerns.
   - Do not post vague praise-only comments.
   - Completion criterion: PR contains useful `[ai-generated]` review comments or an explicit no-issues-found note.

7. Review code comments quality.
   - Invoke `oncokb-code-comments-standards` and assess whether comments explain non-obvious logic, invariants, and decisions.
   - Add `[ai-generated]` PR comments for missing or weak comments in non-trivial areas.
   - Completion criterion: comment-quality findings are documented in the PR.

8. Review testing adequacy.
   - Invoke `oncokb-test-planning-and-coverage` and assess whether tests are sufficient for changed behavior and risk.
   - Add `[ai-generated]` PR comments for missing high-value tests or coverage gaps.
   - Completion criterion: test-coverage findings are documented in the PR.

## Output requirements

- Report:
  - issue reference used
  - formatting/lint/test commands run and outcomes
  - scope metrics (source lines changed, source files changed)
  - manageable vs needs-split decision
  - database review findings (N+1, injection, pagination determinism, and key follow-ups)
  - PR URL
  - count and summary of `[ai-generated]` comments posted
- If work is blocked (permissions, failing checks, missing issue), report the exact blocker and the next command or action needed.

## Quality bar

- Never claim a command passed unless it was actually run.
- Never create/update a PR without an issue reference.
- Treat 500 lines and 20 source files as soft limits: recommend PR stacking when exceeded.
- Keep all automated review comments clearly marked with `[ai-generated]` at the start.
