# ConverseCore - an Apptainer based Slurm Module Builder

This slurm module uses the [flask_ollama_web](https://github.com/stela2502/flask_ollama_web) Flase web server to make the users ollama models available as a Slurm module.

It therefore builds an apptainer image where the users .ollama is mounted, not integrated.

At the moemnt only the LLaMA 3 module is supported, but changing that should be very simple.
This is a prove of concept and a testing environment. Would be cool if it would help you, too!

# How to Build it

You can build the sandbox like that:

```
git clone https://github.com/stela2502/ConverseCore.git
cd ConverseCore
make restart
```

After this you can start the shell into the sandbox using

```
./shell.sh
```

Once everything is working as it should (should be already the case) you can build the image using

```
make build
```

Afterwards yopu need to adjust the Makefile and define your deploy paths as fit for your environment.
And finally you can build the Slurm module using 

```
make deploy
```

# Usage

Assuming you have installed a version 1.0 of your slurm module you can start the oolama powered server using

```
ml ConverseCore/1.0
```

This should be run on a GPU enabled blade.

# Todo

The web interface needs to handle users. At the moment it is a single user system with no security whatsoever.

