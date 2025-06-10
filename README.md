# ConverseCore - an Apptainer based Slurm Module Builder

This slurm module uses the [flask_ollama_web](https://github.com/stela2502/flask_ollama_web) Flask web server to make the users ollama models available as a Slurm module.

It builds an apptainer image where the users .ollama folder is mounted, not integrated.

Each module the user has installed locally can/will be transfered to the server.
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

Afterwards you need to adjust the Makefile and define your deploy paths as fit for your environment.
And finally you can build the Slurm module using 

```
make deploy
```

# Usage

Assuming you have installed a version 1.0 of your slurm module you can start the ollama powered server using

```
ml ConverseCore/1.0
```

This should be run on a GPU enabled blade.


## Or even more elaborated (only woking on COSMOS-SENS):

```
/scale/gr01/shared/common/software/ConverseCore/1.0/start_AI_server.sh
```

This will handle submission and check if there is another server running at the moment,
reporting you how to connect to the server in the end.

If you change ``start_ConverseCore.sbatch`` to fit your server structure you can also use this script on any other slurm managed server system (hopefully).



