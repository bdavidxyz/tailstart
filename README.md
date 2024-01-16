
![Screenshot from 2024-01-16 18-33-54](https://github.com/bdavidxyz/flow/assets/2937888/7c486cb1-c5a4-46fb-8ee6-0f1ab033fbdb)

# Tailwind and Ruby-on-Rails starter kit

## Motivation

- Ruby-on-Rails is fantastic to deliver features - for free
- Flowbite is fanastic to deliver extensible Tailwind UI design - with a generous free tier.

Instead of having Rails with fantastic features (but without UI design),

and Flowbite with fantastic UI design (but without anything that _actually_ works behind the scene),

What if we marry both?

* We have a working authentication flow that is beautiful by default
* We have transactional emails that _already works_
* We have beautiful flash messages by default
* We have already designed, accessible form validation
* We have secured, verified users
* We have a full test suite by default
* We have beautiful landing pages by default
* We have beautiful static pages (pricing, privacy, etc) by default
* We have tons of CSS components, blocks and pages ready to be integrated with our own custom feature

Then we have a Rails, but UI design centric starter kit.

## Isn't Flowbite a 3rd-party dependency?

Actually Flowbite is just plain old Tailwind, so you're not really "locked" into an external dependency.

Of course if you buy their full package, you have access to more components than their free tier, which sounds fair!

I have **no affiliation** with them (so far), moreover, Flowbite decided to **offer paying components** that ends up in this starter kit - currently only a few of them. But I won't abuse of their generosity here, so this repo will rely on free components as much as possible.

So a big thanks to their team !

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

```shell
chmod +x ./create.sh
./create.sh
```

## Drop all and restart from fresh state

```shell
chmod +x ./reinit.sh
./create.sh
```

## Quick hacks (so far)

- Forced Rails version to 7.1.2 (in order to be sure what we're working on)
- Forced turbo-rails to 7.3.0 (or it will use a beta version of Turbo 8 that is not yet stable)
- Forced to answer "Y" to file overwritting, see https://github.com/rails/cssbundling-rails/issues/146
- Need to run "bundle update" to ensure bcrypt is installed
