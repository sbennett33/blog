%{
title: "Building a Simple Game Using the PETAL Stack",
author: "Scott Bennett",
tags: ["Elixir", "Phoenix", "LiveView"],
description: "Part 1: Introduction",
published: true
}

---

## Part 1: Introduction

A few months ago I found [this article](https://fly.io/pattern_matching/building-a-distributed-turn-based-game-system-in-elixir/) by [Mark Ericksen](https://twitter.com/brainlid) where he shared how he had built a distributed Tic-Tac-Toe game using Elixir and LiveView. You can find the code he wrote [here](https://github.com/fly-apps/tictac). I thought what he had shared was really cool and shared it on our Elixir Slack channel at work and promptly forgot about it. A few weeks later I was talking to my manager and he told me about an ice breaker game that they used to play in the office before everybody went remote called the "Magic Hat" game. In the "Magic Hat" game, everyone writes down an interesting fact about themselves on a piece of paper and drops it in a hat. Someone then picks a random fact out of the hat and everyone tries to guess who the fact was about. As soon as he told me about the game I thought it would make a great premise for a web app that we could use on our team or in our company for virtual ice breakers. So that's what I built 😄 . Major thanks to Mark Ericksen for his article and the code he released with it. It was a major help and inspiration for me as I developed this project. If you haven't already, please go read his article. It will help give you some context for what we're building.

In this series of articles I'll take you step by step through the process I went through to build this game. We'll be using the **PETAL** stack to build a simple real time distributed version of the "Magic Hat" game. We'll also look at hosting our game on [Fly.io](https://fly.io) which will allow us to easily and securely distribute our game around the globe. For anyone who has tried to distribute a web app across multiple datacenters it's pretty 🤯 what they're able to do.

For those who aren't familiar, the **PETAL** stack consists of:

- The **P**hoenix web framework
- The **E**lixir programming language
- **T**ailwind CSS for styling
- **A**lpine.js for lightweight JavaScript interactions
- **L**iveView to power the real time web experience

The **PETAL** stack makes it incredibly easy to build rich interactive web applications without a heavy JavaScript front-end or a bunch of custom CSS. LiveView is the real star of the show here. I've been looking for an excuse to play with it for a while and this project was the perfect excuse.

Stuff I'll be covering in this series of articles:

- Getting up and running with Phoenix and LiveView
- Adding Tailwind and Alpine.js to a Phoenix project
- Modeling the game state
- Writing a game server to manage the state
- Connecting Livebook to our app to interact with our game server
- Setting up our supervision tree with a distributed supervisor
- Using LiveView to create our web app that updates in real time
- Containerizing our Phoenix app
- Deploying our app to Fly.io
- Configuring our app for clustering and distributing around the globe using Fly.io
