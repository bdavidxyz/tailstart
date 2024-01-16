# Tailwind and Ruby-on-Rails starter kit

## Motivation

- Ruby-on-Rails is fantastic to deliver features
- Flowbite is fanastic to deliver extensible UI design (based on Tailwind)

Instead of having Rails with fantastic features (but without UI design),

and Flowbite with fantastic UI design (but without anything that _actually_ works),

What if we marry both?

* We have default login/logout flow that is beautiful by default
* We have beautiful flash messages by default
* We have secured, verified users
* We have a full test suite by default
* We have beautiful landing pages by default
* We have beautiful static pages (pricing, privacy, etc) by default
* We have tons of CSS components, blocks and pages ready to be integrated with our own custom feature

It's a UI design centric starter kit.


## Prerequisites

Tested under Linux-based system.

```shell
ruby --version
3.3.0

git --version
2.34.1

node --version
v20.9.0

psql --version
14.10
```
## Build

> chmod +x ./create.sh

## Drop all

> chmod +x ./reinit.sh

## Quick hacks (so far)

- Forced Rails version to 7.1.2 (in order to be sure what we're working on)
- Forced turbo-rails to 7.3.0 (or it will use a beta version of Turbo 8 that is not yet stable)
- Forced to answer "Y" to file overwritting, see https://github.com/rails/cssbundling-rails/issues/146
- Need to run "bundle update" to ensure bcrypt is installed