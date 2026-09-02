# Accessibility Audit Reference Guide (Healthcare UX)
This reference supports the **Accessibility Audit skill** by providing
practical checkpoints, rationale, and clinical considerations.
Use this document during audits to:
- Validate findings
- Clarify intent behind accessibility requirements
- Translate standards into actionable review questions
This is not a compliance checklist. It is a decision-support guide.
---
## How to Use This Reference
For each issue identified during an audit:
1. Identify the relevant domain below
2. Use the checkpoints to confirm validity
3. Use the rationale to explain *why the issue matters*
4. Use the clinical notes to assess risk and severity
---
## 1. Perceivable Content
### What to Check
- Text alternatives for images, icons, and charts
- Sufficient contrast between text and background
- Information not conveyed by color alone
- Clear visual hierarchy and grouping
### Why It Matters
Users with low vision, color blindness, or screen readers must be able to
perceive the same information as sighted users.
### Clinical Considerations
- Color-only status indicators can cause missed alerts
- Low contrast increases visual fatigue during long shifts
- Charts without text alternatives block assistive technology users entirely
---
## 2. Keyboard & Input Accessibility
### What to Check
- All interactive elements reachable by keyboard
- Logical and predictable focus order
- Visible focus indicators at all times
- No keyboard traps in modals or tables
### Why It Matters
Keyboard access is foundational for screen readers and alternative input devices.
### Clinical Considerations
- Interrupted focus during workflows causes task failure
- Keyboard-only users must complete critical actions without workarounds
---
## 3. Language, Labels, and Predictability
### What to Check
- Clear, plain language labels
- Consistent terminology across screens
- Predictable outcomes for actions
- Error messages that explain and guide recovery
### Why It Matters
Users must understand what the system is asking and what will happen next.
### Clinical Considerations
- Ambiguous language increases cognitive load
- Blame-oriented error messages reduce trust and adoption
---
## 4. Structure, Semantics, and Assistive Technology Support
### What to Check
- Proper heading hierarchy
- Meaningful landmarks and regions
- Correct semantic roles for buttons, links, and inputs
- Accessible table structure with headers and relationships
### Why It Matters
Assistive technologies rely on semantic structure to interpret content.
### Clinical Considerations
- Data tables without headers are unusable to screen readers
- Poor structure prevents navigation in dense interfaces
---
## 5. Forms and Data Entry
### What to Check
- Every input has a visible, associated label
- Required fields are clearly indicated
- Inline validation is accessible
- Error messages are announced to assistive technologies
### Why It Matters
Forms are a primary interaction surface in healthcare systems.
### Clinical Considerations
- Data entry errors can affect patient care or operations
- Recovery from errors must be fast and unambiguous
---
## 6. Status, Feedback, and System Messages
### What to Check
- Loading states are visible and descriptive
- Success and error messages are clear
- Status changes are announced to screen readers
- No silent failures
### Why It Matters
Users need continuous feedback to maintain confidence and trust.
### Clinical Considerations
- Silent delays are interpreted as system failure
- Clear feedback prevents repeated or duplicate actions
---
## 7. Motion, Timing, and Sensory Safety
### What to Check
- Motion can be reduced or disabled
- No flashing or rapid animations
- Time limits can be extended or avoided
- Transitions are predictable and non-disruptive
### Why It Matters
Some users experience motion sensitivity, seizures, or fatigue.
### Clinical Considerations
- Calm interfaces reduce stress in high-stakes environments
- Motion should never convey critical information alone
---
## 8. Cognitive Load and Task Complexity
### What to Check
- Tasks broken into clear steps
- Progressive disclosure of information
- Minimal simultaneous demands
- Recognition over recall
### Why It Matters
Cognitive accessibility supports users under stress, fatigue, or interruption.
### Clinical Considerations
- Cognitive overload increases error rates
- Simpler task flows improve safety and efficiency
---
## Severity Guidance (Reference)
Use this lens when assigning severity:
- **Critical**: Prevents task completion or introduces safety risk
- **High**: Major barrier without a reasonable workaround
- **Medium**: Partial barrier or increased effort
- **Low**: Minor issue, improvement opportunity
Severity should reflect **real-world impact**, not theoretical standards.
---
## When to Escalate (Reinforcement)
Escalate for expert review when:
- Patient-facing access is affected
- Clinical decisions rely on the interface
- Assistive technology behavior is uncertain
- Legal or regulatory exposure is possible
- Multiple high-severity issues appear together
Escalation protects users and the organization.
---
## Notes for AI-Assisted Audits
When using this reference in AI-driven workflows:
- Prefer observable issues over inferred intent
- Tie findings to specific UI elements or interactions
- Avoid generic “non-compliant” language
- Focus on impact and remediation
This reference exists to support **better audits**, not just more audits.
