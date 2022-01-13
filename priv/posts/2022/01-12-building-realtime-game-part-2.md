%{
title: "Building a Simple Game Using the PETAL Stack",
author: "Scott Bennett",
tags: ["Elixir", "Phoenix", "LiveView"],
description: "Part 2: Getting Started",
published: true
}

---

## Part 2: Getting Started

In [Part 1](/building-realtime-game-part-1) of this guide I gave an overview of the game we'll be building. In this article we'll get the tools we need installed and create our initial Phoenix project.

To get started building our app we're going to install Elixir and the Phoenix framework.

### Install asdf, Elixir and Erlang

My runtime manager of choice is [asdf](https://asdf-vm.com). It makes it super easy to install and manage many different runtimes and their various versions. We'll use [homebrew](https://brew.sh) to install asdf:

```bash
brew install asdf
```

Then we can install Elixir and Erlang. First we need to add the plugins:

```bash
asdf plugin add erlang
asdf plugin add elixir
```

Then we can install the versions of Elixir and Erlang that we'd like to use:

```bash
asdf install erlang 24.2
asdf install elixir 1.13.1-otp-24
```

You can verify that everything was installed properly by running:

```bash
elixir --version
```

You should see output similar to:

```bash
Erlang/OTP 24 [erts-12.2] [source] [64-bit] [smp:12:12] [ds:12:12:10] [async-threads:1] [jit]

Elixir 1.13.1 (compiled with Erlang/OTP 24)
```

### Install the Phoenix framework

Now that we've got Elixir and Erlang installed we can move on to getting the Phoenix framework installed. First we'll need to install the Hex package manager:

```bash
mix local.hex
```

With that installed we can install the Phoenix application generator:

```bash
mix archive.install hex phx_new
```

Congratulations! 🎉 You're now ready to start building Phoenix applications!

### Resources

If you got stuck anywhere in this process here are some helpful resources that go into more detail about each of the steps we just went through:

- [asdf Getting Started Guide](https://asdf-vm.com/guide/getting-started.html#_1-install-dependencies)
- [Phoenix Framework Installation Guide](https://hexdocs.pm/phoenix/installation.html)

### Create our Phoenix Application

All right! The time has finally come. We can create our initial Phoenix app and take it for a spin. Let's start by using one of the Mix tasks that we got from the Phoenix application generator to scaffold our app:

```bash
mix phx.new magic_hat --no-ecto
```

When prompted type `y` to install the app's dependencies.

We pass the `--no-ecto` flag since we're not going to need to get a database involved with this app. All of our game state will be kept completely in memory. But we're getting ahead of ourselves there. For more details on the `mix phx.new` Mix task check out the [docs](https://hexdocs.pm/phoenix/Mix.Tasks.Phx.New.html#content).

The next thing we'll want to do is `cd` into our newly created app directory and start it up!

```bash
cd magic_hat
mix phx.server
```

You should be able to visit `http://localhost:4000` and see your brand new app running in the browser. 🥳

![New Phoenix App](/images/new-phoenix-app.png)

That's it for now. In the next article we'll start writing some actual Elixir code and create the state for our game. Stay tuned!
