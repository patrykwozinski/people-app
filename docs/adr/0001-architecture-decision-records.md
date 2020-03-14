# Architecture Decision Records

* Status: accepted
* Deciders:
  * [@patrykwozinski](https://github.com/patrykwozinski/)
* Date: 2020-03-14

## Context and Problem Statement

In many of our applications, we have a problem with documenting application architecture things. We need to describe why we choose something, how about alternatives and why it is important for us.
> An architectural decision record (ADR) is a document that captures an important architectural decision made along with its context and consequences.

You can check example template [right there](/docs/adr/how-to/example_template.md). Don't worry - just choose boxes which are important for you and your decision. It's unnecessary to fill everything from this example.

## Considered Options

* ADR in the project
* Tettra page
* described decisions on Slack/other communication channel

## Decision Outcome
Suggested option is to write architecture decision records in project `./docs/adr` directory. It's close to the code and it's easy to track every changes.

### Positive Consequences

* architecture decisions close to the code
* easy to track changes
* easy to comment decisions (in pull requests)

### Negative Consequences

* we need to teach developers how and when ADR is needed

## Links
* [About ADRs](https://github.com/joelparkerhenderson/architecture_decision_record)
* [Markdown plugin for JetBrains IDE](https://plugins.jetbrains.com/plugin/7793-markdown)
