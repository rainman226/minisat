# Formal verification using MiniSat

In this project we will be looking into the implementation of **MiniSat**, a popular SAT solver, to figure out how this works. Our goal is to better understand how it implements the algorithms and how they work, and also runing some benchmarks to see how it behaves. A video explaining the technical part is available [here](https://youtu.be/NZ37P3IyjR4).

## What is MiniSat?

MiniSat is a lightweight and super-efficient SAT solver that's often used in formal verification, AI, and other fields. It takes logical formulas in CNF (Conjunctive Normal Form) and tries to tell if they're satisfiable or not. It's a very good starting point for people interested getting started on SAT.

## Getting started: Installing MiniSat

We recommend running MiniSat on a Linux enviroment, as it's easier to install and compile compared to Windows.

There are 2 ways: installing it directly using the command line, or downloading and building the tool.

Using the command line, just type:

```bash
sudo apt install minisat
```

If you want to build it yourself, first clone the repository of MiniSat:

```bash
git clone https://github.com/niklasso/minisat.git
cd minisat
```

And then build it:

```bash
mkdir build && cd build
cmake .. && make
```

## About the benchmarks

For our tests, we're using the **[Cryptography-Simon](https://benchmark-database.de/?track=main_2024&family=cryptography-simon)** benchmark family from the **[SAT Competition 2024](https://satcompetition.github.io/2024/)**. These benchmarks are specifically designed for evaluating SAT solvers in cryptographic contexts.

To run the script easier, we've written a script, ```run_minisat.sh```. To use it first go into the benchmarks folder and run it like this:

```bash
cd benchmarks
./run_minisat.sh
```

For each file we have set a run time of ```24 / number_of_benchmarks``` so it all runs in 24 hours, it his case we have ~4 hours/bechmark file. Each file will have an output file with the coresponding output of minisat, and all console messages will be printed into the ```console_log``` file.

