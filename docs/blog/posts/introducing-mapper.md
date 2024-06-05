---
draft: false
date: 2024-05-20
categories:
  - serverless
---

# Introducing mapper.dev

A web application for visualising software, data and infrastructure based on round-trip engineering.

<!-- more -->

## Problem Definition

### Show Me How This Works

More often than not when a technical person is asked to explain how a particular software solution works to someone else they will likely use a combination of walking through a code repository directory by directory or by clicking from one class or module to another and explain what they do, cobbled together static diagrams or one developer wants to show how a particular product works to another developer more often than not they will walk through a .  It is very much done by a bottom up approach.  This can be difficult to follow and following code can be a lot more complicated than following diagrams.  It can br argued that a top-down approach along the lines of "this system does this" and "is made up of these things" and "these parts are deployed here" etc.  The transfer of knowledge this way will be far more effective than walking through code.

## Solution

### Why mapper?

The definition of the verb map means to represent how the parts of something are organised or arranged.  This is what we want to do with mapper.dev, we are building a round-trip engineering solution which can be used for the visual representation of software, data and infrastructure.  We want to be able to generate visual representations of systems from plain text and when these representations are modified the underlying text is updated to reflect the changes made.  We want our application to be model independent.  We want the ability to be able to add modelling methods.  We want it to be top down (no longer should a developer walk through a code base).  Benefits (build and deploy quickly, communicate more effectively).

## Motivation

<!--![Bubble](./introducing-mapper/bubble.jpg){ align=left }-->

### Development to Support

In 2001 my first job after studying Engineering at University was working as a Java software developer for a small software house in London.  Being in the midst of the dot com bubble things were initially great, the development work was interesting, and I was learning loads.  Then came the burst and the development work quickly dried up, and my job changed from developing new applications to supporting existing ones.  I decided to leave software development after about 18 months and return to engineering, where I worked for the next 20 years - working with software and data on and off throughout.  I remember my manager at the time telling me it was a difficult jobs market and that there were not many opportunities - but nevertheless I wanted to make the break.

### Methods and Approaches

Back then, we used the [Rapid Application Development](https://en.wikipedia.org/wiki/Rapid_application_development) methodology (instead of the [Waterfall Method](https://en.wikipedia.org/wiki/Waterfall_model)) and we designed software using [Unified Modelling Language](https://en.wikipedia.org/wiki/Unified_Modeling_Language) (UML) and used the Gang of Four [Design Patterns](https://en.wikipedia.org/wiki/Design_Patterns) where we could.  Agile Development as a term was only just being coined with the [Manifesto for Agile Development](https://agilemanifesto.org/) being formed in the same year.

### Round Trip Engineering

We used the [Together](https://en.wikipedia.org/wiki/OpenText_Together) [Integrated Development Environment](https://en.wikipedia.org/wiki/Integrated_development_environment) (IDE) and considered upgrading to [Rational Rose](https://en.wikipedia.org/wiki/IBM_Rational_Rose) but costs prevented us from doing this at the time.  These IDEs included cutting edge [Round Trip Engineering](https://en.wikipedia.org/wiki/Round-trip_engineering) features such as the ability to generate [class diagrams](https://en.wikipedia.org/wiki/Class_diagram) from code and generate code from [sequence diagrams](https://en.wikipedia.org/wiki/Sequence_diagram) we created for example.  The round trip functionality meant that if a class diagram was generated from code, the diagram itself could be edited and the code would then automatically update to reflect the diagram changes.  Similarly, if a sequence diagram was created by adding actors, methods and return values to a visual diagram, the IDE was able to generate the skeleton code representing these interactions automatically - magic!

### Full Circle

Fast-forward 20 years later to 2023 and my career has come full circle.  After years working in engineering I decided to return to software development and found a position working as a Python developer.  I was eager to jump into the industry and excited to find out how the methodologies had progressed and how the tools have developed with them, since my initial experience in the early noughties.  I expected the round trip tools to have come on leaps and bounds and developers to be essentially writing less code and creating more diagrams.  UML usage seems to be reducing and new tools and approaches have come along - such as the [C4 model](https://c4model.com/) and [Business Process Model and Notation](https://en.wikipedia.org/wiki/Business_Process_Model_and_Notation) - but where is the 20 years worth of round trip engineering progress?  [Simulink](https://en.wikipedia.org/wiki/Simulink) (a graphical environment for modelling, simulating and analysing dynamical systems) has been around for 40 years.  It seems counter-intuitive.

### Open Source

We want people to see how good our product is and want them to have the ability to contribute.